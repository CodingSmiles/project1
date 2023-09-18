import 'package:app1/models/streetlight.dart';
import 'package:app1/widgets/streetlight_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final List cities;

  const Home({super.key, required this.cities});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          "Home",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 12.5,
          top: 12.5,
          right: 12.5,
        ),
        child: ListView.builder(
            itemCount: widget.cities.length,
            itemBuilder: (context, index) {
              return StreetlightCard(streetlight: widget.cities[index] as Streetlight);
            },
          ),
      ),
    );
  }
}
