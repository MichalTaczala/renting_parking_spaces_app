import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripePaymentPage extends StatelessWidget {
  StripePaymentPage({super.key});
  CardFieldInputDetails cardDetails =
      const CardFieldInputDetails(complete: false);
  CardFormEditController cardFormEditController = CardFormEditController();

  void handlePayment(
      CardFormEditController controller, BuildContext context) async {
    if (controller.details.complete) {
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: const PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: BillingDetails(email: ""),
          ),
        ),
      );
      sendPaymentToServer(
          paymentMethodId: paymentMethod.id, amount: 120, currency: "USD");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please complete the form.",
          ),
        ),
      );
    }
  }

  Future<void> sendPaymentToServer({
    required String paymentMethodId,
    required int amount, // Amount in cents
    required String currency,
  }) async {
    try {
      final url = Uri.parse(
          'https://localhost:8080/payment'); // Your server endpoint URL
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'paymentMethodId': paymentMethodId,
          'amount': amount,
          'currency': currency,
        }),
      );

      if (response.statusCode == 200) {
        // Handle the successful response here
        print('Payment successful: ${response.body}');
      } else {
        // Handle the error
        print('Payment failed: ${response.body}');
      }
    } catch (e) {
      print('Error sending payment to server: $e');
    }
  }

  Future<void> createIntent(BillingDetails billingDetails) async {
    final paymentMethod = await Stripe.instance.createPaymentMethod(
      params: PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(
          billingDetails: billingDetails,
        ),
      ),
    );

    final url = Uri.parse(dotenv.get("STRIPE_CREATE_INTENT_URL"));
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'useStripeSdk': true,
        'paymentMethodId': paymentMethod.id,
      }),
    );
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Token Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardFormField(
              controller: cardFormEditController,
            ),
            ElevatedButton(
              onPressed: () async {},
              child: const Text('Create Token'),
            ),
          ],
        ),
      ),
    );
  }
}
