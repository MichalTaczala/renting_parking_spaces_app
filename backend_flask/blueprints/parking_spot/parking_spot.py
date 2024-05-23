import requests
from flask import Flask, request, jsonify
from flask import Blueprint
from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError
from db_conn import get_session
from models import ParkingSpot
import random


parkingspot_bp = Blueprint("parking_spot", __name__)


@parkingspot_bp.route("/parking_spots/create", methods=["POST"])
def create_parking_spot():
    """Endpoint for creating a parking spot."""
    if not request.is_json:
        return jsonify({"message": "Missing JSON in request"}), 400

    data = request.get_json()

    # Create a new parking spot
    new_parking_spot = ParkingSpot(
        description=data.get("description"),
        size=data.get("size"),
        parking_no=data.get("parking_no"),
        availability=data.get("availability"),
        internal=data.get("internal"),
        wide_spot=data.get("wide_spot"),
        easy_access=data.get("easy_access"),
        level=data.get("level"),
        security=data.get("security"),
        charging=data.get("charging"),
        owner_id=data.get("owner_id"),
        address_id=data.get("address_id"),
    )

    # Add to the db
    with get_session() as session:
        try:
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
    # Retrieve parking spot from the database based on spot_id
    with get_session() as session:
        try:
            spot = session.query(ParkingSpot).filter(ParkingSpot.spot_id == spot_id).first()
            if spot:
                # Update parking spot information
                spot.description = data.get("description", spot.description)
                spot.size = data.get("size", spot.size)
                spot.parking_no = data.get("parking_no", spot.parking_no)
                spot.availability = data.get("availability", spot.availability)
                spot.internal = data.get("internal", spot.internal)
                spot.wide_spot = data.get("wide_spot", spot.wide_spot)
                spot.easy_access = data.get("easy_access", spot.easy_access)
                spot.level = data.get("level", spot.level)
                spot.security = data.get("security", spot.security)
                spot.charging = data.get("charging", spot.charging)
                session.commit()
                return jsonify({"message": "Parking spot information updated successfully"}), 200
            else:
                return jsonify({"message": "Parking spot not found"}), 404
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500
        
        
@parkingspot_bp.route("/parking_spots/<int:spot_id>", methods=["GET"])
def get_parking_spot(spot_id):
    """Endpoint for retrieving parking spot information."""
    # Retrieve parking spot from the database based on spot_id
    with get_session() as session:
        try:
            spot = session.query(ParkingSpot).filter(ParkingSpot.spot_id == spot_id).first()
            if spot:
                # Return parking spot information
                return (
                    jsonify(
                        {
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
                        }
                    ),
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
            spot = session.query(ParkingSpot).filter(ParkingSpot.spot_id == spot_id).first()
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
            random_parking_spots = parking_spots[:5]
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
                            "address_id": spot.address_id
                        }
                        for spot in parking_spots
                    ]
                ),
                200,
            )
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500
