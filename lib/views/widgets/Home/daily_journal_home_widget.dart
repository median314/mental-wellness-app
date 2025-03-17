import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyJournalHomeWidget extends ConsumerStatefulWidget {
  const DailyJournalHomeWidget({ super.key });

  @override
  ConsumerState<DailyJournalHomeWidget> createState() => _DailyJournalHomeWidgetState();
}

class _DailyJournalHomeWidgetState extends ConsumerState<DailyJournalHomeWidget> {
  bool _isLoading = false;
  final _journalInput = TextEditingController();
  Map<String, dynamic> journalData = {};

  late DateTime startTime;
  late DateTime endTime;

  void _initializeTime() {
    DateTime now = DateTime.now();
    startTime = DateTime(now.year, now.month, now.day);
    endTime = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
  }

  Future<void> handleSaveJournal(uid) async {
    setState(() {
      _isLoading = true;
    });

    final journalInput = _journalInput.text;

    try {
      FirebaseApi firebaseApi = FirebaseApi();

      final data = {
        "content": journalInput,
        "type": "home",
        "uid": uid
      };

      await firebaseApi.addDataToFirebase('journals', data).then((value) async {
        final resData = await fetchJournalData(uid);

        setState(() {
          journalData = resData ?? {};
        });
      },);
    } catch (e) {
      print('Error occured: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<Map<String, dynamic>?> fetchJournalData(uid) async {
    setState(() {
      _isLoading = true;
    });

    final conditions = [
      { "field": "uid", "operator": "==", "value": uid },
      { "field": "createdAt", "operator": ">=", "value": startTime },
      { "field": "createdAt", "operator": "<=", "value": endTime },
      { "field": "type", "operator": "==", "value": "home" },
    ];

    final limit = 1;
    
    try {
      FirebaseApi firebaseApi = FirebaseApi();
      final data = await firebaseApi.getCollectionDataWithCondition("journals", conditions, limit, null);

      print('Txxx $data');

      setState(() {
        journalData = data.isNotEmpty ? data[0] : {};
        _isLoading = false;
      });

      return data[0];
    } catch (e) {
      print("Failed fetch data");

      setState(() {
        _isLoading = false;
      });
      return {};
    }
  }

  Future<void> deleteData(id) async {
    FirebaseApi firebaseApi = FirebaseApi();

    try {
      await firebaseApi.deleteFirebaseDocument('journals', id).then((res) {
        setState(() {
          journalData = {};
        });
      });

      print("data deleted");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeTime();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userData = ref.read(userDataProvider);

      if(userData.id.isNotEmpty) {
        fetchJournalData(userData.id);
      } else {
        ref.listenManual(userDataProvider, (previous, next) {
          if(next.id.isNotEmpty){
            fetchJournalData(next.id);
          }
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: GradientContainer.containerColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Apa yang kamu rasakan hari ini?',
                  style: TextStyle(
                    fontSize: 13,
                    color: TextColor.primary,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins'
                  ),
                ),
                const SizedBox(height: 10), // Spacing
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.transparent
                    )
                  ),
                  width: double.infinity,// Constrain width
                  child: journalData.isEmpty ? TextField(
                    controller: _journalInput,
                    style: TextStyle(fontSize: 12, fontFamily: 'Nunito'),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Hari ini aku...",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                    onChanged: (value) { 
                      print(value);
                    },
                    onTapOutside: (e) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ):(
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Text(
                        journalData["content"],
                        style: TextStyle(
                          color: TextColor.secondary,
                          fontSize: 12
                        ),
                      )
                    )
                  ),
                ),
                SizedBox(height: 2),
                journalData.isNotEmpty ? SizedBox() : SizedBox(
                  width: 75,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      backgroundColor: Color(0xff8B4512),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: () {
                      handleSaveJournal(userData.id);
                    }, 
                    child: !_isLoading ? Text(
                      'Simpan', 
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: 'Nunito'
                      ),
                    ):(
                      Icon(Icons.circle_outlined)
                    )
                  ),
                ),
                journalData.isNotEmpty ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                      onPressed: () {
                        deleteData(journalData['id']);
                      }, 
                      child: Text(
                        "clear diary",
                        style: TextStyle(
                          fontSize: 12
                        ),
                      )
                    ),
                  ],
                ): SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}