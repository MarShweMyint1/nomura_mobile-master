import 'package:flutter/material.dart';

class ColorUtils {
  static Color primary = HexColor.fromHex("#CA2420");
  static Color lightprimary = HexColor.fromHex("#F76A6A");
  static Color dark = HexColor.fromHex("#1A1A1A");
  static Color darkGrey = HexColor.fromHex("#272727");
  static Color lighDark = HexColor.fromHex("#3C3C3C");
  static Color ligthRed = HexColor.fromHex("#F47E7E");
  static Color grey = HexColor.fromHex("#767676");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color textBlack = HexColor.fromHex("#221F1F");
  static Color black = HexColor.fromHex("#000000");
  static Color lightGrey = HexColor.fromHex('#BA1A16');
  static Color boldGreen = HexColor.fromHex("#339566");
  static Color transparent = Colors.transparent;
  static Color yellow = Colors.yellow;
  static Color green = Colors.green;
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
