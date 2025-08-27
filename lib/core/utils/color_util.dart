import 'package:flutter/material.dart';

class ColorUtil {
  static Color changeHex(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return Colors.white;
    try {
      return Color(int.parse(hexColor.replaceFirst('#', '0xff')));
    } catch (e) {
      return Colors.white;
    }
  }
}
