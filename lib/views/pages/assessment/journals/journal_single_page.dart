import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/journals/journal_single_onboard.dart';

class JournalSinglePage extends StatefulWidget {
  const JournalSinglePage({super.key});

  @override
  State<JournalSinglePage> createState() => _JournalSinglePageState();
}

class _JournalSinglePageState extends State<JournalSinglePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 20,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height/2.5,
            padding: EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
              gradient: GradientContainer.containerColorFull
            ),
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 20,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xff8B4512),),
                    Text('Daily Journal', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff8B4512)),),
                  ],
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    'Jurnal harian untuk bercerita apa yang terjadi hari ini dan refleksi diri untuk menjadi lebih baik',
                    style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xff8B4512)),
                  )
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff8B4512),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) {
                        return JournalSingleOnboard();
                      })
                    );
                  },
                  child: Text('Mulai', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                )
              ],
            )
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Riwayat Journal Kamu', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff8B4512)),),
                SizedBox(
                  height: 430,
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 10,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: GradientContainer.containerColorFull2,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                                decoration: BoxDecoration(
                                  // color: Color(0xff8B4512),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text('12 November 2020', style: TextStyle(color: Color(0xff8B4512), fontWeight: FontWeight.w500, fontSize: 12),),
                              ),
                              SizedBox(height: 10,),
                              Text('My Daily Journal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                              SizedBox(height: 5,),
                              Text('Daily Journal', style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: GradientContainer.containerColorFull2,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                                decoration: BoxDecoration(
                                  // color: Color(0xff8B4512),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text('12 November 2020', style: TextStyle(color: Color(0xff8B4512), fontWeight: FontWeight.w500, fontSize: 12),),
                              ),
                              SizedBox(height: 10,),
                              Text('My Daily Journal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                              SizedBox(height: 5,),
                              Text('Daily Journal', style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: GradientContainer.containerColorFull2,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                                decoration: BoxDecoration(
                                  // color: Color(0xff8B4512),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text('12 November 2020', style: TextStyle(color: Color(0xff8B4512), fontWeight: FontWeight.w500, fontSize: 12),),
                              ),
                              SizedBox(height: 10,),
                              Text('My Daily Journal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                              SizedBox(height: 5,),
                              Text('Daily Journal', style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: GradientContainer.containerColorFull2,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                                decoration: BoxDecoration(
                                  // color: Color(0xff8B4512),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text('12 November 2020', style: TextStyle(color: Color(0xff8B4512), fontWeight: FontWeight.w500, fontSize: 12),),
                              ),
                              SizedBox(height: 10,),
                              Text('My Daily Journal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                              SizedBox(height: 5,),
                              Text('Daily Journal', style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}