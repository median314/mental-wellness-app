import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/habits/habit_review_page.dart';
import 'package:flutter_application_test/views/pages/assessment/habits/habits_running_page.dart';
import 'package:flutter_application_test/views/widgets/Dialog/add_habits_dialog_widget.dart';
import 'package:flutter_application_test/views/widgets/Dialog/global_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyActivityWidget extends ConsumerStatefulWidget {
  const DailyActivityWidget({super.key});

  @override
  ConsumerState<DailyActivityWidget> createState() => _DailyActivityWidgetState();
}

class _DailyActivityWidgetState extends ConsumerState<DailyActivityWidget> {
  //call firebase instance
  FirebaseApi firebaseApi = FirebaseApi();

  //initialize activity variable
  List<Map<String, dynamic>> activityData = [];
  Map<String, dynamic> rawData = {};
  String userId = "";

  late DateTime startTime;
  late DateTime endTime;

  void _initializeTime() {
    DateTime now = DateTime.now();
    startTime = DateTime(now.year, now.month, now.day);
    endTime = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
  }

  Future<List<Map<String, dynamic>>> fetchActivity(String uid) async {
    final conditions = [
      { 'field': 'uid', 'operator': '==', 'value': uid },
      { 'field': 'createdAt', 'operator': '>=', 'value': startTime },
      { 'field': 'createdAt', 'operator': '<=', 'value': endTime },
    ];

    try {
      final List<dynamic> rawActivities = await firebaseApi.getCollectionDataWithCondition('habits', conditions, 1, null);
      
      // Convert the dynamic list to List<Map<String, dynamic>>
      final List<Map<String, dynamic>> activities = rawActivities
          .map((item) => Map<String, dynamic>.from(item as Map))
          .toList();

      if(activities.isNotEmpty) {
        print('hasil activity: ${activities[0]['activities']}');
        
        // Check if 'activities' is a list and properly cast it
        if(activities[0]['activities'] is List) {
          final List<dynamic> rawActivityData = activities[0]['activities'] as List<dynamic>;
          
          // Convert the dynamic list to List<Map<String, dynamic>>
          final List<Map<String, dynamic>> typedActivityData = rawActivityData
              .map((item) => Map<String, dynamic>.from(item as Map))
              .toList();
              
          setState(() {
            rawData = activities[0];
            activityData = typedActivityData;
          });
        } else {
          // Handle case where 'activities' field is not a list
          setState(() {
            rawData = {};
            activityData = [];
          });
        }
      }
      // Return the activities list so it can be used by other components
      return activities;
    } catch (e) {
      print('Error fetch data: $e');
      return [];
    }
  }

  Future handleDoneButton(int index) async {
    final currentArr = [ ...activityData ];
    currentArr[index]['isDone'] = true;

    try {
      await firebaseApi.setDataToFirebase(rawData['id'], 'habits', {'activities': currentArr});
      
      setState(() {
        activityData = currentArr;
      });
      
    } catch (e) {
      print('Error occured: $e');
    }
    return;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeTime();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userData = ref.read(userDataProvider);

      setState(() {
        userId = userData.id;
      });

      if(userData.id.isNotEmpty) {
        fetchActivity(userData.id);
      } else {
        ref.listenManual(userDataProvider, (previous, next) {
          if(next.id.isNotEmpty){
            setState(() {
              fetchActivity(next.id);
            });
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
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Aktivitas hari ini',
                style: TextStyle(
                  color: Color(0xff8B4512),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontFamily: 'Poppins'
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) {
                        return Habitreview();
                      }
                    )
                  );
                },
                child: Text(
                  'Lihat semua',
                  style: TextStyle(
                    color: Color(0xff8B4512),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    fontFamily: 'Nunito'
                  ),
                ),
              ),
            ],
          ),
          activityData.isNotEmpty ? 
            activityData.length > 10 ?
            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: activityData.length,
                itemBuilder: (context, index) {
                  return Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset("assets/images/bg_test.jpg", width: 75),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 10,
                              children: [
                                Text(
                                  activityData[index]["name"],
                                  style: TextStyle(
                                    color: Color(0xff8B4512),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Nunito'
                                  ),
                                ),
                                Text(
                                  '${activityData[index]['time']['minutes']} Menit',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffFFBE00),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context){
                                    return Habitsrunning(activityTitle: activityData[index]['name'],);
                                  })
                                );
                              }, 
                              child: Text('Start', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Nunito'),),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ):(
              Column(
                children: [
                  for(int index = 0; index < activityData.length; index++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset("assets/images/bg_test.jpg", width: 75),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10,
                                children: [
                                  Text(
                                    '${activityData[index]['name']}',
                                    style: TextStyle(
                                      color: Color(0xff8B4512),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Nunito'
                                    ),
                                  ),
                                  Text(
                                    '${activityData[index]['time']['minutes']} Menit',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              ),
                              activityData[index]['isDone'] ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffFFBE00),
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                    )
                                  ),
                                    onPressed: null, 
                                    child: Text('Finished', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Nunito'),),
                                  ) : Row(
                                spacing: 10,
                                children: [
                                  ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffFFBE00),
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                    )
                                  ),
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context){
                                          return Habitsrunning(activityTitle: activityData[index]['name'],);
                                        })
                                      );
                                    }, 
                                    child: Text('Start', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Nunito'),),
                                  ),
                                  ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffFFBE00),
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                    )
                                  ),
                                    onPressed: (){
                                      showDialog(
                                        context: context, 
                                        builder: (context) => GlobalDialog(
                                          title: "Beneran?", 
                                          content: "Udah selesai beneran?", 
                                          confirmButtonText: "Iya",
                                          actionFunctionCallback: handleDoneButton,
                                          actionParam: index,
                                        )
                                      );
                                    }, 
                                    child: Text('Done', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Nunito'),),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context, 
                        builder: (BuildContext context) => AddHabitsDialogWidget(fetchActivityCallback: fetchActivity,)
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TextColor.primary,
                      minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ), 
                    child: Text(
                      'Tambah aktivitas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12
                      ),
                    )
                  )
                ]
              )
            )
          :(
            Container(
              height: 150,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffFFF5DC)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tidak ada aktivitas hari ini',
                    style: TextStyle(
                      color: TextColor.primary,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 13
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      print('pencet');
                      showDialog(
                        context: context, 
                        builder: (BuildContext context) => AddHabitsDialogWidget(fetchActivityCallback: fetchActivity,)
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TextColor.primary,
                      minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ), 
                    child: Text(
                      'Tambah aktivitas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12
                      ),
                    )
                  )
                ],
              )
            )
          )
        ],
      ),
    );
  }
}