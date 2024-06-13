import 'package:flutter/material.dart';

class ParkingFeatureWidget extends StatelessWidget {
  const ParkingFeatureWidget({
    super.key,
    required this.option,
    required this.text,
  });
  final bool option;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Row(
          children: [
            Icon(option ? Icons.done : Icons.cancel),
            Text(text),
          ],
        ),
      ),
    );
  }
}
