import requests
from flask import Flask, request, jsonify
from flask import Blueprint
from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError
from db_conn import get_session
from models import ParkingSpot, Address
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


# Temporal endpoint for displaying all parking spots
@parkingspot_bp.route("/parking_spots/all", methods=["GET"])
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
                            "description": spot.description,
                            "size": spot.size,
                            "parking_no": spot.parking_no,
                            "availability": spot.availability,
                            "internal": spot.internal,
                            "wide_spot": spot.wide_spot,
                            "easy_access": spot.easy_access,
                            "level": spot.level,
                            "security": spot.security,
                            "charging": spot.charging,
                            "owner_id": spot.owner_id,
                            "address_id": spot.address_id,
                        }
                        for spot in random_parking_spots
                    ]
                ),
                200,
            )
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500


# TODO: Create an endpoint for getting top k parking spots based on the user location
