import requests
from flask import Flask, request, jsonify
from flask import Blueprint
from models import User
from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError
from db_conn import get_session
from models import User, ParkingSpot, Address, RentalOffer, Booking

# import firebase_admin
# from firebase_admin import auth, credentials


user_bp = Blueprint("user", __name__)


@user_bp.route("/users/create", methods=["POST"])
def create_user():
    """Endpoint for creating a new user."""
    if not request.is_json:
        return jsonify({"message": "Missing JSON in request"}), 400

    data = request.get_json()

    # check if all required fields are present
    if any([data.get(field) is None for field in User.required_fields]):
        return jsonify({"message": "Missing required fields"}), 400

    # check if the user already exists by firebase token
    with get_session() as session:
        try:
            existing_user = (
                session.query(User)
                .filter_by(firebase_token=data.get("firebase_token"))
                .first()
            )
            if existing_user:
                return (
                    jsonify({"message": "User already exists!"}),
                    200,
                )

            # create a new user
            new_user = User(
                firebase_token=data.get("firebase_token"),
                username=data.get("username"),
                first_name=data.get("first_name"),
                last_name=data.get("last_name"),
                email=data.get("email"),
                type=data.get("type"),
                phone_prefix=data.get("phone_prefix"),
                phone=data.get("phone"),
            )
            session.add(new_user)
            session.commit()
            return jsonify({"message": "Successfully created new user!"}), 200
        except Exception as e:
            return jsonify({"message": str(e)}), 400


# TODO: make it private eg. with a token required decorator
@user_bp.route("/users/all", methods=["GET"])
def get_users():
    """Endpoint for retrieving all users."""
    with get_session() as session:
        try:
            users = session.query(User).all()
            return jsonify([user.dict for user in users]), 200
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500


@user_bp.route("/users/id", methods=["GET"])
def get_user_id():
    """Endpoint for retrieving user id based on firebase token."""
    if not request.is_json:
        return jsonify({"message": "Missing JSON in request"}), 400
    data = request.get_json()
    with get_session() as session:
        try:
            user = (
                session.query(User)
                .filter(User.firebase_token == data.get("firebase_token"))
                .first()
            )
            if user:
                return jsonify({"user_id": user.id}), 200
            else:
                return jsonify({"message": "User not found"}), 404
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500


@user_bp.route("/users/<int:user_id>", methods=["GET"])
def get_user_profile(user_id):
    """Endpoint for retrieving user profile information."""
    # Retrieve user from the database based on userId
    with get_session() as session:
        try:
            user = session.query(User).filter(User.id == user_id).first()
            if user:
                # Return user profile information
                return (
                    user.json,
                    200,
                )
            else:
                return jsonify({"message": "User not found"}), 404
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500


@user_bp.route("/users/<int:user_id>", methods=["PUT"])
def update_user_profile(user_id):
    """Endpoint for updating user profile information."""
    if not request.is_json:
        return jsonify({"message": "Missing JSON in request"}), 400
    data = request.get_json()
    # Retrieve user from the database based on userId
    with get_session() as session:
        try:
            user = session.query(User).filter(User.id == user_id).first()
            if user:
                # Update user profile information
                user.username = data.get("username", user.username)
                user.email = data.get("email", user.email)
                user.type = data.get("type", user.type)
                user.first_name = data.get("first_name", user.first_name)
                user.last_name = data.get("last_name", user.last_name)
                user.phone_prefix = data.get("phone_prefix", user.phone_prefix)
                user.phone = data.get("phone", user.phone)
                session.commit()
                return jsonify({"message": "User profile updated successfully"}), 200
            else:
                return jsonify({"message": "User not found"}), 404
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500


@user_bp.route("/users/<int:user_id>/parking_spots", methods=["GET"])
def get_user_parking_spots(user_id):
    """Endpoint for retrieving the list of parking spots for a given user ID."""
    with get_session() as session:
        try:
            # Retrieve the user to ensure the user exists
            user = session.query(User).filter(User.id == user_id).first()
            if not user:
                return jsonify({"message": "User not found"}), 404

            # Retrieve parking spots for the user
            parking_spots = session.query(ParkingSpot).filter(ParkingSpot.owner_id == user_id).all()
            parking_spots_list = [spot.to_dict() for spot in parking_spots]

            # For every spot in the list get 'address_id' and find the corresponding address dict
            for spot in parking_spots_list:
                address_id = spot['address_id']
                address = session.query(Address).filter(Address.address_id == address_id).first()
                spot['address'] = address.dict
                del spot['address_id']

            return jsonify(parking_spots_list), 200
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500


@user_bp.route("/users/<int:user_id>/rental_offers", methods=["GET"])
def get_user_rental_offers(user_id):
    """Endpoint for retrieving the list of rental offers for given user (parking spot owner)."""
    with get_session() as session:
        try:
            # Retrieve the user to ensure the user exists
            user = session.query(User).filter(User.id == user_id).first()
            if not user:
                return jsonify({"message": "User not found"}), 404
            # Retrieve parking spots for the user
            parking_spots = session.query(ParkingSpot).filter(ParkingSpot.owner_id == user_id).all()
            # Retrieve rental offers for each parking spot
            rental_offers_list = []
            for spot in parking_spots:
                rental_offers = session.query(RentalOffer).filter(RentalOffer.spot_id == spot.spot_id).all()
                rental_offers_list.extend([offer.dict for offer in rental_offers])
            return jsonify(rental_offers_list), 200
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500


@user_bp.route("/users/<int:user_id>/bookings", methods=["GET"])
def get_user_bookings(user_id):
    """Endpoint for retrieving the list of bookings for given user."""
    with get_session() as session:
        try:
            # Retrieve the user to ensure the user exists
            user = session.query(User).filter(User.id == user_id).first()
            if not user:
                return jsonify({"message": "User not found"}), 404
            # Retrieve bookings for the user
            bookings = session.query(Booking).filter(Booking.user_id == user_id).all()
            response_list = []
            # for each booking get the booking dict, add parking spot dict and address dict
            for booking in bookings:
                booking_dict = booking.dict
                spot_id = booking.offer_id
                spot = session.query(ParkingSpot).filter(ParkingSpot.spot_id == spot_id).first()
                address = session.query(Address).filter(Address.address_id == spot.address_id).first()
                booking_dict["spot"] = spot.to_dict()
                booking_dict["spot"]["address"] = address.dict
                response_list.append(booking_dict)
            return jsonify(response_list), 200
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500
