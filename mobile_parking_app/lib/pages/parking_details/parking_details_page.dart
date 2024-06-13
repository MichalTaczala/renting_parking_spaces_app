import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_parking_app/models/parking_spot_model.dart';
import 'package:mobile_parking_app/pages/parking_details/parking_feature_widget.dart';
import 'package:mobile_parking_app/pages/parking_details/show_parking_on_map_page.dart';
import 'package:mobile_parking_app/repositories/flask_repository.dart';
import 'package:mobile_parking_app/utils/helper_functions.dart';
import 'package:mobile_parking_app/utils/scrollable_if_much_content_widget.dart';

class ParkingDetailsPage extends StatefulWidget {
  ParkingDetailsPage({super.key, required this.data})
      : parkingDetailsModel = data["parkingSpot"],
        from = data["startDate"],
        to = data["endDate"];
  final Map<String, dynamic> data;
  ParkingSpotModel parkingDetailsModel;
  DateTime from;
  DateTime to;

  @override
  State<ParkingDetailsPage> createState() => _ParkingDetailsPageState();
}

class _ParkingDetailsPageState extends State<ParkingDetailsPage> {
  Map<String, dynamic>? paymentIntent;

  // @override
  // void initState() {
  //   super.initState();
  //   widget.parkingDetailsModel = widget.data["parkingSpot"];
  //   widget.from = widget.data["startDate"];
  //   widget.to = widget.data["endDate"];
  // }

  Future<bool> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent(
        double.parse(widget.parkingDetailsModel.price) *
            ((widget.from.difference(widget.to).inDays).abs() + 1),
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
      final isOk = await displayPaymentSheet(paymentIntent);
      return isOk;
    } catch (e) {
      print("exception $e");
      return false;
      // if (e is StripeConfigException) {
      //   print("Stripe exception ${e.message}");
      // } else {
      //   print("exception $e");
      // }
    }
  }

  Future<bool> displayPaymentSheet(Map<String, dynamic>? paymentIntent) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Paid successfully")),
      );
      paymentIntent = null;
      return true;
    } on StripeException catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(" Payment Cancelled")),
      );
      return false;
    } catch (e) {
      print("Error in displaying");
      print('$e');
      return false;
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
      body: ScrollableIfMuchContentWidget(
        upperWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "parking_main_image_${widget.parkingDetailsModel.spotId}",
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: CarouselSlider.builder(
                  itemCount: widget.parkingDetailsModel.imagesUrls.isNotEmpty
                      ? widget.parkingDetailsModel.imagesUrls.length
                      : 1,
                  itemBuilder: ((context, index, realIndex) => Image.network(
                        widget.parkingDetailsModel.imagesUrls.isNotEmpty
                            ? widget.parkingDetailsModel.imagesUrls[index]
                            : "https://as2.ftcdn.net/v2/jpg/07/95/29/45/1000_F_795294547_gaBzWLhkAYBSz1ZUIZssHhvzGzstNmHK.jpg",
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
            Wrap(
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
                            double.parse(
                                widget.parkingDetailsModel.address!.lat!),
                            double.parse(
                                widget.parkingDetailsModel.address!.long!),
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
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              getReadableAddress(widget.parkingDetailsModel.address),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Facilities",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ParkingFeatureWidget(
                  option: widget.parkingDetailsModel.charging ?? false,
                  text: "Is charging available",
                ),
                ParkingFeatureWidget(
                  option: widget.parkingDetailsModel.easyAccess ?? false,
                  text: "Is easy access",
                ),
                ParkingFeatureWidget(
                  option: widget.parkingDetailsModel.internal ?? false,
                  text: "Is internal?",
                ),
                ParkingFeatureWidget(
                  option: widget.parkingDetailsModel.security ?? false,
                  text: "Is secure?",
                ),
              ],
            ),
          ],
        ),
        lowerWidget: Row(
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
                  final isOk = await makePayment();
                  if (isOk) {
                    context.read<FlaskRepository>().bookParkingSpot(
                          widget.from,
                          widget.to,
                          widget.parkingDetailsModel,
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Payment failed"),
                      ),
                    );
                  }
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
        ),
        paddingValue: 16,
      ),
    );
  }
}
