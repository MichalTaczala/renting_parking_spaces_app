import functions_framework
import stripe
from flask import json, jsonify
import os


@functions_framework.http
def webhook(request):
    print(request)
    stripe_api_key = os.getenv("STRIPE_API_KEY")

    payload = request.data
    event = None

    try:
        event = stripe.Event.construct_from(json.loads(payload), stripe_api_key)
    except ValueError as e:
        # Invalid payload
        return jsonify({"status": "failed", "error": str(e)}), 400

    # Handle the event
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


# @functions_framework.http
# def payment(request):
#     request_json = request.get_json(silent=True)

#     if request_json and "client_secret" in request_json:
#         client_secret = request_json["client_secret"]
#         payment_intent_id = client_secret.split("_secret")[0]
#         try:
#             stripe.api_key = "sk_test_51NldnEDNOsFHC8X3JgLrJs1AW7Bjxja9dTWrqnYlAP8E1ibGgJyYkCzQMFc8AYWziifVueveymmnvvS34bm9lZb200Di3Wo5oI"
#             payment_intent = stripe.PaymentIntent.retrieve(payment_intent_id)
#             if payment_intent and payment_intent.payment_method:
#                 payment_method_id = payment_intent.payment_method
#                 payment_method = stripe.PaymentMethod.retrieve(payment_method_id)

#             payment_intent = stripe.PaymentIntent.confirm(
#                 payment_intent_id, payment_method=payment_method_id
#             )
#             return jsonify({"status": "success", "payment_intent": payment_intent}), 200
#         except stripe.error.StripeError as e:
#             return jsonify({"status": "failed", "error": str(e)}), 400
#     else:
#         return jsonify({"status": "failed", "error": "Missing client_secret"}), 400
