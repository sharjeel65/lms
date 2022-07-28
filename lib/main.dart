import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/SplashPage.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    print('Started');
    await Firebase.initializeApp().whenComplete(() {
      print("Firebase Success");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
    );
  }
}
