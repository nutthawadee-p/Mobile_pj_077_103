import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_project/pages/EditPage.dart';
import 'package:share_project/pages/LoginSignupPage.dart';
import 'package:share_project/pages/LoginPage.dart';
import 'package:share_project/models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFBEB),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginSignupPage(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFFFD93D),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Inder',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star_rounded,
                      color: Color(0xFFFFD93D),
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            
            Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
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
                              MaterialPageRoute(
                                builder: (context) => EditPage(),
                              ),
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
                  '${User.userList[LoginPage.userId].name ?? 'N/A'}',
                  style: TextStyle(fontFamily: 'Inder'),
                ),
                Text(
                  '100 followers',
                  style: TextStyle(fontFamily: 'Inder'),
                ),
                SizedBox(height: 5),
              ],
            ),
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/facebook.svg"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/ig.svg"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/line.svg"),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("products")
                      .where("userID", isEqualTo: LoginPage.userId)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return Column(
                      children: snapshot.data!.docs
                          .map((DocumentSnapshot document) {
                             return Card(
                      margin: EdgeInsets.all(15.0),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              '${document['image']}',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.0),
                                Text(
                                  document["name"],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Category: " + document["category"],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  document["caption"],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              starIcon(),
                              document["value"] == "borrow"
                                  ? Icon(
                                      Icons.handshake_rounded,
                                      color: Colors.black,
                                    )
                                  : Text(
                                      document["value"] + "฿",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ],
                      ),
                    );

                          }).toList(),
                    );

                   
                  }),
            ),
          ],
        ));
  }
}

class starIcon extends StatefulWidget {
  const starIcon({Key? key});

  @override
  State<starIcon> createState() => _starIconState();
}

class _starIconState extends State<starIcon> {
  bool star = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            star = !star;
          });
        },
        icon: Icon(
          star ? Icons.star_rounded : Icons.star_border_rounded,
          color: star ? Color.fromRGBO(255, 217, 61, 1.0) : null,
        ));
  }
}
