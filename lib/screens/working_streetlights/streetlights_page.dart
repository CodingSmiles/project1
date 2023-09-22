import 'package:app1/misc/string_extension.dart';
import 'package:app1/models/streetlight.dart';
import 'package:app1/widgets/working_streetlights/streetlight_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StreetlightsViewer extends StatefulWidget {
  final String region;

  const StreetlightsViewer({super.key, required this.region});

  @override
  State<StreetlightsViewer> createState() => _StreetlightsViewerState();
}

class _StreetlightsViewerState extends State<StreetlightsViewer> {
  List<Object> cities2 = [];

  @override
  void initState() {
    super.initState();
    getStreetlights();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // get screen size
    final double width = size.width; // get screen width
    final double height = size.height; // get screen height
    final double hpw2 = (height + width) / 200;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
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
                itemCount: cities2.length,
                itemBuilder: (context, index) {
                  return StreetlightCard(
                    streetlight: cities2[index] as Streetlight,
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  "Loading...",
                  style: TextStyle(fontFamily: 'Inter', fontSize: hpw2 * 8),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future getStreetlights() async {
    var db = FirebaseFirestore.instance;
    var dataMumbai = await db
        .collection('cities')
        .doc(widget.region)
        .collection('strlghts')
        .orderBy('id', descending: false)
        .get();

    setState(() {
      cities2 = List.from(
        dataMumbai.docs.map(
          (doc) => Streetlight.fromSnapshot(doc),
        ),
      );
    });
  }
}
