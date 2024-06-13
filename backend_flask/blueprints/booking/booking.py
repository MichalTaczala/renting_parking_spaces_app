"""Blueprint for booking endpoints."""

from flask import request, jsonify
from flask import Blueprint
from sqlalchemy.exc import SQLAlchemyError
from db_conn import get_session
from models import Booking, RentalOffer


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
        offer_id=data.get("offer_id"),
    )

    # Create a new rental offer
    new_rental_offer = RentalOffer(
        offer_id=data.get("offer_id"),
        auto_accept=True,
        spot_id=data.get("offer_id"),
        created_at=data.get("booking_start"),  # unused
        price=data.get("price_total"),  # unused
        start_date=data.get("booking_start"),  # unused
        end_date=data.get("booking_end"),  # unused
        status="active",  # unused
    )

    # Add to the db
    with get_session() as session:
        try:
            session.add(new_booking)
            session.add(new_rental_offer)
            session.commit()
            return jsonify({"message": "Successfully created new booking!"}), 200
        except Exception as e:
            return jsonify({"message": str(e)}), 400


@booking_bp.route("/booking/<int:booking_id>", methods=["GET"])
def get_booking(booking_id):
    """Endpoint for retrieving booking information based on booking_id."""
    with get_session() as session:
        try:
            booking = (
                session.query(Booking).filter(Booking.booking_id == booking_id).first()
            )
            if booking:
                # Return booking information
                return booking.json, 200
            return jsonify({"message": "Booking not found"}), 404
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500
