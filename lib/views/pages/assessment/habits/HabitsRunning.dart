import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/habits/HabitReview.dart';
import 'package:flutter_application_test/views/pages/home_page.dart';

class Habitsrunning extends StatefulWidget {
  const Habitsrunning({super.key});

  @override
  State<Habitsrunning> createState() => _HabitsrunningState();
}

class _HabitsrunningState extends State<Habitsrunning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(  // Changed from Container to Stack
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height/1.5,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 65, left: 20, right: 20, bottom: 20),
                      height: MediaQuery.sizeOf(context).height/2.5,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            offset: Offset(0, 5),
                            spreadRadius: 5,
                            blurRadius: 10
                          )
                        ],
                        gradient: GradientContainer.containerColorFull,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width/8,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Habitreview();
                                      })
                                    );
                                  },
                                  child: Icon(Icons.arrow_back_ios_new_rounded)
                                )
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              'Lari lari ke puncak gunung', 
                              textAlign: TextAlign.center, 
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ),
                          SizedBox(height: 30,),
                          Center(
                            child: Text(
                              '20:01', 
                              textAlign: TextAlign.center, 
                              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xff8B4512)),
                            )
                          ),
                          SizedBox(height: 20,),
                          Center(
                            child: Text(
                              'Semangat!!', 
                              textAlign: TextAlign.center, 
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.sizeOf(context).height/3 - 30,  // Adjust this value to control overlap
                left: (MediaQuery.sizeOf(context).width - 250) / 2,  // Centers the image
                child: Image.asset(
                  "assets/images/capy_login.png", 
                  width: 250,
                )
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff8B4512),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            onPressed: () {
      
            }, 
            child: Text('Pause', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Text(
              '“ Don’t forget to drink water, if it makes you tired, feel free to break. “',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff8B4512)),
            ),
          )
        ],
      ),
    );
  }
}