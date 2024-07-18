import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:temp_conversion/database/history.dart';

class ListHistory extends StatefulWidget {
  const ListHistory({super.key});

  @override
  State<ListHistory> createState() => _ListHistoryState();
}

class _ListHistoryState extends State<ListHistory> {
  String dropdownValue = "Sort By";
  bool reversed = false;

  void _deleteHistory() {
    setState(() {
      History.conversions.clear();
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Iconsax.close_circle,
                    size: 35,
                    color: Colors.white,
                  ))
              : null,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 55,
              width: 120,
              decoration: BoxDecoration(
                color: const Color(0xff324F38),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff335132),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(-4, 4), // Adjust the shadow position
                  ),
                  BoxShadow(
                    color: Color(0xff252B39),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(4, 4), // Adjust the shadow position
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
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff335132),
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset: Offset(-4, -4), // Adjust the shadow position
                  ),
                  BoxShadow(
                    color: Color(0xff252B39),
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset: Offset(4, 4), // Adjust the shadow position
                  ),
                ],
              ),
              child: Center(
                child: DropdownButton(
                  onChanged: _sortBy,
                  value: dropdownValue,
                  underline: Container(
                    color: Colors.transparent,
                  ),
                  isExpanded: true,
                  dropdownColor: const Color(0xafADEE42),
                  borderRadius: BorderRadius.circular(10),
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
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        )),
                    DropdownMenuItem(
                        value: "Newest",
                        child: Text(
                          'Newest',
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        )),
                    DropdownMenuItem(
                        value: "Oldest",
                        child: Text(
                          'Oldest',
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
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
                      ? History.conversions.reversed.toList()[index]
                      : History.conversions[index],
                  style: const TextStyle(
                      fontFamily: 'Poppins', fontSize: 20, color: Colors.white),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
