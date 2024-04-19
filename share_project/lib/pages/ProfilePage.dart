import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/pages/EditPage.dart';
import 'package:share/pages/LoginSignupPage.dart';
import 'package:share/pages/LoginPage.dart';
// import 'package:share/pages/SignupPage.dart';
import 'package:share/pages/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginSignupPage()),
                        (Route<dynamic> route) => false,
                      );
                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFD93D)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    child: Text('Logout', style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'Inder')),              
                  ),
                  IconButton(
                    onPressed: () {
                    },
                    icon: Icon(
                      Icons.star_rounded,
                      color: Color(0xFFFFD93D),
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                CircleAvatar(
                  // backgroundImage: AssetImage(''),
                  radius: 80,
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFD93D),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditPage()),
                        );
                      },
                      icon: SvgPicture.asset("assets/icons/edit.svg"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              '${User.userList[LoginPage.userIndex].name ?? 'N/A'}',
              style: TextStyle(fontFamily: 'Inder'),
            ),
            Text('100 followers', style: TextStyle(fontFamily: 'Inder'),),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {                  
                  },
                  icon: SvgPicture.asset("assets/icons/facebook.svg"),
                ),
                IconButton(
                  onPressed: () {                    
                  },
                  icon: SvgPicture.asset("assets/icons/ig.svg"),
                ),
                IconButton(
                  onPressed: () {
                  },
                  icon: SvgPicture.asset("assets/icons/line.svg"),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}