import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

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
                                            color: const Color(0xff32B3F28),
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
                                          child: const Center(
                                            child: Text(
                                              'Sort By',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 185,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff74EB3C),
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
                    Container(
                      height: 45,
                      width: 185,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff74EB3C),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(2, 18, 44, 0.5),
                            spreadRadius: 8,
                            blurRadius: 10,
                            offset: Offset(0, 10), // Adjust the shadow position
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
                  ],
                ))),
      ),
    );
  }
}
