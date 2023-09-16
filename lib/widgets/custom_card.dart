import 'dart:math';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.name,
    required this.desc,
  });

  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    List<Color> selectColor() {
      var rng = Random();
      var colors = [
        [
          const Color.fromRGBO(65, 151, 211, 1),
          const Color.fromRGBO(255, 255, 255, 1)
        ],
        [
          const Color.fromRGBO(68, 112, 48, 1.0),
          const Color.fromRGBO(255, 255, 255, 1),
        ],
        [
          const Color.fromRGBO(255, 181, 50, 0.7),
          const Color.fromRGBO(0, 0, 0, 1)
        ],
        [
          Color(int.parse(("#00539C").substring(1, 7), radix: 16) + 0xFF000000),
          const Color.fromRGBO(255, 255, 255, 1)
        ],
        [
          Color(int.parse(("#2F3C7E").substring(1, 7), radix: 16) + 0xFF000000),
          const Color.fromRGBO(255, 255, 255, 1)
        ],
        [
          Color(int.parse(("#101820").substring(1, 7), radix: 16) + 0xFF000000),
          const Color.fromRGBO(255, 255, 255, 1)
        ],
        [
          Color(int.parse(("#FEE715").substring(1, 7), radix: 16) + 0xFF000000),
          const Color.fromRGBO(0, 0, 0, 1)
        ],
        [
          Color(int.parse(("#F96167").substring(1, 7), radix: 16) + 0xFF000000),
          const Color.fromRGBO(255, 255, 255, 1)
        ],
        [
          Color(int.parse(("#F9E795").substring(1, 7), radix: 16) + 0xFF000000),
          const Color.fromRGBO(0, 0, 0, 1)
        ],
        [
          Color(int.parse(("#4831D4").substring(1, 7), radix: 16) + 0xFF000000),
          const Color.fromRGBO(255, 255, 255, 1)
        ],
        [
          Color(int.parse(("#CCF381").substring(1, 7), radix: 16) + 0xFF000000),
          const Color.fromRGBO(0, 0, 0, 1)
        ],
        [
          Color(int.parse(("#E2D1F9").substring(1, 7), radix: 16) + 0xFF000000),
          const Color.fromRGBO(0, 0, 0, 1)
        ],
        [
          Color(int.parse(("#317773").substring(1, 7), radix: 16) + 0xFF000000),
          const Color.fromRGBO(255, 255, 255, 1)
        ],
        [
          Color(int.parse(("#990011").substring(1, 7), radix: 16) + 0xFF000000),
          const Color.fromRGBO(255, 255, 255, 1)
        ],
        [
          Color(int.parse(("#EE4E34").substring(1, 7), radix: 16) + 0xFF000000),
          const Color.fromRGBO(255, 255, 255, 1)
        ],
      ];
      return colors[rng.nextInt(colors.length)];
    }

    final Size size = MediaQuery.of(context).size; // get screen size
    final double width = size.width; // get screen width
    final double height = size.height; // get screen height
    final double hpw2 = (height + width) / 200;
    final List<Color> colorS = selectColor();
    return Card(
      color: colorS[0],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.0),
      ),
      elevation: hpw2 * 10,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          hpw2 * 1.5,
          hpw2 * 2.6,
          hpw2 * 1.5,
          hpw2 * 2.6,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorS[1],
                    fontSize: hpw2 * 4.8,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                  ),
                )
              ],
            ),
            SizedBox(
              height: hpw2 * 2.8,
            ),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colorS[1],
                fontFamily: 'Inter',
                fontSize: hpw2 * 2.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
