import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_parking_app/models/parking_details_model.dart';
import 'package:mobile_parking_app/pages/parking_details/show_parking_on_map_page.dart';

class ParkingDetailsPage extends StatefulWidget {
  const ParkingDetailsPage({super.key, required this.parkingDetailsModel});
  final ParkingDetailsModel parkingDetailsModel;

  @override
  State<ParkingDetailsPage> createState() => _ParkingDetailsPageState();
}

class _ParkingDetailsPageState extends State<ParkingDetailsPage> {
  Map<String, dynamic>? paymentIntent;

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent(
        widget.parkingDetailsModel.price,
        widget.parkingDetailsModel.currency,
      );

      // initialise the payment sheet setup
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Client secret key from payment data
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          googlePay: const PaymentSheetGooglePay(
            testEnv: true,
            currencyCode: "PLN",
            merchantCountryCode: "PL",
          ),
          // Merchant Name
          merchantDisplayName: 'radakanis',
        ),
      );
      // Display payment sheet
      displayPaymentSheet(paymentIntent);
    } catch (e) {
      print("exception $e");

      if (e is StripeConfigException) {
        print("Stripe exception ${e.message}");
      } else {
        print("exception $e");
      }
    }
  }

  displayPaymentSheet(Map<String, dynamic>? paymentIntent) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Paid successfully")),
      );
      paymentIntent = null;
    } on StripeException catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(" Payment Cancelled")),
      );
    } catch (e) {
      print("Error in displaying");
      print('$e');
    }
  }

  createPaymentIntent(double amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': (((amount * 100).round())).toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      //TODO change it to server invokation
      var secretKey =
          "sk_test_51NldnEDNOsFHC8X3JgLrJs1AW7Bjxja9dTWrqnYlAP8E1ibGgJyYkCzQMFc8AYWziifVueveymmnvvS34bm9lZb200Di3Wo5oI";
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return jsonDecode(response.body.toString());
    } catch (err) {
      return err;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Image.asset(
                "assets/images/garage.jpeg",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Column(
                  children: [
                    Text(
                      "Some nice parking",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text("4.5 (355 Reviews)"),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    if (widget.parkingDetailsModel.location?.lat == null ||
                        widget.parkingDetailsModel.location?.lng == null) {
                      return;
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShowParkingOnMap(
                          initialCameraPosition: LatLng(
                            widget.parkingDetailsModel.location!.lat!,
                            widget.parkingDetailsModel.location!.lng!,
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Show map",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In scelerisque vulputate metus sit amet luctus. Maecenas viverra eu felis ac vehicula. Suspendisse commodo ante ligula, a vestibulum enim hendrerit ut. Nam sodales laoreet justo eget dictum. Integer interdum ligula turpis, sit amet vehicula sem fringilla in. Phasellus laoreet ultricies metus at laoreet. Cras quam elit, volutpat ut consectetur vitae, iaculis quis justo. Donec id augue ipsum. Vivamus libero sapien, egestas sit amet cursus ac, vestibulum ac felis. Ut tempus, nibh ut mollis tincidunt, elit nulla efficitur lacus, vitae pulvinar diam lorem nec orci. In tellus nunc, blandit eu tempus a, ultricies non ipsum.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Facilities",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Row(
              children: [
                Icon(Icons.abc),
                Icon(
                  Icons.access_time_filled,
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Price per hour"),
                    Text(
                      "10 zł",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.green[300],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await makePayment();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[400],
                      ),
                    ),
                    child: const Text(
                      "Book now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
