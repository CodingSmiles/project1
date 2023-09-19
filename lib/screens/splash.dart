import 'dart:async';
import 'package:app1/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  final List cities;
  final QuerySnapshot<Map<String, dynamic>> data;

  const Splash({super.key, required this.cities, required this.data});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 1300),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => Main(
              cities: widget.cities,
              data: widget.data,
            ),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // get screen size
    final double width = size.width; // get screen width
    final double height = size.height; // get screen height
    final double hpw2 = (height + width) / 200;
    if (kDebugMode) {
      print(hpw2);
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Meaningless',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: hpw2 * 9.24,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              'Dedication',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: hpw2 * 9.24,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
