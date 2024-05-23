import requests
from flask import Flask, request, jsonify
from flask import Blueprint
from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError
from db_conn import get_session
from models import ParkingSpot
import random
from models import Booking


booking_bp = Blueprint("booking", __name__)

@booking_bp.route("/booking/create", methods=["POST"])
def create_booking():
    """Endpoint for creating a booking for a parking spot."""
    if not request.is_json:
        return jsonify({"message": "Missing JSON in request"}), 400

    data = request.get_json()

    # Create a new booking
    new_booking = Booking(
        booking_start=data.get("booking_start"),
        booking_end=data.get("booking_end"),
        status=data.get("status"),
        price_total=data.get("price_total"),
        user_id=data.get("user_id"),
        offer_id=data.get("offer_id")
    )

    # Add to the db
    with get_session() as session:
        try:
            session.add(new_booking)
            session.commit()
            return jsonify({"message": "Successfully created new booking!"}), 200
        except Exception as e:
            return jsonify({"message": str(e)}), 400
