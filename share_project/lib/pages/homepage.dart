import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:share_project/models/recommend.dart';
import 'package:share_project/pages/ProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final faker = Faker();

  List<Recommend> recommendList = [];

  void _getRecommend() {
    recommendList = Recommend.getRecommend();
  }

  @override
  Widget build(BuildContext context) {
    _getRecommend();
    final imageUrl = faker.image.image();

    return Scaffold(
      backgroundColor: Color(0xFFFFFBEB),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Recommend for you',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 180,
            child: ListView.separated(
              itemCount: recommendList.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20),
              separatorBuilder: (context, index) => SizedBox(width: 20),
              itemBuilder: (context, index) {
                return Container(
                  height: 180,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(227, 227, 227, 1.0),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.5), // Add a shadow for depth
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(3, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      ClipRRect(
                        child: Image.asset(recommendList[index].pic,
                            width: 129, height: 110, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // name+icon
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              recommendList[index].name,
                              style: TextStyle(
                                fontFamily: "Inder",
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            starIcon(),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            recommendList[index].value == '0'
                                ? Icon(
                                    Icons.handshake_rounded,
                                    size: 15,
                                  ) // Display handshake icon
                                : Text(
                                    recommendList[index].value,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 7,
                                        fontFamily: "Inder"),
                                  ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                            )
                          ],
                        ),
                      ),

                      // Row(
                      //   children: [
                      //       recommendList[index].value == '0'
                      //         ? Icon(Icons.handshake_rounded) // Display handshake icon
                      //       : Flexible(
                      //           child: Text(recommendList[index].value, style: TextStyle(color:Colors.black),),
                      //         ),

                      //   ],
                      // )
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("products").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
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
                              StarIcon(),
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
                              CircleAvatar(
                                radius: 12,
                                backgroundImage:
                                    CachedNetworkImageProvider(imageUrl),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StarIcon extends StatefulWidget {
  const StarIcon({Key? key}) : super(key: key);

  @override
  State<StarIcon> createState() => _StarIconState();
}

class _StarIconState extends State<StarIcon> {
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
      ),
    );
  }
}
