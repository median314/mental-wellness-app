import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/journals/journal_single_finish.dart';

class JournalSingleQuestions extends StatefulWidget {
  const JournalSingleQuestions({super.key});

  @override
  State<JournalSingleQuestions> createState() => _JournalSingleQuestionsState();
}

class _JournalSingleQuestionsState extends State<JournalSingleQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 0, left: 20, right: 20),
        decoration: BoxDecoration(
          gradient: GradientContainer.containerColorFull
        ),
        child: Column(
          spacing: 30,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Prompt 1', style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),),
            Column(
              spacing: 20,
              children: [
                Text('My original answer suggested detach method - use it only if you need to get rid of your FocusNode completely. If you plan to keep it around - use unfocus instead.', style: TextStyle(fontWeight: FontWeight.w500),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 14
                    ),
                    maxLines: 7,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Jawabanmu',
                      maintainHintHeight: true
                    ),
                    onTapOutside: (e){
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                ),
              ],
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff8B4512)
                  ),
                  onPressed: (){}, 
                  child: Text('Selanjutnya', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff8B4512)
                  ),
                  onPressed: (){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context){
                        return JournalSingleFinish();
                      })
                    );
                  }, 
                  child: Text('Selanjutnya', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}