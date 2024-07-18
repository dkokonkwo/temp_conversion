import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double toolbarHeight;
  const MyAppBar({super.key, required this.toolbarHeight});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  bool _isInfoBoxVisible = false;

  void _toggleInfoBox() {
    setState(() {
      _isInfoBoxVisible = !_isInfoBoxVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          toolbarHeight: 112,
          backgroundColor: Colors.transparent,
          flexibleSpace: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                color: const Color.fromRGBO(37, 45, 60, 0.4),
              ),
            ),
          ),
          title: const Text(
            'Temperature Conversion',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              fontFamily: 'Poppins',
              color: Color(0xffFFFFFF),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 0,
                left: 0,
                right: 20,
              ),
              child: Center(
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      begin: Alignment(-1.0, 0.0),
                      end: Alignment(1.0, 0.0),
                      colors: [
                        Color.fromRGBO(110, 232, 52, 1),
                        Color.fromRGBO(74, 242, 171, 1),
                      ],
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: _toggleInfoBox,
                      icon: const Icon(Iconsax.information),
                      color: Colors.white,
                      iconSize: 40,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (_isInfoBoxVisible)
          Positioned(
            right: 50,
            top: 100,
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Text(
                "UI and Conversion: Design a user interface with Celsius input and a 'Convert' button. History: Keep track of previous conversions and display them below the result.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize {
    final orientation = MediaQuery.of(context).orientation;
    return Size.fromHeight(orientation == Orientation.portrait ? 115 : 60);
  }
}
