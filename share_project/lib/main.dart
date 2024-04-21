import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:share_project/firebase_options.dart';
import 'package:share_project/pages/LoginSignupPage.dart';
import 'package:share_project/pages/homepage.dart';
import 'package:share_project/pages/addprod.dart';
import 'package:share_project/pages/searchpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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