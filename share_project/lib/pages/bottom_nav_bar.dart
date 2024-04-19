import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/pages/CreatePage.dart';
import 'package:share/pages/HomePage.dart';
import 'package:share/pages/MapPage.dart';
import 'package:share/pages/ProfilePage.dart';
import 'package:share/pages/SearchPage.dart';
import 'package:share/pages/app_bar.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;

  const BottomNavBar({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }
  
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),  
    SearchPage(),
    CreatePage(),
    MapPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFD93D),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_selectedIndex == 0 ? 'assets/icons/home_bold.svg' :'assets/icons/home_outline.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_selectedIndex == 1 ? 'assets/icons/search_bold.svg' :'assets/icons/search_outline.svg'),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_selectedIndex == 2 ? 'assets/icons/create_bold.svg' :'assets/icons/create_outline.svg'),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_selectedIndex == 3 ? 'assets/icons/map_bold.svg' :'assets/icons/map_outline.svg'),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_selectedIndex == 4 ? 'assets/icons/profile_bold.svg' :'assets/icons/profile_outline.svg'),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(fontFamily: 'Inder'),
        unselectedLabelStyle: TextStyle(fontFamily: 'Inder'),
      ),
    );
  }
}