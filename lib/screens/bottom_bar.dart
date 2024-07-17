import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:temp_conversion/database/history.dart';

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

                              return SizedBox(
                                height: 450,
                                child: Center(
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            icon: const Icon(
                                              Iconsax.close_circle,
                                              size: 35,
                                              color: Colors.white,
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 55,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff324F38),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color(0xff335132),
                                                  spreadRadius: 0,
                                                  blurRadius: 10,
                                                  offset: Offset(-4,
                                                      4), // Adjust the shadow position
                                                ),
                                                BoxShadow(
                                                  color: Color(0xff252B39),
                                                  spreadRadius: 0,
                                                  blurRadius: 10,
                                                  offset: Offset(4,
                                                      4), // Adjust the shadow position
                                                ),
                                              ],
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'History',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffADEE42)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 55,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff2b3f28),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color(0xff335132),
                                                  spreadRadius: 0,
                                                  blurRadius: 8,
                                                  offset: Offset(-4,
                                                      -4), // Adjust the shadow position
                                                ),
                                                BoxShadow(
                                                  color: Color(0xff252B39),
                                                  spreadRadius: 0,
                                                  blurRadius: 8,
                                                  offset: Offset(4,
                                                      4), // Adjust the shadow position
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: DropdownButton(
                                                onChanged: _sortBy,
                                                value: dropdownValue,
                                                isExpanded: true,
                                                dropdownColor:
                                                    const Color(0xafADEE42),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                icon: const Icon(
                                                  Iconsax.setting_5,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                                items: const [
                                                  DropdownMenuItem(
                                                      value: "Sort By",
                                                      child: Text(
                                                        'Sort By',
                                                        style: TextStyle(
                                                            fontSize: 22,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.white),
                                                      )),
                                                  DropdownMenuItem(
                                                      value: "Newest",
                                                      child: Text(
                                                        'Newest',
                                                        style: TextStyle(
                                                            fontSize: 22,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.white),
                                                      )),
                                                  DropdownMenuItem(
                                                      value: "Oldest",
                                                      child: Text(
                                                        'Oldest',
                                                        style: TextStyle(
                                                            fontSize: 22,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.white),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          physics: const ScrollPhysics(),
                                          primary: false,
                                          shrinkWrap: true,
                                          itemCount: History.conversions.length,
                                          // The number of items you want to display
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              title: Text(
                                                reversed
                                                    ? History
                                                        .conversions.reversed
                                                        .toList()[index]
                                                    : History
                                                        .conversions[index],
                                                style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
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
