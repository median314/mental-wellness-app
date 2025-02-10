import 'package:flutter/material.dart';

class MyPromoPage extends StatefulWidget {
  const MyPromoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyPromoPage();
  }
}

class _MyPromoPage extends State<StatefulWidget> {
  String? title = "Available Promo";
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Promo Nih'),
      );
  }
}