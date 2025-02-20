import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/mood/MoodReview.dart';
import 'package:flutter_application_test/views/pages/home_page.dart';

class Moodselection extends StatefulWidget {
  const Moodselection({super.key});

  @override
  State<Moodselection> createState() => _MoodselectionState();
}

class MoodCollection {
  int id;
  String name;
  String emoji;

  MoodCollection({ required this.id, required this.name, required this.emoji });
}

class _MoodselectionState extends State<Moodselection> {
  
  List<MoodCollection> moods = [
    MoodCollection(id: 1, name: "Happy", emoji: "Happy Emoji"),
    MoodCollection(id: 2, name: "Normal", emoji: "Normal Emoji"),
    MoodCollection(id: 3, name: "Sad", emoji: "Sad Emoji"),
    MoodCollection(id: 4, name: "Angry", emoji: "Angry Emoji"),
    MoodCollection(id: 5, name: "Overwhelmed", emoji: "Overwhelmed Emoji"),
  ];

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
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) {
                            return Moodreview();
                          }
                        )
                      );
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