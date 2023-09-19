import 'package:app1/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class Errors extends StatefulWidget {
  const Errors({super.key});

  @override
  State<Errors> createState() => _ErrorsState();
}

class _ErrorsState extends State<Errors> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // get screen size
    final double width = size.width; // get screen width
    final double height = size.height; // get screen height
    final double hpw2 = (height + width) / 200;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Icon(
          Icons.error,
          size: hpw2 * 5,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ],
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
            for (int i = 1; i < 5; i++)
              CustomCard(name: "Data Point $i", desc: 'ABCD1234'),
          ],
        ),
      ),
    );
  }
}
