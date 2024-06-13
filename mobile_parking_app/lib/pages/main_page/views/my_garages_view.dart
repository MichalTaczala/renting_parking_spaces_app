import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_parking_app/repositories/flask_repository.dart';
import 'package:mobile_parking_app/utils/helper_functions.dart';

class MyGaragesView extends StatelessWidget {
  const MyGaragesView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<FlaskRepository>().fetchUsersParkingSpots(),
      builder: (context, snapshot) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              "Your garages",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: ((context, index) => Card(
                      child: ListTile(
                        title: Text(snapshot.data?[index].name ?? ""),
                        leading: Text("\$${snapshot.data?[index].price}" ?? ""),
                        subtitle: Text(
                          getReadableAddress(snapshot.data?[index].address),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
