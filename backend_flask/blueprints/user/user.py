import requests
from flask import Flask, request, jsonify
from flask import Blueprint
from models import User
from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError
from db_conn import get_session
import firebase_admin
from firebase_admin import auth, credentials



user_bp = Blueprint("user", __name__)

# Initialize Firebase Admin SDK (do this once in your application, e.g., in app initialization code)
cred = credentials.Certificate("path/to/your/firebase/credentials.json")  # @TODO: ask Michal <33333
firebase_admin.initialize_app(cred)

# endpoint for checking if user is already signed up
# header: Firebase token
# @user_bp.route("/users/check", methods=["POST"])
# def check_user():
#     """Endpoint for checking if user is already signed up."""
#     pass  # TODO


@user_bp.route("/users/check_create", methods=["POST"])
def check_and_create_user():
    """Endpoint for creating a user."""
    if not request.is_json:
        return jsonify({"message": "Missing JSON in request"}), 400

    data = request.get_json()

    firebase_token = data.get("firebase_token")
    if not firebase_token:
        return jsonify({"message": "Missing Firebase token"}), 400

    try:
        decoded_token = auth.verify_id_token(firebase_token)
        firebase_uid = decoded_token['uid']
    except Exception as e:
        return jsonify({"message": f"Invalid Firebase token: {str(e)}"}), 400

    # Check if the user exists in the database
    with get_session() as session:
        existing_user = session.query(User).filter_by(email=data.get("email")).first()
        if existing_user:
            return jsonify({"message": "User already exists, logged in successfully!"}), 200

        # create a new user
        new_user = User(
            username=data.get("username"),
            first_name=data.get("first_name"),
            last_name=data.get("last_name"),
            email=data.get("email"),
            type=data.get("type"),
            phone_prefix=data.get("phone_prefix"),
            phone=data.get("phone"),
            password=data.get("password"),
            firebase_uid=firebase_uid  # Store the Firebase UID with the user
        )

        try:
            session.add(new_user)
            session.commit()
            return jsonify({"message": "Successfully created new user!"}), 200
        except Exception as e:
            return jsonify({"message": str(e)}), 400



# temporal endpoint for displaying al users
@user_bp.route("/users/all", methods=["GET"])
def get_users():
    """Endpoint for retrieving all users."""
    with get_session() as session:
        try:
            users = session.query(User).all()
            return (
                jsonify(
                    [
                        {
                            "id": user.id,
                            "username": user.username,
                            "email": user.email,
                            "type": user.type,
                            "first_name": user.first_name,
                            "last_name": user.last_name,
                            "phone_prefix": user.phone_prefix,
                            "phone": user.phone,
                        }
                        for user in users
                    ]
                ),
                200,
            )
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


@user_bp.route("/users/<int:user_id>", methods=["GET"])
def get_user_profile(user_id):
    """Endpoint for retrieving user profile information."""
    # Retrieve user from the database based on userId
    with get_session() as session:
        try:
            user = session.query(User).filter(User.user_id == user_id).first()
            if user:
                # Return user profile information
                return (
                    jsonify(
                        {
                            "username": user.username,
                            "email": user.email,
                            "type": user.type,
                            "first_name": user.first_name,
                            "last_name": user.last_name,
                            "phone_prefix": user.phone_prefix,
                            "phone": user.phone,
                        }
                    ),
                    200,
                )
            else:
                return jsonify({"message": "User not found"}), 404
        except SQLAlchemyError as e:
            return jsonify({"message": str(e)}), 500


# @user_bp.route("/create_user", methods=["POST"])
# def create_user():
#     """Testing endpoint for creeting a user."""
#     if not request.is_json:
#         return jsonify({"message": "Missing JSON in request"}), 400

#     data = request.get_json()

#     # create a new user
#     new_user = User(
#         username=data.get("username"),
#         first_name=data.get("first_name"),
#         last_name=data.get("last_name"),
#         email=data.get("email"),
#         type=data.get("type"),
#         phone_prefix=data.get("phone_prefix"),
#         phone=data.get("phone"),
#         password=data.get("password"),
#     )

#     # add to the db
#     with get_session() as session:
#         try:
#             session.add(new_user)
#             session.commit()
#             return jsonify({"message": "Successfully created new user!"}), 200
#         except Exception as e:
#             return jsonify({"message": str(e)}), 400
