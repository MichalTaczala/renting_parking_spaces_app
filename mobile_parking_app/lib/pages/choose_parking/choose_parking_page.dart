import 'package:flutter/material.dart';
import 'package:mobile_parking_app/pages/choose_parking/garage_tile.dart';

class ChooseParkingPage extends StatefulWidget {
  const ChooseParkingPage({super.key});

  @override
  State<ChooseParkingPage> createState() => _ChooseParkingPageState();
}

class _ChooseParkingPageState extends State<ChooseParkingPage> {
  String _location = "Warsaw, PL";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 59,
            ),
            Row(
              children: [
                const Spacer(),
                Icon(
                  Icons.location_on_sharp,
                  color: Colors.blue[400],
                ),
                DropdownButton<String>(
                  iconEnabledColor: Colors.blue[400],
                  items: const [
                    DropdownMenuItem(
                      value: "Warsaw, PL",
                      child: Text("Warsaw, PL"),
                    ),
                    DropdownMenuItem(
                      value: "Krakow, PL",
                      child: Text("Krakow, PL"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _location = value!;
                    });
                  },
                  value: _location,
                ),
              ],
            ),
            const Text(
              "ParkNest",
              style: TextStyle(
                fontSize: 60,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed("/parkingDetails"),
                    child: const GarageTile(
                      address: "a",
                      cost: "a",
                      dateRange: "a",
                      imagelink: "a",
                    ),
                  );
                },
                padding: EdgeInsets.zero,
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        currentIndex: 0,
        fixedColor: Colors.blue[400],
      ),
    );
  }
}
