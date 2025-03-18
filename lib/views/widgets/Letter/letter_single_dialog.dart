import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';

class LetterSingleDialog extends StatefulWidget {
  final Map<String, dynamic> data;
  final String uid;
  final String selectedType;

  const LetterSingleDialog({
    super.key,
    required this.data,
    required this.uid,
    required this.selectedType
  });

  @override
  State<LetterSingleDialog> createState() => _LetterSingleDialogState();
}

class _LetterSingleDialogState extends State<LetterSingleDialog> {
  late Map<String, dynamic> messageData;
  late String uid;
  late String selectedType;

  FirebaseApi firebaseApi = FirebaseApi();

  Future handleSupportButton(Map<String, dynamic> data, String type) async {
  Map<String, dynamic> preparedData = { ...data };
  
  try {
      preparedData['reactions'] = { 
        ...preparedData['reactions'], 
        type: preparedData['reactions'][type]+1 
      };

      if(preparedData['userReactions'].isNotEmpty) {
        preparedData['userReactions'] = { 
          ...preparedData['userReactions'], 
          uid: { ...preparedData['userReactions'][uid], type: true } 
        };
      } else {
        preparedData['userReactions'] = { 
          uid: { type: true } 
        };
      }

    print("uhuy: $preparedData");

    setState(() {
      messageData = preparedData;
    });

    await firebaseApi.setDataToFirebase(messageData['id'], 'letters', preparedData);
  } catch (e) {
    print('Error le: $e');
  }
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messageData = widget.data;
    uid = widget.uid;
    selectedType = widget.selectedType;
    
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        // height: MediaQuery.sizeOf(context).height/2,
        decoration: BoxDecoration(
          color: Colors.amber.shade50,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                // color: Colors.amber.shade200,
                // height: MediaQuery.sizeOf(context).height/2,
                child: Text(
                  messageData['content'],
                  style: TextStyle(
                    fontSize: 13
                  ),
                )
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    onPressed: (messageData['userReactions'].containsKey(uid) && messageData['userReactions'][uid]['fight'] == true ) ? null : 
                    !messageData['isPublic'] || selectedType == 'personal' ? null : (){
                      handleSupportButton(messageData, 'fight');
                    }, 
                    child: Text("💪🏼 ${messageData['reactions']['fight'] ?? 0}", style: TextStyle(fontSize: 13, fontFamily: 'Nunito', fontWeight: FontWeight.w700),)
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    onPressed: (messageData['userReactions'].containsKey(uid) && messageData['userReactions'][uid]['inspiring'] == true ) ? null : 
                    !messageData['isPublic'] || selectedType == 'personal' ?  null : (){
                      handleSupportButton(messageData, 'inspiring');
                    }, 
                    child: Text("✨ ${messageData['reactions']['inspiring'] ?? 0}", style: TextStyle(fontSize: 13, fontFamily: 'Nunito', fontWeight: FontWeight.w700),)
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    onPressed: (messageData['userReactions'].containsKey(uid) && messageData['userReactions'][uid]['hug'] == true ) ? null : 
                    !messageData['isPublic'] || selectedType == 'personal' ? null : (){
                      handleSupportButton(messageData, 'hug');
                    }, 
                    child: Text("🫂 ${messageData['reactions']['hug'] ?? 0}", style: TextStyle(fontSize: 13, fontFamily: 'Nunito', fontWeight: FontWeight.w700),)
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    onPressed: (messageData['userReactions'].containsKey(uid) && messageData['userReactions'][uid]['love'] == true ) ? null : 
                    !messageData['isPublic'] || selectedType == 'personal' ? null : (){
                      handleSupportButton(messageData, 'love');
                    }, 
                    child: Text("💖 ${messageData['reactions']['love'] ?? 0}", style: TextStyle(fontSize: 13, fontFamily: 'Nunito', fontWeight: FontWeight.w700),)
                  )
                ],
              )
            ],
          ),
        ),
      ),
      // content: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text(messageData['content']),
      //   ],
      // ),
      // actions: [
      //   TextButton(
      //     onPressed: () => Navigator.of(context).pop(), 
      //     child: Text("close")
      //   )
      // ],
    );
  }
}