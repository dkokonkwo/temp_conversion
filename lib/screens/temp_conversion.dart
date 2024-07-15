import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:temp_conversion/database/history.dart';

class TempConversion extends StatefulWidget {
  const TempConversion({super.key});

  @override
  State<TempConversion> createState() => _TempConversionState();
}

class _TempConversionState extends State<TempConversion> {
  double screenHeight = 0;
  double screenWidth = 0;

  double answer = 0.00;

  final TextEditingController _controller = TextEditingController();
  double? _inputValue;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final int _isOn = 0xff74EB3C;
  final int _isOff = 0xff22331F;
  int shadow = 0xff364055;

  bool _fToC = true;

  void _toggleConversion() {
    setState(() {
      _fToC = !_fToC;
    });
  }

  void _convert() {
    _inputValue = double.tryParse(_controller.text);
    if (_inputValue != null) {
      setState(() {
        answer =
            _fToC ? (_inputValue! - 32) * (5 / 9) : (_inputValue! * 9 / 5) + 32;
        String save =
            "$_inputValue ${_fToC ? "°F" : "°C"} => ${answer.toStringAsFixed(1)}${_fToC ? "°C" : "°F"}";
        History.conversions.add(save);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenHeight / 2,
        width: screenWidth,
        child: Column(
          children: [
            Container(
              height: 57,
              width: 359,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff355D3B),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _fToC = true;
                      });
                    },
                    child: _fToC
                        ? currentConversion('°F to °C')
                        : otherConversion('°F to °C'),
                  ),
                  InkWell(
                    onTap: _toggleConversion,
                    child: !_fToC
                        ? currentConversion('°C to °F')
                        : otherConversion('°C to °F'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 55,
                  width: 161,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(30, 60, 45, 0.4),
                    border: Border.all(
                      color: Color(_isOn),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 48,
                        width: 90,
                        child: Center(
                          child: TextField(
                            controller: _controller,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'Poppins'),
                            maxLines: 1, // Allows multiple lines
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            decoration: const InputDecoration(
                              hintText: '0.00',
                              // Optional: Add a border
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 55,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border(
                                left:
                                    BorderSide(width: 2, color: Color(_isOn))),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        child: Center(
                          child: Text(
                            _fToC ? '°F' : '°C',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: _toggleConversion,
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(_isOn),
                      ),
                      child: const Center(
                          child: Icon(
                        Iconsax.arrow_swap_horizontal,
                        size: 35,
                        color: Colors.white,
                      ))),
                ),
                Container(
                  height: 55,
                  width: 161,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(30, 60, 45, 0.4),
                    border: Border.all(
                      color: Color(_isOn),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 53,
                        width: 110,
                        child: Center(
                          child: Text('${answer.toStringAsFixed(1)}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  fontFamily: 'Poppins')),
                        ),
                      ),
                      Container(
                        height: 55,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border(
                                left:
                                    BorderSide(width: 2, color: Color(_isOn))),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        child: Center(
                          child: Text(
                            _fToC ? '°C' : '°F',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () => _convert(),
              child: Container(
                height: 54,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment(0.0, -1.0),
                    end: Alignment(1.0, 1.0),
                    colors: [
                      Color.fromRGBO(120, 232, 52, 1),
                      Color.fromRGBO(74, 242, 151, 1),
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(43, 52, 69, 0.6),
                      spreadRadius: 10,
                      blurRadius: 30,
                      offset: Offset(0, 20), // Adjust the shadow position
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Convert',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget currentConversion(String conv) {
    return Container(
      height: 42,
      width: 169,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(_isOn),
      ),
      child: Center(
        child: Text(
          conv,
          style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }

  Widget otherConversion(String conv) {
    return Container(
      height: 42,
      width: 169,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Color(_isOff),
        boxShadow: [
          BoxShadow(
            color: Color(shadow),
          ),
          BoxShadow(
            color: Color(_isOff),
            spreadRadius: -2.0,
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          conv,
          style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
