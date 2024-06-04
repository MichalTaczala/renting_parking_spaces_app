import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_parking_app/models/parking_spot_model.dart';
import 'package:mobile_parking_app/pages/parking_details/show_parking_on_map_page.dart';

class ParkingDetailsPage extends StatefulWidget {
  const ParkingDetailsPage({super.key, required this.parkingDetailsModel});
  final ParkingSpotModel parkingDetailsModel;

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
      var secretKey = dotenv.get("STRIPE_SECRET");
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
              child: Hero(
                tag:
                    "parking_main_image_${widget.parkingDetailsModel.imagesUrls[0]}",
                child: CarouselSlider.builder(
                  itemCount: widget.parkingDetailsModel.imagesUrls.length,
                  itemBuilder: ((context, index, realIndex) => Image.network(
                        widget.parkingDetailsModel.imagesUrls[index],
                        fit: BoxFit.fitWidth,
                      )),
                  options: CarouselOptions(
                    aspectRatio: 4 / 3,
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      widget.parkingDetailsModel.name!,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    if (widget.parkingDetailsModel.address?.lat == null ||
                        widget.parkingDetailsModel.address?.long == null) {
                      return;
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShowParkingOnMap(
                          initialCameraPosition: LatLng(
                            widget.parkingDetailsModel.address!.lat!,
                            widget.parkingDetailsModel.address!.long!,
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Show on map",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.parkingDetailsModel.description ?? "",
              style: const TextStyle(
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
                    const Text("Price per day"),
                    Text(
                      "${widget.parkingDetailsModel.currency} ${widget.parkingDetailsModel.price}",
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
