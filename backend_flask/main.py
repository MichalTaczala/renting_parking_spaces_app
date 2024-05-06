from flask import Flask, request, jsonify

import requests

app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello World!"


@app.route("/payment", methods=["POST"])
def payment():
    if request.is_json:
        data = request.get_json()  # Get JSON data from the request
        client_secret = data.get("client_secret")
    response = requests.post(
        "https://go-service-dot-parking-app-v2.uc.r.appspot.com/handlePayments",
        json={"client_secret": client_secret},
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
