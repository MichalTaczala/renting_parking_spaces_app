import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_parking_app/repositories/flask_repository.dart';
import 'package:mobile_parking_app/utils/helper_functions.dart';

class MyOffersView extends StatelessWidget {
  const MyOffersView({super.key});

  String convertStringDateToYYYYMMdd(String? stringDate) {
    if (stringDate == null) {
      return "";
    }
    DateFormat inputFormat = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'");
    DateTime dateTime = inputFormat.parseUTC(stringDate);
    DateFormat outputFormat = DateFormat("yyyy-MM-dd");
    return outputFormat.format(dateTime.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<FlaskRepository>().fetchUsersBookings(),
      builder: (context, snapshot) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              "Your bookings",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: ((context, index) => Card(
                        child: ListTile(
                      title: Text(
                        getReadableAddress(
                          snapshot.data?[index].spot?.address,
                        ),
                      ),
                      subtitle: Text(
                        "${convertStringDateToYYYYMMdd(snapshot.data?[index].bookingStart)} - ${convertStringDateToYYYYMMdd(snapshot.data?[index].bookingEnd)}",
                      ),
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
