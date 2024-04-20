import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:faker/faker.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final imageUrl = faker.image.image();

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("products").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              // Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return

                  // Container(
                  //   child: ListTile(
                  //     title: Text(document["name"] + document["caption"]),
                  //     leading: Image.file(File('${document['image']}')) ,
                  //   ),
                  // );
                  Card(
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
                      child:
                          // Image.file(
                          //   File('${document['image']}'),
                          Image.network(
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
                    Column(children: [
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
                                  fontWeight: FontWeight.w600),
                            ),
                      SizedBox(
                        height: 5,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: CachedNetworkImageProvider(imageUrl),
                      )
                    ])
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class starIcon extends StatefulWidget {
  const starIcon({super.key});

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
