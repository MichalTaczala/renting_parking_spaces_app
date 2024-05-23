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
