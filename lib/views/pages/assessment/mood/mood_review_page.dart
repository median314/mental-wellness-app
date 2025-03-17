import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/mood/mood_stats_page.dart';

class Moodreview extends StatefulWidget {
  const Moodreview({super.key});

  @override
  State<Moodreview> createState() => _MoodreviewState();
}

class _MoodreviewState extends State<Moodreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 70),
                  Image.asset("assets/images/capy_login.png", width: 200),
                  SizedBox(height: 50),
                  Text(
                    'Senang Mendengarnya!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff8B4512),
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
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                padding: EdgeInsets.all(15),
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
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined, size: 16,)
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
                          style: TextStyle(fontSize: 14),
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
          ),
        );
  }
}