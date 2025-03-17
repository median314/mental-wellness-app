import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/journals/journal_single_questions.dart';

class JournalSingleOnboard extends StatefulWidget {
  const JournalSingleOnboard({super.key});

  @override
  State<JournalSingleOnboard> createState() => _JournalSingleOnboardState();
}

class _JournalSingleOnboardState extends State<JournalSingleOnboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: GradientContainer.containerColorFull2
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Mulai Daily Journal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              Text(
                '“ SMALL REFLECTIONS CREATE BIG CHANGES. LETS BEGIN. ”', 
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff8B4512)
                ),
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) {
                    return JournalSingleQuestions();
                  })
                  );
                }, 
                child: Text('Selanjutnya', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
              )
            ],
          ),
        ),
      ),
    );
  }
}