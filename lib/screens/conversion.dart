import 'package:flutter/material.dart';
import 'package:temp_conversion/screens/bottom_bar.dart';
import 'package:temp_conversion/screens/my_appbar.dart';
import 'package:temp_conversion/screens/temp_conversion.dart';

class Conversion extends StatelessWidget {
  const Conversion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/calc.jpg'))),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar(),
        body: TempConversion(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
