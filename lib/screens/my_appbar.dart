import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(115);
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
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                    icon: const Icon(Iconsax.info_circle),
                    color: Colors.white,
                    iconSize: 33,
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
}
