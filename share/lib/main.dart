import 'package:flutter/material.dart';
import 'package:share/pages/LoginSignupPage.dart';
// import 'package:share/pages/MapPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginSignupPage(),
    );
  }
}

