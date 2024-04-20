import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
          searchbox(),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: Text(
              'Category',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // box#1
            Container(
              width: 180,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromRGBO(212, 233, 214, 1.0),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
              ),
              //icon + name
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.local_florist_outlined,
                            color: Colors.black)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Decoration',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            // box#2
            Container(
              width: 180,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromRGBO(212, 218, 233, 1.0),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
              ),
              //icon + name
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.collections_bookmark_outlined,
                            color: Colors.black)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Book',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // box#3
            Container(
              width: 180,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromRGBO(254, 174, 174, 1.0),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
              ),
              //icon + name
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/Gamepad.png',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Game',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            // box#4
            Container(
              width: 180,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromRGBO(227, 199, 156, 1.0),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
              ),
              //icon + name
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chair_outlined, color: Colors.black)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Furniture',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ])
        ]));
  }
  

  Container searchbox() {
    return Container(
        margin: EdgeInsets.only(top: 25, left: 20, right: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color(0xff1D1617).withOpacity(0.11),
              blurRadius: 35.0,
              spreadRadius: 0.0)
        ]),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Search...',
            hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 18),
            suffixIcon: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color.fromRGBO(255, 231, 133, 1.0),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.black)),
            ),
          ),
        ));
  }

}
//         Center(
//         child: ListView(
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => LoginSignupPage()),
//                         (Route<dynamic> route) => false,
//                       );
//                     },
//               style: ButtonStyle(
//                 backgroundColor:
//                     MaterialStateProperty.all<Color>(Color(0xFFFFD93D)),
//                 shape: MaterialStateProperty.all<OutlinedBorder>(
//                   RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0)),
//                 ),
//               ),
//               child: Text('Logout',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontFamily: 'Inder')),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.star_rounded,
//                 color: Color(0xFFFFD93D),
//                 size: 50,
//               ),
//             ),
//           ],
//         ),
//       ),
//       Center(
//         child: Column(
//           children: [
//             Expanded(
//               child:
//               StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection("userImage")
//                     .where("userID", isEqualTo: LoginPage.userId)
//                     .snapshots(),
//                 builder: (BuildContext context,
//                     AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (!snapshot.hasData) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   // var documents = snapshot.data!.docs;
//                   // var imageUrl = documents.isNotEmpty ? documents.first['image'] : '';
//                   //  if (snapshot.connectionState == ConnectionState.done) {
//                   return
//                   Column(
//                     children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                       return
//                       Stack(
//                         children: [
//                           ClipOval(
//                               child: Image.network(
//                                 '${document['image']}',
//                                 width: 160,
//                                 height: 160,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           Positioned(
//                             bottom: 5,
//                             right: 5,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Color(0xFFFFD93D),
//                               ),
//                               child: IconButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => EditPage()),
//                                   );
//                                 },
//                                 icon: SvgPicture.asset(
//                                     "assets/icons/edit.svg"),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),

//       Column(

//         children: [

//           SizedBox(height: 15),
//           Text(
//             '${User.userList[LoginPage.userId].name ?? 'N/A'}',
//             style: TextStyle(fontFamily: 'Inder'),
//           ),
//           Text(
//             '100 followers',
//             style: TextStyle(fontFamily: 'Inder'),
//           ),
//           SizedBox(height: 5),
//         ],
//       ),
//       SizedBox(height: 5),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             onPressed: () {},
//             icon: SvgPicture.asset("assets/icons/facebook.svg"),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: SvgPicture.asset("assets/icons/ig.svg"),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: SvgPicture.asset("assets/icons/line.svg"),
//           ),
//         ],
//       ),
//       Divider(
//         color: Colors.grey,
//       ),

//       Expanded(
//         child: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection("products")
//               .where("userID", isEqualTo: LoginPage.userId)
//               .snapshots(),
//           builder: (BuildContext context,
//               AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return Column(
//               children:
//                   snapshot.data!.docs.map((DocumentSnapshot document) {
//                 return Card(
//                   margin: EdgeInsets.all(15.0),
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10.0),
//                         child: Image.network(
//                           '${document['image']}',
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       SizedBox(width: 15.0),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: 10.0),
//                             Text(
//                               document["name"],
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               "Category: " + document["category"],
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey[700],
//                               ),
//                             ),
//                             SizedBox(height: 2),
//                             Text(
//                               document["caption"],
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey[700],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Column(children: [
//                         starIcon(),
//                         document["value"] == "borrow"
//                             ? Icon(
//                                 Icons.handshake_rounded,
//                                 color: Colors.black,
//                               )
//                             : Text(
//                                 document["value"] + "฿",
//                                 style: TextStyle(
//                                     fontFamily: "Inter",
//                                     fontWeight: FontWeight.w600),
//                               ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         // CircleAvatar(
//                         //   radius: 12,
//                         //   backgroundImage: CachedNetworkImageProvider(
//                         //       imageUrl),
//                         // )
//                       ])
//                     ],
//                   ),
//                 );
//               }).toList(),
//             );
//           },

//         ),

//       )

//       // Expanded(
//       //   child: StreamBuilder<QuerySnapshot>(
//       //     stream: FirebaseFirestore.instance
//       //         .collection("products")
//       //         .where("userID", isEqualTo: LoginPage.userId)
//       //         .snapshots(),
//       //     builder: (BuildContext context,
//       //         AsyncSnapshot<QuerySnapshot> snapshot) {
//       //       if (!snapshot.hasData) {
//       //         return CircularProgressIndicator();
//       //       }
//       //       return ListView.builder(
//       //         itemCount: snapshot.data!.docs.length,
//       //         itemBuilder: (context, index) {
//       //           final DocumentSnapshot document =
//       //               snapshot.data!.docs[index];
//       //           return Card(
//       //             margin: EdgeInsets.all(15.0),
//       //             elevation: 4,
//       //             shape: RoundedRectangleBorder(
//       //               borderRadius: BorderRadius.circular(10.0),
//       //             ),
//       //             child: Row(
//       //               crossAxisAlignment: CrossAxisAlignment.start,
//       //               children: [
//       //                 ClipRRect(
//       //                   borderRadius: BorderRadius.circular(10.0),
//       //                   child: Image.network(
//       //                     '${document['image']}',
//       //                     width: 100,
//       //                     height: 100,
//       //                     fit: BoxFit.cover,
//       //                   ),
//       //                 ),
//       //                 SizedBox(width: 15.0),
//       //                 Expanded(
//       //                   child: Column(
//       //                     crossAxisAlignment: CrossAxisAlignment.start,
//       //                     children: [
//       //                       SizedBox(height: 10.0),
//       //                       Text(
//       //                         document["name"],
//       //                         style: TextStyle(
//       //                           fontSize: 18,
//       //                           fontWeight: FontWeight.bold,
//       //                         ),
//       //                       ),
//       //                       SizedBox(height: 8),
//       //                       Text(
//       //                         "Category: " + document["category"],
//       //                         style: TextStyle(
//       //                           fontSize: 14,
//       //                           color: Colors.grey[700],
//       //                         ),
//       //                       ),
//       //                       SizedBox(height: 2),
//       //                       Text(
//       //                         document["caption"],
//       //                         style: TextStyle(
//       //                           fontSize: 12,
//       //                           color: Colors.grey[700],
//       //                         ),
//       //                       ),
//       //                     ],
//       //                   ),
//       //                 ),
//       //                 Column(children: [
//       //                   starIcon(),
//       //                   document["value"] == "borrow"
//       //                       ? Icon(
//       //                           Icons.handshake_rounded,
//       //                           color: Colors.black,
//       //                         )
//       //                       : Text(
//       //                           document["value"] + "฿",
//       //                           style: TextStyle(
//       //                               fontFamily: "Inter",
//       //                               fontWeight: FontWeight.w600),
//       //                         ),
//       //                   SizedBox(
//       //                     height: 5,
//       //                   ),
//       //                   // CircleAvatar(
//       //                   //   radius: 12,
//       //                   //   backgroundImage: CachedNetworkImageProvider(
//       //                   //       imageUrl),
//       //                   // )
//       //                 ])
//       //               ],
//       //             ),
//       //           );
//       //         },
//       //       );
//       //     },
//       //   ),
//       // ),
//     ],
//   ),
// );