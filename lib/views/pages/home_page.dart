import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/journals/journal_home_page.dart';
import 'package:flutter_application_test/views/pages/assessment/mood/mood_selection_page.dart';
import 'package:flutter_application_test/views/pages/gratitudes/gratitude_home_page.dart';
import 'package:flutter_application_test/views/pages/letters/letters_home_page.dart';
import 'package:flutter_application_test/views/pages/settings/settings_page.dart';
import 'package:flutter_application_test/views/widgets/Home/banner_carousel_widget.dart';
import 'package:flutter_application_test/views/widgets/Home/daily_activity_widget.dart';
import 'package:flutter_application_test/views/widgets/Home/daily_journal_home_widget.dart';
import 'package:flutter_application_test/views/widgets/Journal/journal_list_display.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });


  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> weekData = [];

  Map<String, dynamic> journalData = {};

  late DateTime startTime;
  late DateTime endTime;
  final currentDate = DateTime.now();

  handleGetWeek(){
    DateTime startOfWeek = currentDate.subtract(Duration(days: currentDate.weekday - 1));

    print('current date ${currentDate.day}');

    List<Map<String, dynamic>> weekContainer = [];
    String dayNameReplacement = '';

    for(int i = 0; i < 7; i++){
      DateTime day = startOfWeek.add(Duration(days: i));
      String dayName = DateFormat('E').format(day).toLowerCase();

      switch (dayName) {
        case 'sun':
          dayNameReplacement = 'Min';
          break;
        case 'mon':
          dayNameReplacement = 'Sen';
          break;
        case 'tue':
          dayNameReplacement = 'Sel';
          break;
        case 'wed':
          dayNameReplacement = 'Rab';
          break;
        case 'thu':
          dayNameReplacement = 'Kam';
          break;
        case 'fri':
          dayNameReplacement = 'Jum';
          break;
        case 'sat':
          dayNameReplacement = 'Sab';
          break;
        default: "";
      }

      weekContainer.add({
        'date': day.day.toString(),
        'dayName': dayNameReplacement
      });
    }

    setState(() {
      weekData = weekContainer;
    });
  }

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
    handleGetWeek();
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
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffFFF5DC),
              Color(0xffFCFCFC)
            ]
          )
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
              width: double.infinity,
              child: Column(
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
                  const SizedBox(height: 15),
                  Image.asset('assets/images/banner.png'),
                  const SizedBox(height: 15),
                  Row(
                    spacing:12,
                    children: List.generate(
                      weekData.length,
                      (index) => Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                        height: 65,
                        decoration: BoxDecoration(
                          color: currentDate.day.toString() == weekData[index]['date'] ? TextColor.primary : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${weekData[index]['date']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: currentDate.day.toString() == weekData[index]['date'] ? Colors.white : TextColor.secondary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                weekData[index]['dayName'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: currentDate.day.toString() == weekData[index]['date'] ? Colors.white : TextColor.secondary,
                                ),
                              ),
                            ],
                          ),
                      ),
                      ),
                    ),
                  SizedBox(height: 15,),
                  JournalListDisplay(),
                  SizedBox(height: 15,),
                  BannerCarouselWidget()
                  // Container(
                  //   width: double.infinity,
                  //   child: BannerCarouselWidget(),
                  // )
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: Column(
                  //     spacing: 10,
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     mainAxisSize: MainAxisSize.max,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Jelajahi Program',
                  //         style: TextStyle(
                  //           color: TextColor.primary,
                  //           fontFamily: 'Poppins',
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w600
                  //         ),
                  //       ),
                  //       SingleChildScrollView(
                  //         scrollDirection: Axis.horizontal,
                  //         child: Row(
                  //           mainAxisSize: MainAxisSize.min,
                  //           spacing: 15,
                  //           children: [
                  //             InkWell(
                  //               onTap: () {
                  //                 Navigator.push(
                  //                   context, 
                  //                   MaterialPageRoute(
                  //                     builder: (context) {
                  //                       return JournalHomePage();
                  //                     }
                  //                   )
                  //                 );
                  //               },
                  //               child: Column(
                  //                 spacing: 8,
                  //                 children: [
                  //                   Image.asset("assets/images/bg_test.jpg", width: 150,),
                  //                   Text(
                  //                     "Journaling", 
                  //                     style: TextStyle(
                  //                       color: TextColor.secondary,
                  //                       fontSize: 13,
                  //                       fontFamily: "Nunito",
                  //                       fontWeight: FontWeight.w800
                  //                     )
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             InkWell(
                  //               onTap: (){
                  //                 Navigator.push(
                  //                   context, 
                  //                   MaterialPageRoute(
                  //                     builder: (context) {
                  //                       return GratitudeHomePage();
                  //                     }
                  //                   )
                  //                 );
                  //               },
                  //               child: Column(
                  //                 spacing: 8,
                  //                 children: [
                  //                   Image.asset("assets/images/bg_test.jpg", width: 150,),
                  //                   Text(
                  //                     "Gratitude", 
                  //                     style: TextStyle(
                  //                       color: TextColor.secondary,
                  //                       fontSize: 13,
                  //                       fontFamily: "Nunito",
                  //                       fontWeight: FontWeight.w800
                  //                     )
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             InkWell(
                  //               onTap: (){
                  //                 Navigator.push(
                  //                   context,
                  //                   MaterialPageRoute(
                  //                     builder: (context) {
                  //                       return LettersHomePage();
                  //                     })
                  //                );
                  //               },
                  //               child: Column(
                  //                 spacing: 8,
                  //                 children: [
                  //                   Image.asset("assets/images/bg_test.jpg", width: 150,),
                  //                   Text(
                  //                     "Letters", 
                  //                     style: TextStyle(
                  //                       color: TextColor.secondary,
                  //                       fontSize: 13,
                  //                       fontFamily: "Nunito",
                  //                       fontWeight: FontWeight.w800
                  //                     )
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}