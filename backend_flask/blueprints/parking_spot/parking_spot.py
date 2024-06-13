import math
import random
from datetime import datetime, timedelta

import requests
from flask import Flask, request, jsonify
from flask import Blueprint
from sqlalchemy import and_, not_, or_
from sqlalchemy.orm import Session, aliased
from sqlalchemy.exc import SQLAlchemyError
from google.cloud import storage

from db_conn import get_session
from models import ParkingSpot, Address, Booking#, RentalOffer

# Settings
MAX_IMAGES_PER_PARKING_SPOT = 5
MAX_SPOTS_PER_PAGE = 20
client = storage.Client.from_service_account_json("../terraform_conf/key_app.json")
bucket_name = "parking-images-test"

parkingspot_bp = Blueprint("parking_spot", __name__)


def calculate_distance(lat1, long1, lat2, long2):
    """Calculate the Haversine distance between two points on the earth."""
    try:
        R = 6371  # Radius of the Earth in kilometers
        dlat = math.radians(lat2 - lat1)
        dlong = math.radians(long2 - long1)
        a = (
            math.sin(dlat / 2) ** 2
            + math.cos(math.radians(lat1))
            * math.cos(math.radians(lat2))
            * math.sin(dlong / 2) ** 2
        )
        c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
        distance = R * c
        return distance
    except Exception as e:
        return 0


def get_list_of_images(spot_id: int):
    """Get a list of image URLs for a parking spot."""
    directory_name = f"{spot_id}/"
    try:
        bucket = client.bucket(bucket_name)
        blobs = bucket.list_blobs(prefix=directory_name)
        image_urls = []
        for blob in blobs:
            url = blob.generate_signed_url(expiration=timedelta(hours=1))
            # URL valid for 1 hour
            image_urls.append(url)
        return image_urls
    except Exception as e:
        return str(e)


@parkingspot_bp.route("/parking_spots/<int:spot_id>/upload_images", methods=["POST"])
def upload_images(spot_id):
    """Endpoint for uploading images for a specific parking spot."""
    # Retrieve parking spot from the database based on spot_id
    with get_session() as session:
        try:
            spot = (
                session.query(ParkingSpot)
                .filter(ParkingSpot.spot_id == spot_id)
                .first()
            )
            if spot:
                images = []
                i = 0
                for i in range(0, MAX_IMAGES_PER_PARKING_SPOT):
                    image = request.files.get(f"image{i}")
                    if not image:
                        break
                    images.append(image)
                    i += 1
                if len(images) == 0:
                    return jsonify({"error": "Image file is required"}), 400
                try:
                    bucket = client.bucket(bucket_name)
                    for image in images:
                        blob = bucket.blob(f"{spot_id}/{image.filename}")
                        blob.upload_from_file(image)
                    return (
                        jsonify(
                            {
                                "message": f"Images uploaded successfully for parking spot {spot_id}"
                            }
                        ),
                        201,
                    )
                except Exception as e:
                    return jsonify({"error": str(e)}), 500
            else:
                return jsonify({"message": "Parking spot not found"}), 404
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500


@parkingspot_bp.route("/parking_spots/create", methods=["POST"])
def create_parking_spot():
    """Endpoint for creating a parking spot."""
    if not request.is_json:
        return jsonify({"message": "Missing JSON in request"}), 400

    data = request.get_json()
    # retrieve address data from nested json
    address_data = data.get("address")
    # TODO: remove redundancy in address records (check if it already exists)
    # TODO: create this dir in Cloud Storage

    # Create a new address
    with get_session() as session:
        try:
            new_address = Address(
                long=address_data.get("long"),
                lat=address_data.get("lat"),
                street=address_data.get("street"),
                house_no=address_data.get("house_no"),
                postal_code=address_data.get("postal_code"),
                city=address_data.get("city"),
                region=address_data.get("region"),
                district=address_data.get("district"),
                country=address_data.get("country"),
            )
            session.add(new_address)
            session.commit()
            address_id = new_address.address_id
        except Exception as e:
            return jsonify({"message": str(e)}), 400
    # Create a new parking spot
    with get_session() as session:
        try:
            new_parking_spot = ParkingSpot(
                name=data.get("name"),
                description=data.get("description"),
                height=data.get("height"),
                width=data.get("width"),
                length=data.get("length"),
                internal=data.get("internal", False),
                easy_access=data.get("easy_access", False),
                security=data.get("security", False),
                charging=data.get("charging", False),
                owner_id=data.get("owner_id"),
                address_id=address_id,
                price=data.get("price"),
                currency=data.get("currency", "USD"),
                images_url=data.get("images_url"),
            )
            session.add(new_parking_spot)
            session.commit()
            return (
                jsonify(
                    {
                        "message": "Successfully created new parking spot!",
                        "parking_id": new_parking_spot.spot_id,
                    }
                ),
                200,
            )
        except Exception as e:
            return jsonify({"message": str(e)}), 400


@parkingspot_bp.route("/parking_spots/<int:spot_id>", methods=["PUT"])
def update_parking_spot(spot_id):
    """Endpoint for updating parking spot information."""
    if not request.is_json:
        return jsonify({"message": "Missing JSON in request"}), 400
    data = request.get_json()
    address_data = data.get("address")
    # Retrieve parking spot from the database based on spot_id
    with get_session() as session:
        try:
            spot = (
                session.query(ParkingSpot)
                .filter(ParkingSpot.spot_id == spot_id)
                .first()
            )
            if spot:
                # Update parking spot information
                spot.name = data.get("name", spot.name)
                spot.description = data.get("description", spot.description)
                spot.height = data.get("height", spot.height)
                spot.width = data.get("width", spot.width)
                spot.length = data.get("length", spot.length)
                spot.internal = data.get("internal", spot.internal)
                spot.easy_access = data.get("easy_access", spot.easy_access)
                spot.security = data.get("security", spot.security)
                spot.charging = data.get("charging", spot.charging)
                spot.owner_id = data.get("owner_id", spot.owner_id)
                spot.address_id = data.get(
                    "address_id", spot.address_id
                )  # TODO: update this instead of using the same address
                spot.price = data.get("price", spot.price)
                spot.currency = data.get("currency", spot.currency)
                # spot.images_url = data.get("images_url", spot.images_url)

                session.commit()
                return (
                    jsonify(
                        {"message": "Parking spot information updated successfully"}
                    ),
                    200,
                )
            else:
                return jsonify({"message": "Parking spot not found"}), 404
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500


@parkingspot_bp.route("/parking_spots/<int:spot_id>", methods=["GET"])
def get_parking_spot(spot_id):
    """Endpoint for retrieving single parking spot information."""
    # Retrieve query parameters
    user_lat = request.args.get("lat")
    user_long = request.args.get("long")
    user_lat = float(user_lat) if user_lat else None
    user_long = float(user_long) if user_long else None
    image_urls = get_list_of_images(spot_id)
    # Retrieve parking spot from the database based on spot_id
    with get_session() as session:
        try:
            spot = (
                session.query(ParkingSpot)
                .filter(ParkingSpot.spot_id == spot_id)
                .first()
            )
            if spot:
                # Return parking spot information
                address = (
                    session.query(Address)
                    .filter(Address.address_id == spot.address_id)
                    .first()
                )
                spot_lat = float(address.lat)
                spot_long = float(address.long)
                distance = calculate_distance(user_lat, user_long, spot_lat, spot_long)
                data = spot.to_dict()
                data["address"] = address.dict
                data["distance"] = distance
                data["image_urls"] = image_urls

                return (
                    jsonify(data),
                    200,
                )
            else:
                return jsonify({"message": "Parking spot not found"}), 404
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500


@parkingspot_bp.route("/parking_spots/<int:spot_id>", methods=["DELETE"])
def delete_parking_spot(spot_id):
    """Endpoint for deleting a parking spot."""
    # Retrieve parking spot from the database based on spot_id
    with get_session() as session:
        try:
            spot = (
                session.query(ParkingSpot)
                .filter(ParkingSpot.spot_id == spot_id)
                .first()
            )
            if spot:
                # Delete the parking spot
                session.delete(spot)
                session.commit()
                return jsonify({"message": "Parking spot deleted successfully"}), 200
            else:
                return jsonify({"message": "Parking spot not found"}), 404
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500


@parkingspot_bp.route("/parking_spots/all", methods=["GET"])
def get_parking_spots():
    """Endpoint for retrieving all parking spots."""
    # Retrieve query parameters
    start_date_str = request.args.get("startDate")
    end_date_str = request.args.get("endDate")
    user_lat = request.args.get("lat")
    user_long = request.args.get("long")

    user_lat = float(user_lat) if user_lat else None
    user_long = float(user_long) if user_long else None

    start_date = (
        datetime.strptime(start_date_str, "%Y-%m-%d") if start_date_str else None
    )
    end_date = datetime.strptime(end_date_str, "%Y-%m-%d") if end_date_str else None

    with get_session() as session:
        try:
            # Get the alias for the Booking and RentalOffer models
            booking_alias = aliased(Booking)
            # rental_offer_alias = aliased(RentalOffer)
            # Base query for available parking spots
            base_query = (
                session.query(ParkingSpot)
                # .join(
                #     rental_offer_alias,
                #     ParkingSpot.spot_id == rental_offer_alias.spot_id,
                # )
                # .filter(rental_offer_alias.status == "active")
            )
            # Filter by date range if provided
            if start_date and end_date:
                base_query = base_query.filter(
                    and_(
                        # rental_offer_alias.start_date <= end_date,
                        # rental_offer_alias.end_date >= start_date,
                        not_(
                            ParkingSpot.spot_id.in_(
                                session.query(booking_alias.offer_id)  # REMEMBER: offer_id is spot_id!!!
                                .filter(
                                    and_(
                                        booking_alias.booking_start <= end_date,
                                        booking_alias.booking_end >= start_date,
                                        booking_alias.status == "confirmed",
                                    )
                                )
                                .subquery()
                            )
                        ),
                    )
                )

            available_parking_spots = base_query.all()

            # Sort the parking spots by distance to the user's location if coordinates are provided
            if user_lat is not None and user_long is not None:
                parking_spots_with_distance = [
                    (
                        spot,
                        calculate_distance(
                            user_lat,
                            user_long,
                            float(spot.address.lat),
                            float(spot.address.long),
                        ),
                    )
                    for spot in available_parking_spots
                ]
                parking_spots_with_distance.sort(key=lambda x: x[1])
                sorted_parking_spots = parking_spots_with_distance[:MAX_SPOTS_PER_PAGE]
                response_data = []
                # add each parking spot dict with address dict
                for spot, distance in sorted_parking_spots:
                    data = spot[0].to_dict()
                    address_id = spot.address_id
                    # retrieve address data from the database
                    address = (
                        session.query(Address).filter(Address.address_id == address_id).first()
                    )
                    data["address"] = address.dict
                    data["distance"] = distance
                    data["image_urls"] = get_list_of_images(spot.spot_id)
                    response_data.append(data)
            else:
                response_data = []
                # for each parking spot retrieve address data from the database
                for spot in available_parking_spots[:MAX_SPOTS_PER_PAGE]:
                    data = spot.to_dict()
                    address_id = spot.address_id
                    address = (
                        session.query(Address).filter(Address.address_id == address_id).first()
                    )
                    data["address"] = address.dict
                    data["image_urls"] = get_list_of_images(spot.spot_id)
                    response_data.append(data)
            return jsonify(response_data), 200

        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500
