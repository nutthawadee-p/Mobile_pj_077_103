import 'package:flutter/material.dart';
import 'package:share_project/pages/bottom_nav_bar.dart';
import 'package:share_project/models/user.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static int userId = -1;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD93D),
      ),
      backgroundColor: Color(0xFFFFD93D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log in',
              style: TextStyle(fontFamily: 'Inder', color: Colors.white, fontSize: 70),
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
                controller: usernameController,
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
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                String enteredUsername = usernameController.text;
                String enteredPassword = passwordController.text;
                // User newUser = User(username: enteredUsername, password: enteredPassword);
                // User.userList.add(newUser);
                bool isUserExist = User.userList.any((user) => user.username == enteredUsername && user.password == enteredPassword);

                userId = User.userList.indexWhere((user) => user.username == enteredUsername && user.password == enteredPassword);
                
                if (isUserExist) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()),
                    (Route<dynamic> route) => false,
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Login Failed'),
                        content: Text('Invalid username or password. Please try again.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
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
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}