import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/mood/MoodStats.dart';

class Moodreview extends StatefulWidget {
  const Moodreview({super.key});

  @override
  State<Moodreview> createState() => _MoodreviewState();
}

class _MoodreviewState extends State<Moodreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 30),
                Image.asset("assets/images/capy_login.png", width: 200),
                SizedBox(height: 50),
                Text(
                  'Senang Mendengarnya!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  child: Text(
                    'Mood bahagia kamu pasti tertular ke orang disekitarmu. Semoga terus berlanjut kedepannya',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: GradientContainer.containerColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Lihat tips mempertahankan mood kamu',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, size: 20,)
                ],
              ),
            ),
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    spacing: 10,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingin menceritakannya?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                        )
                      ),
                      TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Mood saya hari ini...",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff8B4512),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Moodstats();
                                }
                              )
                            );
                            print('Saved Mood');
                          }, 
                          child: Text(
                            'Selanjutnya',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                      )
                    ],
                  ),
                )
              ]
          ),
                ),
        );
  }
}