import 'package:flutter/material.dart';
import 'package:share/pages/LoginPage.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD93D),
      ),
      backgroundColor: Color(0xFFFFD93D),
      body: Center(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(fontFamily: 'Inder', color: Colors.white, fontSize: 70),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Age',
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Address',
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Contact',
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false,
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
                  child: Text('Sign up', style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Inder')),              
                ),
              ],
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}