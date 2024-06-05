import requests
from flask import Flask, request, jsonify
from flask import Blueprint
from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError
from db_conn import get_session
from models import ParkingSpot, Address, Booking, RentalOffer
import random


parkingspot_bp = Blueprint("parking_spot", __name__)


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
            return jsonify({"message": "Successfully created new parking spot!"}), 200
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
                data = spot.to_dict()
                data["address"] = address.to_dict()

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


### START EXPERIMENT
import math
from datetime import datetime
from sqlalchemy import and_, not_, or_
from sqlalchemy.orm import aliased


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

    def calculate_distance(lat1, long1, lat2, long2):
        """Calculate the Haversine distance between two points on the earth."""
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

    with get_session() as session:
        try:
            # Get the alias for the Booking and RentalOffer models
            booking_alias = aliased(Booking)
            rental_offer_alias = aliased(RentalOffer)
            # Base query for available parking spots
            base_query = (
                session.query(ParkingSpot)
                .join(
                    rental_offer_alias,
                    ParkingSpot.spot_id == rental_offer_alias.spot_id,
                )
                .filter(rental_offer_alias.status == "active")
            )
            # Filter by date range if provided
            if start_date and end_date:
                base_query = base_query.filter(
                    and_(
                        rental_offer_alias.start_date <= end_date,
                        rental_offer_alias.end_date >= start_date,
                        not_(
                            ParkingSpot.spot_id.in_(
                                session.query(booking_alias.offer_id)
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
                sorted_parking_spots = parking_spots_with_distance[:20]
                response_data = [
                    {
                        "spot_id": spot[0].spot_id,
                        "name": spot[0].name,
                        "description": spot[0].description,
                        "height": spot[0].height,
                        "width": spot[0].width,
                        "length": spot[0].length,
                        "internal": spot[0].internal,
                        "easy_access": spot[0].easy_access,
                        "security": spot[0].security,
                        "charging": spot[0].charging,
                        "owner_id": spot[0].owner_id,
                        "address_id": spot[0].address_id,
                        "price": spot[0].price,
                        "currency": spot[0].currency,
                        "imagesURL": spot[0].images_url,
                        "distance": spot[1],  # Add distance to the response
                    }
                    for spot in sorted_parking_spots
                ]
            else:
                response_data = [
                    {
                        "spot_id": spot.spot_id,
                        "name": spot.name,
                        "description": spot.description,
                        "height": spot.height,
                        "width": spot.width,
                        "length": spot.length,
                        "internal": spot.internal,
                        "easy_access": spot.easy_access,
                        "security": spot.security,
                        "charging": spot.charging,
                        "owner_id": spot.owner_id,
                        "address_id": spot.address_id,
                        "price": spot.price,
                        "currency": spot.currency,
                        "imagesURL": spot.images_url,
                    }
                    for spot in available_parking_spots[:20]
                ]

            return jsonify(response_data), 200

        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500


# Temporal endpoint for displaying all parking spots
@parkingspot_bp.route("/parking_spots/all_simple", methods=["GET"])
def get_parking_spots():
    """Endpoint for retrieving all parking spots."""
    with get_session() as session:
        try:
            parking_spots = session.query(ParkingSpot).all()

            random.shuffle(parking_spots)
            # Select the first 5 parking spots
            random_parking_spots = parking_spots[:20]
            return (
                jsonify(
                    [
                        {
                            "spot_id": spot.spot_id,
                            "name": spot.name,
                            "description": spot.description,
                            "height": spot.height,
                            "width": spot.width,
                            "length": spot.length,
                            "internal": spot.internal,
                            "easy_access": spot.easy_access,
                            "security": spot.security,
                            "charging": spot.charging,
                            "owner_id": spot.owner_id,
                            "address_id": spot.address_id,
                            "price": spot.price,
                            "currency": spot.currency,
                            "imagesURL": spot.images_url,
                        }
                        for spot in random_parking_spots
                    ]
                ),
                200,
            )
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500
