import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:share_project/pages/EditPage.dart';
import 'package:share_project/pages/LoginPage.dart';
import 'package:share_project/models/user.dart';
import 'package:share_project/pages/bottom_nav_bar.dart';
import 'package:share_project/pages/app_bar.dart';

class EditPage extends StatefulWidget {
  EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void saveProfile() {
    String newName = nameController.text;
    String newAge = ageController.text;
    String newAddress = addressController.text;
    String newUsername = usernameController.text;
    String newPassword = passwordController.text;

    User.userList[LoginPage.userId].updateUserInfo(
      LoginPage.userId,
      newName: newName.isNotEmpty ? newName : null,
      newAge: newAge.isNotEmpty ? newAge : null,
      newAddress: newAddress.isNotEmpty ? newAddress : null,
      newUsername: newUsername.isNotEmpty ? newUsername : null,
      newPassword: newPassword.isNotEmpty ? newPassword : null,
    );
  }

  String userimageUrl = '';

  XFile? _image;

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  // Future<void> _deleteProd(String name) async {
  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });

      if (_image == null) return;
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      Reference referenceImageToUpload =
          referenceDirImages.child(uniqueFileName);

      try {
        //Store the file
        await referenceImageToUpload.putFile(File(_image!.path));
        //Success: get the download URL
        userimageUrl = await referenceImageToUpload.getDownloadURL();
      } catch (error) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text('error'),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: CustomAppBar(),
              backgroundColor: Color(0xFFFFFBEB),
              body: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/edit.svg',
                                width: 24, height: 24),
                            SizedBox(width: 5),
                            Text('Profile',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Inder')),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection("products")
                                .add({
                              "userimage": userimageUrl,
                            });
                            saveProfile();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BottomNavBar(initialIndex: 4)),
                              (Route<dynamic> route) => false,
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFFFD93D)),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          child: Text('Save',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Inder')),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  //add photo
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          child: _image != null
                              ? Image.file(File(_image!.path))
                              : CircleAvatar(
                                  radius: 70,
                                ),
                        ),
                        ElevatedButton(
                          onPressed: _getImage,
                          child: Text('Choose Image'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name',
                              style:
                                  TextStyle(fontSize: 15, fontFamily: 'Inder')),
                          SizedBox(height: 5),
                          Container(
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: 'Name',
                                contentPadding: EdgeInsets.all(10),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Text('Age',
                              style:
                                  TextStyle(fontSize: 15, fontFamily: 'Inder')),
                          SizedBox(height: 5),
                          Container(
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: ageController,
                              decoration: InputDecoration(
                                hintText: 'Age',
                                contentPadding: EdgeInsets.all(10),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('Address',
                              style:
                                  TextStyle(fontSize: 15, fontFamily: 'Inder')),
                          SizedBox(height: 5),
                          Container(
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: addressController,
                              decoration: InputDecoration(
                                hintText: 'Address',
                                contentPadding: EdgeInsets.all(10),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('Username',
                              style:
                                  TextStyle(fontSize: 15, fontFamily: 'Inder')),
                          SizedBox(height: 5),
                          Container(
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ],
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
                          SizedBox(height: 10),
                          Text('Password',
                              style:
                                  TextStyle(fontSize: 15, fontFamily: 'Inder')),
                          SizedBox(height: 5),
                          Container(
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ],
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
                          SizedBox(height: 10),
                          Text('Contact',
                              style:
                                  TextStyle(fontSize: 15, fontFamily: 'Inder')),
                          SizedBox(height: 5),
                          Container(
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Contact: Line',
                                contentPadding: EdgeInsets.all(10),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Contact: Instagram',
                                contentPadding: EdgeInsets.all(10),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Contact: Facebook',
                                contentPadding: EdgeInsets.all(10),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/edit.svg',
                            width: 24, height: 24),
                        SizedBox(width: 5),
                        Text('Post',
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'Inder')),
                      ],
                    ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      IconButton(
                                          onPressed: () async {
                                            QuerySnapshot querySnapshot =
                                                await FirebaseFirestore.instance
                                                    .collection('products')
                                                    .where('name',
                                                        isEqualTo:
                                                            document["name"])
                                                    .get();

                                            querySnapshot.docs
                                                .forEach((document) async {
                                              await document.reference.delete();
                                            });
                                          },
                                          icon: SvgPicture.asset(
                                              'assets/icons/bin.svg',
                                              width: 10,
                                              height: 10))
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
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        });
  }
}
