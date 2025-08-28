import 'package:flutter/material.dart';

class GradientUtil {
  static LinearGradient fromHexList(List<String>? colors,
      {Alignment begin = Alignment.bottomRight,
      Alignment end = Alignment.topLeft}) {
    final gradientColors = colors
            ?.map((c) => Color(int.parse(c.replaceFirst('#', '0xff'))))
            .toList() ??
        [Colors.grey, Colors.black12];

    return LinearGradient(
      begin: begin,
      end: end,
      colors: gradientColors,
    );
  }
}
