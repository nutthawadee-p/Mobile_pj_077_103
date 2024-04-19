import 'package:flutter/material.dart';
import 'package:share/pages/app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/pages/bottom_nav_bar.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Color(0xFFFFFBEB),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/edit.svg', width: 24, height: 24),
                  SizedBox(width: 5),
                  Text('Profile', style: TextStyle(fontSize: 20, fontFamily: 'Inder')),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavBar(initialIndex: 4)),
                    (Route<dynamic> route) => false,
                  );  
                }, 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFD93D)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                child: Text('Save', style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'Inder')),              
              ),
            ],
          ),
          SizedBox(height: 10),
          Center(
            child: CircleAvatar(
              radius: 60,
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name', style: TextStyle(fontSize: 15, fontFamily: 'Inder')),
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
                    hintText: 'Name',
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                    
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Contact', style: TextStyle(fontSize: 15, fontFamily: 'Inder')),
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
          SizedBox(height: 10),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset('assets/icons/edit.svg', width: 24, height: 24),
              SizedBox(width: 5),
              Text('Post', style: TextStyle(fontSize: 20, fontFamily: 'Inder')),
            ],
          ),
        ],
      ),
    );
  }
}
