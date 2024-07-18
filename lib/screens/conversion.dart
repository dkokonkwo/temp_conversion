import 'package:flutter/material.dart';
import 'package:temp_conversion/screens/bottom_bar.dart';
import 'package:temp_conversion/screens/land_history.dart';
import 'package:temp_conversion/screens/my_appbar.dart';
import 'package:temp_conversion/screens/temp_conversion.dart';

class Conversion extends StatelessWidget {
  const Conversion({super.key});

  @override
  Widget build(BuildContext context) {
    double Height =
        MediaQuery.of(context).orientation == Orientation.portrait ? 115 : 60;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/calc.jpg'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar(toolbarHeight: Height),
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? const TempConversion()
            : const Row(
                children: [TempConversion(), LandHistory()],
              ),
        bottomNavigationBar:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? const BottomBar()
                : null,
      ),
    );
  }
}
