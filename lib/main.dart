import 'package:app1/errors.dart';
import 'package:app1/home.dart';
import 'package:app1/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      title: "Project 1",
      home: const Splash(),
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
            centerTitle: true,
            titleTextStyle: const TextStyle(
              fontFamily: 'Inter',
            )),
      ),
    ),
  );
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  bool isBlur = false;
  double opacity = 0.3;
  int pageIndex = 0;
  final pages = [
    const Home(),
    const Errors(),
  ];
  final colours = [
    Colors.blue.shade900,
    Colors.red.shade900,
  ];
  Color colour = Colors.blue.shade900;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: colour,
          currentIndex: pageIndex,
          enableFeedback: true,
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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.error),
              label: "Errors",
            ),
          ],
        ),
        body: pages[pageIndex]);
  }
}
