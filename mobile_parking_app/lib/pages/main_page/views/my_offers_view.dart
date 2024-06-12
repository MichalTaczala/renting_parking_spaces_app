import 'package:flutter/material.dart';

class MyOffersView extends StatelessWidget {
  const MyOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text(
            "Your offers",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: ((context, index) => const Card(
                    child: ListTile(
                      title: Text("Garage name"),
                      leading: Text("COS"),
                      subtitle: Text("Dodatkowe info"),
                      trailing: Text("\$48"),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
