import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/home_page.dart';

class Moodstats extends StatefulWidget {
  const Moodstats({super.key});

  @override
  State<Moodstats> createState() => _MoodstatsState();
}

class _MoodstatsState extends State<Moodstats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 30),
              // height: MediaQuery.sizeOf(context).height/2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(0, 4),
                  blurRadius: 10,
                  spreadRadius: 10,
                  
                )]
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width*0.1,
                        child: Center(
                          child: IconButton(
                            onPressed: (){
                              Navigator.pushAndRemoveUntil(context, 
                              MaterialPageRoute(
                                builder: (context){
                                  return HomePage();
                                }
                              ), (route) => false
                              );
                            }, 
                            icon: Icon(Icons.home_outlined)
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width*0.75,
                        child: Center(
                          child: Text(
                            'Minggu, 29 Februari 2025',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff8B4512)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width*0.05,
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Image.asset("assets/images/capy_login.png", width: 120),
                  SizedBox(height: 20),
                  Text(
                    'Mood Ayam Jago Sedang Bahagia',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8B4512)
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Hari ini bahagia karena lagi dapat client baru dengan projeknya yang besar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8B4512)
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Column(
                    spacing: 10,
                    children: [
                      Text(
                        'Overall Mood',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.grey),
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        height: 150,
                      ),
                      SizedBox(height: 5,),
                      SizedBox(
                        height: 270,
                        child: SingleChildScrollView(
                          child: Column(
                            spacing: 15,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: GradientContainer.containerColorFull,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  spacing: 15,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Emoji', style: TextStyle(fontSize: 12),),
                                        Text('Happy', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Sabtu, 28 Februari 2025', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xff8B4512)),),
                                        Text('Pokoknya sedih banget gaji dipotong', style: TextStyle(fontSize: 11),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: GradientContainer.containerColorFull,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  spacing: 15,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Emoji', style: TextStyle(fontSize: 12),),
                                        Text('Happy', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Sabtu, 28 Februari 2025', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xff8B4512)),),
                                        Text('Pokoknya sedih banget gaji dipotong', style: TextStyle(fontSize: 11),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: GradientContainer.containerColorFull,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  spacing: 15,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Emoji', style: TextStyle(fontSize: 12),),
                                        Text('Happy', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Sabtu, 28 Februari 2025', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xff8B4512)),),
                                        Text('Pokoknya sedih banget gaji dipotong', style: TextStyle(fontSize: 11),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: GradientContainer.containerColorFull,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  spacing: 15,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Emoji', style: TextStyle(fontSize: 12),),
                                        Text('Happy', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Sabtu, 28 Februari 2025', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xff8B4512)),),
                                        Text('Pokoknya sedih banget gaji dipotong', style: TextStyle(fontSize: 11),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: GradientContainer.containerColorFull,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  spacing: 15,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Emoji', style: TextStyle(fontSize: 12),),
                                        Text('Happy', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Sabtu, 28 Februari 2025', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xff8B4512)),),
                                        Text('Pokoknya sedih banget gaji dipotong', style: TextStyle(fontSize: 11),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}