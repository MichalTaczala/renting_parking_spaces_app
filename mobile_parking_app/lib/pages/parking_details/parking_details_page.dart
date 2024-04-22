import 'package:flutter/material.dart';

class ParkingDetailsPage extends StatelessWidget {
  const ParkingDetailsPage({super.key});

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
                    onPressed: () => print("siema"),
                    child: const Text("Show map"))
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
                    onPressed: () => print("siema"),
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
