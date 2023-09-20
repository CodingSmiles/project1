import 'package:app1/screens/errors.dart';
import 'package:app1/screens/home.dart';
import 'package:app1/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'misc/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  List cities = [];
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var db = FirebaseFirestore.instance;
  var data = await db.collection('cities').get();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Project 1",
      home: Splash(
        cities: cities,
        data: data,
      ),
      theme: ThemeData(
        navigationBarTheme: const NavigationBarThemeData(
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(
              fontFamily: 'Inter',
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.blue.shade900,
          centerTitle: false,
          titleTextStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 30,
          ),
        ),
      ),
    ),
  );
}

class Main extends StatefulWidget {
  final List cities;
  final QuerySnapshot<Map<String, dynamic>> data;

  const Main({super.key, required this.cities, required this.data});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  bool isBlur = false;
  double opacity = 0.3;
  int pageIndex = 0;
  List pages = [];

  @override
  void initState() {
    super.initState();
    QuerySnapshot<Map<String, dynamic>> data = widget.data;
    pages = [
      Home(
        data: data,
      ),
      Errors(
        data: data,
      ),
    ];
  }

  final colours = [
    Colors.blue.shade900,
    Colors.red.shade900,
  ];
  Color colour = Colors.blue.shade900;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // get screen size
    final double width = size.width; // get screen width
    final double height = size.height; // get screen height
    final double hpw2 = (height + width) / 200;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: colour,
          currentIndex: pageIndex,
          onTap: (tap) {
            setState(() {
              pageIndex = tap;
              colour = colours[tap];
            });
          },
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedFontSize: hpw2 * 3.4,
          unselectedFontSize: hpw2 * 2.8,
          iconSize: hpw2 * 4.2,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: hpw2 * 4.3,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.error,
                size: hpw2 * 4.3,
              ),
              label: "Errors",
            ),
          ],
        ),
        body: pages[pageIndex]);
  }
}
