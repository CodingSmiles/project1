import 'package:app1/misc/string_extension.dart';
import 'package:app1/models/streetlight.dart';
import 'package:app1/widgets/streetlight_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FaultyStreetlights extends StatefulWidget {
  final String region;

  const FaultyStreetlights({super.key, required this.region});

  @override
  State<FaultyStreetlights> createState() => _FaultyStreetlightsState();
}

class _FaultyStreetlightsState extends State<FaultyStreetlights> {
  List<Object> flickeringLights = [];
  List<Object> notWorking = [];

  @override
  void initState() {
    super.initState();
    getFaultyStreetlights();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // get screen size
    final double width = size.width; // get screen width
    final double height = size.height; // get screen height
    final double hpw2 = (height + width) / 200;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text(
          toBeginningOfSentenceCase(widget.region.toTitleCase()) ??
              'Region Not Provided',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 12.5,
          top: 12.5,
          right: 12.5,
        ),
        child: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance.collection('cities').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data.toString().isNotEmpty) {
              return ListView.builder(
                itemCount: flickeringLights.length,
                itemBuilder: (context, index) {
                  return StreetlightCard(
                    streetlight: flickeringLights[index] as Streetlight,
                  );
                },
              );
            } else {
              return Text(
                'Loading...',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: hpw2 * 5.6),
              );
            }
          },
        ),
      ),
    );
  }

  Future getFaultyStreetlights() async {
    var db = FirebaseFirestore.instance;
    var dataFlickering = await db
        .collection('cities')
        .doc(widget.region)
        .collection('strlghts')
        .orderBy('id', descending: false)
        .where('flickering', isEqualTo: true)
        .get();

    var dataFaulty = await db
        .collection('cities')
        .doc(widget.region)
        .collection('strlghts')
        .orderBy('id', descending: false)
        .where('working', isEqualTo: false)
        .get();

    setState(() {
      flickeringLights = List.from(
        dataFlickering.docs.map(
          (doc) => Streetlight.fromSnapshot(doc),
        ),
      );
      notWorking = List.from(
        dataFaulty.docs.map(
          (doc) => Streetlight.fromSnapshot(doc),
        ),
      );
    });
  }
}
