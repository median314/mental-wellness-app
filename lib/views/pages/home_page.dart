import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/journals/journal_home_page.dart';
import 'package:flutter_application_test/views/pages/assessment/mood/mood_selection_page.dart';
import 'package:flutter_application_test/views/pages/gratitudes/gratitude_home_page.dart';
import 'package:flutter_application_test/views/pages/letters/letters_home_page.dart';
import 'package:flutter_application_test/views/pages/settings/settings_page.dart';
import 'package:flutter_application_test/views/widgets/Home/daily_activity_widget.dart';
import 'package:flutter_application_test/views/widgets/Home/daily_journal_home_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });


  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<Map<String, dynamic>> data = [];

  Map<String, dynamic> journalData = {};

  late DateTime startTime;
  late DateTime endTime;

  Future<void> fetchData(uid) async {
    // setState(() {
    //   _isLoading = true;
    // });

    // final conditions = [
    //   { "field": "uid", "operator": "==", "value": uid },
    //   { "field": "createdAt", "operator": ">=", "value": startTime },
    //   { "field": "createdAt", "operator": "<=", "value": endTime },
    //   { "field": "type", "operator": "==", "value": "home" },
    // ];

    // final limit = 1;
    
    // try {
    //   FirebaseApi firebaseApi = FirebaseApi();
    //   data = await firebaseApi.getCollectionDataWithCondition("journals", conditions, limit, null);

    //   print('This is the data: $data');
    //   journalData = data[0];
    // } catch (e) {
    //   print("Failed fetch data");
    //   return;
    // }
  }

  Future<void> deleteData(collectionName, id) async {
    FirebaseApi firebaseApi = FirebaseApi();

    try {
      await firebaseApi.deleteFirebaseDocument(collectionName, id);
      
      print("data deleted");
    } catch (e) {
      print(e);
    }
  }

  void _initializeTime() {
    DateTime now = DateTime.now();
    startTime = DateTime(now.year, now.month, now.day);
    endTime = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
  }
  
  @override
  void initState() {
    super.initState();
    _initializeTime();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userData = ref.read(userDataProvider);
      if (userData.id.isNotEmpty) {
        fetchData(userData.id);
      } else {
        ref.listenManual(userDataProvider, (previous, next) {
          if (next.id.isNotEmpty) {
            fetchData(next.id);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
      final user = ref.watch(userDataProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
            width: double.infinity,
            child: Column(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        shape: BoxShape.circle,
                      ),
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 10), // Spacing between widgets
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Halo, ${user.name ?? ''}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: 'Poppins'
                                ),
                              ),
                              Text(
                                'Bagaimana kabarmu hari ini?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: 'Nunito'
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SettingsPage();
                                  }
                                )
                              );
                            },
                            icon: Icon(Icons.settings_outlined, size: 25, color: Colors.grey.shade700)
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) {
                          return Moodselection();
                        }
                      )
                    );
                  },
                  child: Container(
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
                                'Mood kamu hari ini',
                                style: TextStyle(
                                  color: TextColor.primary,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  fontSize: 13
                                ),
                              ),
                              SizedBox(height: 3,),
                              Text(
                                'Beri rating pada mood kamu hari ini',
                                style: TextStyle(
                                  color: TextColor.secondary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(height: 10),
                // DailyJournalHomeWidget(),
                const SizedBox(height: 10),
                DailyActivityWidget(),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jelajahi Program',
                        style: TextStyle(
                          color: TextColor.primary,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 15,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return JournalHomePage();
                                    }
                                  )
                                );
                              },
                              child: Column(
                                spacing: 8,
                                children: [
                                  Image.asset("assets/images/bg_test.jpg", width: 150,),
                                  Text(
                                    "Journaling", 
                                    style: TextStyle(
                                      color: TextColor.secondary,
                                      fontSize: 13,
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.w800
                                    )
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return GratitudeHomePage();
                                    }
                                  )
                                );
                              },
                              child: Column(
                                spacing: 8,
                                children: [
                                  Image.asset("assets/images/bg_test.jpg", width: 150,),
                                  Text(
                                    "Gratitude", 
                                    style: TextStyle(
                                      color: TextColor.secondary,
                                      fontSize: 13,
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.w800
                                    )
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LettersHomePage();
                                    })
                               );
                              },
                              child: Column(
                                spacing: 8,
                                children: [
                                  Image.asset("assets/images/bg_test.jpg", width: 150,),
                                  Text(
                                    "Letters", 
                                    style: TextStyle(
                                      color: TextColor.secondary,
                                      fontSize: 13,
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.w800
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}