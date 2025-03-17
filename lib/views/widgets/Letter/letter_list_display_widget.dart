import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/widgets/Letter/letter_single_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Utils {
  static String truncate(
    String text,
    int maxLength, {
    String suffix = '...',
  }) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}$suffix';
  }
}

class LetterListDisplayWidget extends ConsumerStatefulWidget {
  const LetterListDisplayWidget({super.key});

  @override
  ConsumerState<LetterListDisplayWidget> createState() => _LetterListDisplayWidgetState();
}

class _LetterListDisplayWidgetState extends ConsumerState<LetterListDisplayWidget> {
  String selectedType = "personal";
  List<Map<String, dynamic>> dataLetter = [];
  bool _isLoading = false;

  toggleChangeType(String type) {
    setState(() {
      selectedType = type;
    });
  }

  Future fetchLetterData(uid) async {
    var conditions = [
      { "field": "isPublic", "operator": "==", "value": selectedType == 'personal' ? false : true},
    ];

    if(selectedType == 'personal') {
      conditions = [ ...conditions, { "field": "uid", "operator": "==", "value": uid} ];
    }

    setState(() {
      _isLoading = true;
    });

    try {
      FirebaseApi firebaseApi = FirebaseApi();

      final results = await firebaseApi.getCollectionDataWithCondition('letters', conditions, null, null);

      print('xxxx $results');

      if(results.isNotEmpty) {
        setState(() {
          dataLetter = results;
        });
      }

    } catch (e) {
      print('Error cuy $e');
    } finally {
      setState(() {
      _isLoading = true;
    });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userData = ref.read(userDataProvider);

      if(userData.id.isNotEmpty) {
        fetchLetterData(userData.id);
      } else {
        ref.listenManual(userDataProvider, (previous, next) {
          if(next.id.isNotEmpty) {
            fetchLetterData(next.id);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedType == "personal" ? TextColor.primary : Colors.white,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: TextColor.primary
                      )
                    )
                  ),
                  onPressed: (){
                    print('pencet');
                    toggleChangeType('personal');
                    fetchLetterData(userData.id);
                  }, 
                  child: Text(
                    "Personal",
                    style: TextStyle(
                      color: selectedType == 'personal' ? Colors.white : TextColor.primary
                    ),
                  )
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedType == "community" ? TextColor.primary : Colors.white,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: TextColor.primary
                      )
                    )
                  ),
                  onPressed: (){
                    toggleChangeType('community');
                    fetchLetterData(userData.id);
                  }, 
                  child: Text(
                    "Community",
                    style: TextStyle(
                      color: selectedType == 'community' ? Colors.white : TextColor.primary
                    ),
                  )
                ),
              ],
            ),
            SizedBox(height: 30,),
            dataLetter.isEmpty ? Column(
              children: [
                Text(
                  'Pesannya kosong cuy',
                  style: TextStyle(
                    color: TextColor.primary,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 16
                  ),
                ),
                SizedBox(height: 30),
                Image.asset('assets/images/capy_content.png', width: 280,),
                SizedBox(height: 50,),
                Text(
                  'Ubur2 ikan lele, mari menulis le',
                  style: TextStyle(
                    color: TextColor.primary,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 16
                  ),
                )
              ],
            ) : Container(
              height: MediaQuery.sizeOf(context).height/2.2,
              decoration: BoxDecoration(
                // gradient: GradientContainer.containerColor,
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(0, 3),
                  blurRadius: 10,
                  spreadRadius: 2
                )]
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: dataLetter.length,
                  itemBuilder: (item, index){
                    return InkWell(
                      onTap: () => showDialog(
                        context: context, 
                        builder: (context) {
                          return LetterSingleDialog(data: dataLetter[index]);
                        }
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                                // width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade100,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text(
                                  dataLetter[index]['content']  ?? 'Test',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Nunito',
                                    color: TextColor.secondary,
                                    fontSize: 13
                                  ),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ]
                        ),
                      ),
                    );
                  }
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}