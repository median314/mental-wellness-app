import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';

class Moodselection extends StatefulWidget {
  const Moodselection({super.key});

  @override
  State<Moodselection> createState() => _MoodselectionState();
}

class _MoodselectionState extends State<Moodselection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          gradient: GradientContainer.containerColorFull
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                spacing: 100,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Bagaimana Perasaanmu Hari Ini',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Image.asset("assets/images/capy_login.png", width: 250),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff8B4512),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    onPressed: () {
                      print("pressed");
                    },
                    child: Text(
                      "Pilih",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}