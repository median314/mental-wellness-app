import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle progressHeader = TextStyle(
    color: Color(0xff8B4512),
    fontSize: 16,
    fontWeight: FontWeight.bold
  );

  static const TextStyle progressBody = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w500
  );
}

abstract class GradientContainer {
  static const LinearGradient containerColor = LinearGradient(
    colors: [Color(0xffffbe00), Color(0xffFFF5DC)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0, 1.2]
  );

  static const LinearGradient containerColorFull = LinearGradient(
    colors: [Color(0xffffbe00), Color(0xffFFF5DC)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.2, 1.3]
  );

  static const LinearGradient containerColorFull2 = LinearGradient(
    colors: [Color(0xffffbe00), Color(0xffFFF5DC)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.3, 1]
  );
}

abstract class TextColor {
  static const Color primary = Color(0xff8B4512);
  static const Color secondary = Color(0xff364153);
  // static const Color primary = Color(0xff8B4512);
}