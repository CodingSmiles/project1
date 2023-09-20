import 'package:app1/widgets/region_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final QuerySnapshot<Map<String, dynamic>> data;

  const Home({super.key, required this.data});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // get screen size
    final double width = size.width; // get screen width
    final double height = size.height; // get screen height
    final double hpw2 = (height + width) / 200;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Icon(
          Icons.home,
          size: hpw2 * 5,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 12.0),
            child: Text(
              "Regions",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: hpw2 * 4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18.5,
              top: 12.5,
              right: 12.5,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.data.size,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: RegionButton(
                    r1: widget.data.docs[index].id,
                  ),
                );
                // return Padding(
                //   padding: EdgeInsets.only(
                //     left: 12.0,
                //     bottom: 12.0,
                //     right: hpw2 * 12,
                //   ),
                //   child: OutlinedButton(
                //     style: OutlinedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //     ),
                //     onPressed: () {},
                //     child: Text(
                //       (widget.data.docs[index].id).toTitleCase(),
                //       style: TextStyle(
                //         fontFamily: 'Inter',
                //         fontSize: hpw2 * 3,
                //         color: Colors.red,
                //       ),
                //     ),
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
