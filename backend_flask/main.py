from flask import Flask, request, jsonify

# from flask_sqlalchemy import SQLAlchemy
import sqlalchemy
from models.users import User
from db_conn import connect_with_connector
from dotenv import load_dotenv
import requests


app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello World!"


@app.route("/create_user", methods=["POST"])
def create_user():
    if not request.is_json:
        return jsonify({"message": "Missing JSON in request"}), 400

    data = request.get_json()
    username = data.get("username")
    email = data.get("email")
    user_type = data.get("user_type")
    user_name = data.get("user_name")
    user_surname = data.get("user_surname")
    phone_prefix = data.get("phone_prefix")
    phone = data.get("phone")
    password = data.get("password")

    # create a new user
    new_user = User(
        username=username,
        user_name=user_name,
        user_surname=user_surname,
        email=email,
        user_type=user_type,
        phone_prefix=phone_prefix,
        phone=phone,
        password=password,
    )

    # add to the db
    load_dotenv()
    engine = connect_with_connector()
    try:
        with engine.connect() as connection:
            connection.execute(sqlalchemy.insert(User), new_user)
    except Exception as e:
        return jsonify({"message": str(e)}), 400


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
