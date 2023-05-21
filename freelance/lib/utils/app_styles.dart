import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Color primary = const Color.fromARGB(255, 25, 167, 206);
Color primary2 = const Color.fromARGB(255, 175, 211, 226);

class Styles {
  static Color primaryColor = primary;
  static Color textColor = const Color.fromARGB(255, 0, 0, 0);
  static Color secondaryColor = const Color.fromARGB(255, 175, 211, 226);
  static Color colorhome = Colors.white;
  static TextStyle splashscreen =
      TextStyle(fontSize: 26, color: colorhome, fontWeight: FontWeight.bold);
  static TextStyle textStyle =
      TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle1 =
      TextStyle(fontSize: 22, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle2 =
      TextStyle(fontSize: 12, color: primary, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle3 =
      TextStyle(fontSize: 14, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle4 =
      TextStyle(fontSize: 14, color: textColor, fontWeight: FontWeight.w500);
}
