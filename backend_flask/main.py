"""
main.py

This file contains the main Flask application that will be deployed to Google App Engine.
"""

from flask import Flask, request, jsonify
import requests
from dotenv import load_dotenv
from sqlalchemy.exc import SQLAlchemyError
from models import User, Address, Booking, ParkingSpot, RentalOffer
from db_conn import get_session
from blueprints.user.user import user_bp
from blueprints.parking_spot.parking_spot import parkingspot_bp

app = Flask(__name__)

# Blueprints
app.register_blueprint(user_bp)
app.register_blueprint(parkingspot_bp)


@app.route("/")
def hello():
    """Testing endpoint."""
    return "Hello World!"


@app.route("/payment", methods=["POST"])
def payment():
    if not request.is_json:
        return jsonify({"message": "Missing JSON in request"}), 400

    data = request.get_json()  # Get JSON data from the request
    client_secret = data.get("client_secret")
    response = requests.post(
        # "https://us-central1-parking-app-v2.cloudfunctions.net/payment_handling",
        "http://127.0.0.1:8080/",
        json={"client_secret": client_secret},
        headers={
            # "Authorization": f"bearer {get_identity_token()}",
            "Content-Type": "application/json",
        },
        timeout=70,
    )

    if response.status_code != 200:
        return (
            jsonify({"message": "ERRORIK"}),
            400,
        )

    # do changes in db
    # TODO

    return response.text


if __name__ == "__main__":
    app.run()
