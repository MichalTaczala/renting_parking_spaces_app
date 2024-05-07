import functions_framework
import stripe
from flask import json, jsonify
import os
import logging

# Set up logging
logging.basicConfig(level=logging.DEBUG)


@functions_framework.http
def webhook(request):
    logging.info("Webhook received")
    stripe_api_key = os.getenv("STRIPE_API_KEY")

    payload = request.data
    event = None

    try:
        event = stripe.Event.construct_from(json.loads(payload), stripe_api_key)
    except Exception as e:
        # Invalid payload
        return jsonify({"status": "failed", "error": str(e)}), 400
    logging.info("Event constructed")
    # Handle the event
    if event is None:
        return jsonify({"status": "failed1234", "error": "Invalid event1234"}), 400
    print(event.type)
    if event.type == "payment_intent.succeeded":
        payment_intent = event.data.object  # contains a stripe.PaymentIntent
        # Then define and call a method to handle the successful payment intent.
        # handle_payment_intent_succeeded(payment_intent)
    elif event.type == "payment_method.attached":
        payment_method = event.data.object  # contains a stripe.PaymentMethod
        # Then define and call a method to handle the successful attachment of a PaymentMethod.
        # handle_payment_method_attached(payment_method)
    # ... handle other event types
    else:
        print("Unhandled event type {}".format(event.type))

    return jsonify({"status": "success"}), 200
