import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_pj_1/models/productinfo.dart';
class addInfo extends StatefulWidget {
  const addInfo({super.key});

  @override
  State<addInfo> createState() => _addInfoState();
}

class _addInfoState extends State<addInfo> {
  final formkey = GlobalKey<FormState>();
   Product product = Product(name: '', caption: '', category: '', linkphoto: '', location: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(children: [
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
                  validator:
                      RequiredValidator(errorText: "Please enter your name "),
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
                    hintText: 'Link photo',
                  ),
                  onSaved: (String? linkphoto) {
                    product.linkphoto = linkphoto!;
                  },
                  validator:
                      RequiredValidator(errorText: "Please enter your photo "),
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
                    product.linkphoto = location!;
                  },
                  validator: RequiredValidator(
                      errorText: "Please enter your location "),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // borrow or price
              Row(
                children: [],
              ),
              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState
                        ?.save(); // call every onSaved for set value
                    print("${product.name}");
                    print("${product.caption}");
                    print("${product.category}");
                    print("${product.linkphoto}");
                    print("${product.location}");
                  }
                },
                child: Text('Post'),
              ),
            ]),
          )),
    );
    
  }
}
