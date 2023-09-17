import 'package:app1/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // get screen size
    final double width = size.width; // get screen width
    final double height = size.height; // get screen height
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          "Home",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 12.5,
          top: 12.5,
          right: 12.5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 1; i < 5 ; i++)
               CustomCard(name: "Data Point $i ", desc: 'ABCD1234'),
          ],
        ),
      ),
    );
  }
}
