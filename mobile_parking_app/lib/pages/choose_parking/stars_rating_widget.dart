import 'package:flutter/material.dart';

class StartRatingWidget extends StatelessWidget {
  final double starNumber;
  const StartRatingWidget({super.key, required this.starNumber});

  @override
  Widget build(BuildContext context) {
    final List<Widget> listOFStars = [];
    for (var i = 1; i <= 5; i++) {
      if (starNumber >= i) {
        listOFStars.add(
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
        );
      } else if (starNumber + 0.5 == i) {
        listOFStars.add(
          const Icon(
            Icons.star_half,
            color: Colors.amber,
          ),
        );
      } else {
        listOFStars.add(
          const Icon(
            Icons.star_outline,
            color: Colors.amber,
          ),
        );
      }
    }

    return Row(
      children: listOFStars,
    );
  }
}
