import 'package:flutter/material.dart';
import 'package:temp_conversion/screens/list_history.dart';

class LandHistory extends StatefulWidget {
  const LandHistory({super.key});

  @override
  State<LandHistory> createState() => _LandHistoryState();
}

class _LandHistoryState extends State<LandHistory> {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth / 2,
      decoration: const BoxDecoration(color: Color(0xff263D2E)),
      child: const ListHistory(),
    );
  }
}
