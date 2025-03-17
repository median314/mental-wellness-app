import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';

class Habitsrunning extends StatefulWidget {
  final String activityTitle;

  const Habitsrunning({
    super.key,
    required this.activityTitle
  });

  @override
  State<Habitsrunning> createState() => _HabitsrunningState();
}

class _HabitsrunningState extends State<Habitsrunning> {
  late final _title;
  bool isRunning  = false;

  void toggleTimer() {
    setState(() {
      isRunning = !isRunning;
    });
  }

  @override
  void initState() {
    super.initState();
    _title = widget.activityTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          _title,
          style: TextStyle(
            color: TextColor.primary,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins'
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(  // Changed from Container to Stack
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height/1.5,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 65, left: 20, right: 20, bottom: 20),
                      height: MediaQuery.sizeOf(context).height/2,
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
                          SizedBox(height: 50,),
                          Center(
                            child: Text(
                              '20:01', 
                              textAlign: TextAlign.center, 
                              style: TextStyle(
                                fontSize: 50, 
                                fontWeight: FontWeight.bold, 
                                color: Color(0xff8B4512),
                                fontFamily: 'Nunito'
                              ),
                            )
                          ),
                          SizedBox(height: 20,),
                          Center(
                            child: Text(
                              'Semangat!!', 
                              textAlign: TextAlign.center, 
                              style: TextStyle(
                                color: TextColor.primary,
                                fontSize: 18, 
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito'
                              ),
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
                left: (MediaQuery.sizeOf(context).width - 300) / 2,  // Centers the image
                child: Image.asset(
                  "assets/images/capy_content.png", 
                  width: 300,
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
              print("mulai");
              toggleTimer();
            }, 
            child: Text(
              isRunning ? 'Pause':'Start', 
              style: TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.bold
              )
            )
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            width: MediaQuery.sizeOf(context).width,
            child: Text(
              '“ Don’t forget to drink water, if it makes you tired, feel free to break. “',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.w600, 
                color: Color(0xff8B4512),
                fontFamily: 'Poppins'
              ),
            ),
          )
        ],
      ),
    );
  }
}