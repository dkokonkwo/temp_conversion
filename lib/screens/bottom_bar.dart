import 'package:flutter/material.dart';
import 'package:temp_conversion/database/history.dart';
import 'package:temp_conversion/screens/list_history.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  String dropdownValue = "Sort By";
  bool reversed = false;

  void _deleteHistory() {
    setState(() {
      History.conversions.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 0,
        left: 0,
        right: 0,
      ),
      child: Container(
        height: 80,
        // Increase height to accommodate icon and text
        decoration: const BoxDecoration(
            color: Color(0xff263D2E),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        child: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                          backgroundColor: const Color(0xff263D2E),
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              void _sortBy(String? selectedValue) {
                                if (selectedValue != null) {
                                  setState(() {
                                    dropdownValue = selectedValue;
                                    if (selectedValue == "Newest") {
                                      reversed = true;
                                    } else {
                                      reversed = false;
                                    }
                                  });
                                }
                              }

                              return const SizedBox(
                                height: 450,
                                child: Center(
                                  child: ListHistory(),
                                ),
                              );
                            });
                          },
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 185,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xff74EB3C),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(2, 18, 44, 0.5),
                              spreadRadius: 8,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 10), // Adjust the shadow position
                            ),
                          ],
                        ),
                        child: const Center(
                            child: Text(
                          'View History',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.white),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: _deleteHistory,
                      child: Container(
                        height: 45,
                        width: 185,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xff74EB3C),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(2, 18, 44, 0.5),
                              spreadRadius: 8,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 10), // Adjust the shadow position
                            ),
                          ],
                        ),
                        child: const Center(
                            child: Text(
                          'Delete History',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
