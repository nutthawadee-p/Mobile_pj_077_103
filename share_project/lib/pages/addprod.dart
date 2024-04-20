import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:share_project/models/productinfo.dart';
import 'package:share_project/models/user.dart';
import 'package:share_project/pages/LoginPage.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  XFile? _image;
  String imageUrl = '';
  // String borval = '';

  final formkey = GlobalKey<FormState>();

  Product product = Product(
      userID: '', name: '', caption: '', category: '', location: '', value: '');

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

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
        imageUrl = await referenceImageToUpload.getDownloadURL();
      } catch (error) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
    FutureBuilder(
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
              backgroundColor: Color(0xFFFFFBEB),
              body: Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          child: _image != null
                              ? Image.file(File(_image!.path))
                              : Placeholder(),
                        ),
                        ElevatedButton(
                          onPressed: _getImage,
                          child: Text('Choose Image'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 5.0, bottom: 10.0, left: 15.0, right: 15.0),
                          // width: ,
                          decoration: BoxDecoration(
                              // shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Name',
                            ),
                            onSaved: (String? name) {
                              product.name = name!;
                            },
                            validator: RequiredValidator(
                                errorText: "Please enter your name "),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 5.0, bottom: 10.0, left: 15.0, right: 15.0),
                          // width: ,
                          decoration: BoxDecoration(
                              // shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Caption',
                            ),
                            onSaved: (String? caption) {
                              product.caption = caption!;
                            },
                            validator: RequiredValidator(
                                errorText: "Please enter your caption "),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 5.0, bottom: 10.0, left: 15.0, right: 15.0),
                          // width: ,
                          decoration: BoxDecoration(
                              // shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Category',
                            ),
                            onSaved: (String? category) {
                              product.category = category!;
                            },
                            validator: RequiredValidator(
                                errorText: "Please enter your category "),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(
                              top: 5.0, bottom: 10.0, left: 15.0, right: 15.0),
                          // width: ,
                          decoration: BoxDecoration(
                              // shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Location',
                            ),
                            onSaved: (String? location) {
                              product.location = location!;
                            },
                            validator: RequiredValidator(
                                errorText: "Please enter your location "),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // borrow or price
                        Text(
                          'Please enter "borrow" or price ',
                          style: TextStyle(
                            fontFamily: "Inter",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 5.0, bottom: 10.0, left: 15.0, right: 15.0),
                          // width: ,
                          decoration: BoxDecoration(
                              // shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: '"borrow" or price',
                            ),
                            onSaved: (String? value) {
                              product.value = value!;
                            },
                            validator: RequiredValidator(
                                errorText: "Please enter 'borrow' or price "),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState?.save(); // call every onSaved for set value
                              await FirebaseFirestore.instance
                                  .collection("products")
                                  .add({
                                "name": product.name,
                                "caption": product.caption,
                                "category": product.category,
                                "location": product.location,
                                "image": imageUrl,
                                "value": product.value,
                                "userID": LoginPage.userId ,
                              });
                              formkey.currentState?.reset();

                              print("${product.name}");
                              print("${product.caption}");
                              print("${product.category}");
                              print("${product.location}");
                              print("${product.value}");
                            }
                          },
                          child: Text(
                            'Post',
                            style: TextStyle(
                                fontFamily: "Inter", color: Colors.black),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(255, 217, 61, 1.0)),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        horizontal: 70, vertical: 8)),
                          ),
                        ),
                      ]),
                    ),
                  )),
            );
          }
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        });
  }
}

