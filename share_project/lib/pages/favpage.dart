import 'package:flutter/material.dart';
import 'package:share_project/models/starprod.dart';
import 'package:share_project/pages/app_bar.dart'; // Assuming StarProduct is defined in a separate file

class StarPage extends StatefulWidget {
  const StarPage({Key? key}) : super(key: key);

  @override
  State<StarPage> createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  List<Product> categories = [];

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  void _getCategories() {
    categories = Product.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Color(0xFFFFFBEB),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 95, vertical: 40),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Favorites',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inder',
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2  ), 
                            spreadRadius: 1, 
                            blurRadius: 2,
                            blurStyle: BlurStyle.inner,
                            offset: Offset(0, 3), 
                        )
                      ]),
                      child: Icon(Icons.star_rounded,color: Color.fromRGBO(255, 217, 61, 1.0),))
                  ],
                ),
              ),
            ),
            Column(
              children: categories.map((Product product) {
                return Card(
                  margin: EdgeInsets.all(15.0),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE), // Change the background color here
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            product.image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(height: 10.0),
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Category: " + product.category,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                product.caption,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star_rounded),
                            // starIcon(),
                            product.value == "borrow"
                                ? Icon(
                                    Icons.handshake_rounded,
                                    color: Colors.black,
                                  )
                                : Text(
                                    product.value + "฿",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            CircleAvatar(
                              radius: 12,
                              // backgroundImage: CachedNetworkImageProvider(imageUrl),
                            )
                          ],
                        ),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
