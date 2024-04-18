import 'package:flutter/material.dart';
import 'package:share/pages/LoginPage.dart';
import 'package:share/pages/SignupPage.dart';

class LoginSignupPage extends StatelessWidget {
  const LoginSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD93D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SHARE', 
              style: TextStyle(fontFamily: 'Monofett', color: Colors.white, fontSize: 70)
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFFBEB)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 100, vertical: 8),
                ),
              ),
              child: Text('Log in', style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Inder')),              
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFFBEB)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 94, vertical: 8),
                ),
              ),
              child: Text('Sign up', style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Inder')),              
            ),
          ],
        ),
      ),
    );
  }
}