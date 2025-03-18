import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/widgets/Letter/letter_writing_review_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LetterWrittingPage extends ConsumerStatefulWidget {
  const LetterWrittingPage({super.key});

  @override
  ConsumerState<LetterWrittingPage> createState() => _LetterWrittingPageState();
}

class _LetterWrittingPageState extends ConsumerState<LetterWrittingPage> {
  FirebaseApi firebaseApi = FirebaseApi();

  String selectedType = "past";

  final _messageInput = TextEditingController();

  toggleChangeType(String value) {
    setState(() {
      selectedType = value;
    });
  }

  handleAdd(uid) async {
    final data = {
      "isPublic": true,
      'content': _messageInput.text,
      "type": selectedType,
      "uid": uid,
      "reactions": {
        "inspiring": 0,
        "fight": 0,
        "love": 0,
        "hug": 0
      },
      "userReactions": {}
    };

    try {
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context){
            return LetterWritingReviewPage(messageData: data);
          }
        )
      );

    } catch (e) {
      print('Error $e');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 50),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: AppBar(
            title: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  handleAdd(userData.id);
                },
                child: Text(
                  'Selesai',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins'
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24),
        child: Column(
          children: [
            Row(
              spacing: 5,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedType == "past" ? TextColor.primary : Colors.white,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: TextColor.primary
                      )
                    )
                  ),
                  onPressed: (){
                    toggleChangeType('past');
                  }, 
                  child: Text(
                    "Past",
                    style: TextStyle(
                      color: selectedType == 'past' ? Colors.white : TextColor.primary,
                      fontSize: 12
                    ),
                  )
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedType == "present" ? TextColor.primary : Colors.white,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: TextColor.primary
                      )
                    )
                  ),
                  onPressed: (){
                    toggleChangeType('present');
                  }, 
                  child: Text(
                    "Present",
                    style: TextStyle(
                      color: selectedType == 'present' ? Colors.white : TextColor.primary,
                      fontSize: 12
                    ),
                  )
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedType == "future" ? TextColor.primary : Colors.white,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: TextColor.primary
                      )
                    )
                  ),
                  onPressed: (){
                    toggleChangeType('future');
                  }, 
                  child: Text(
                    "Future",
                    style: TextStyle(
                      color: selectedType == 'future' ? Colors.white : TextColor.primary,
                      fontSize: 12
                    ),
                  )
                ),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              height: MediaQuery.sizeOf(context).height/2.5,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'To my $selectedType self',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextField(
                    maxLines: 15,
                    controller: _messageInput,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Nunito'
                    ),
                    decoration: InputDecoration(
                      hintText: 'Semangat buat menjalani hari',
                      border: InputBorder.none
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}