import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_conversion/screens/conversion.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Conversion(),
    );
  }
}
