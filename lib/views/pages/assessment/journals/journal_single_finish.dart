import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/journals/journal_home_page.dart';

class JournalSingleFinish extends StatefulWidget {
  const JournalSingleFinish({super.key});

  @override
  State<JournalSingleFinish> createState() => _JournalSingleFinishState();
}

class _JournalSingleFinishState extends State<JournalSingleFinish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: GradientContainer.containerColorFull
        ),
        child: Center(
          child: Column(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                spacing: 5,
                children: [
                  Text('20 November 2022', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  Text('Daily Journal', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ],
              ),
              Text(
                'Great job! You’ve taken time for yourself today, and that’s amazing. Every small reflection helps you grow. See you next time!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Image.asset("assets/images/capy_login.png", width: 250,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff8B4512)
                ),
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                    context, 
                    MaterialPageRoute(builder: (context){
                      return JournalHomePage();
                    }), 
                    (route) => false
                  );
                }, 
                child: Text('Kembali ke Journal', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
              )
            ],
          ),
        ),
      ),
    );
  }
}