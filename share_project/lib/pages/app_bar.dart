import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "SHARE",
        style: TextStyle(
            fontFamily: 'Monofett', color: Colors.white, fontSize: 50),
      ),
      backgroundColor: Color(0xFFFFD93D),
      centerTitle: true,
    );
  }
}
