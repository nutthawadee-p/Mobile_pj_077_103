import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

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
