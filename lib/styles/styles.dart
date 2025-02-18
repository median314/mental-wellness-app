import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle progressHeader = TextStyle(
    color: Color(0xff8B4512),
    fontSize: 16,
    fontWeight: FontWeight.bold
  );

  static const TextStyle progressBody = TextStyle(
    color: Colors.black,
    fontSize: 14,
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
}