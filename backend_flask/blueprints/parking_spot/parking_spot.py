import requests
from flask import Flask, request, jsonify
from flask import Blueprint
from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError
from db_conn import get_session
from models import ParkingSpot


parkingspot_bp = Blueprint("parking_spot", __name__)


@parkingspot_bp.route("/create_parking_spot", methods=["POST"])
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