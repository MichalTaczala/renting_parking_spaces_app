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


@booking_bp.route("/booking/<int:booking_id>", methods=["GET"])
def get_booking(booking_id):
    """Endpoint for retrieving booking information."""
    # Retrieve booking from the database based on booking_id
    with get_session() as session:
        try:
            booking = session.query(Booking).filter(Booking.booking_id == booking_id).first()
            if booking:
                # Return booking information
                return (
                    jsonify(
                        {
                            "booking_start": booking.booking_start,
                            "booking_end": booking.booking_end,
                            "status": booking.status,
                            "price_total": booking.price_total,
                            "user_id": booking.user_id,
                            "offer_id": booking.offer_id,
                        }
                    ),
                    200,
                )
            else:
                return jsonify({"message": "Booking not found"}), 404
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500
