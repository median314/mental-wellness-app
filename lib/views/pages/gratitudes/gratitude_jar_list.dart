import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GratitudeJarList extends ConsumerStatefulWidget {
  const GratitudeJarList({super.key});

  @override
  ConsumerState<GratitudeJarList> createState() => _GratitudeJarListState();
}

class _GratitudeJarListState extends ConsumerState<GratitudeJarList> {
  FirebaseApi firebaseApi = FirebaseApi();
  List<Map<String, dynamic>> gratitudeList = [];

  Future fetchGratitudeData(String uid) async {
    final conditions = [
      { "field": "uid", "operator": "==", "value": uid }
    ];

    final sortBy = { "field": "createdAt", "descending": true };

    try {
      final result = await firebaseApi.getCollectionDataWithCondition('gratitudes', conditions, null, sortBy);


      if(result.isNotEmpty){
        setState(() {
          gratitudeList = result;
        });
        print('Hasilnya le: $result');
      }
    } catch (e) {
      print('Error le: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final userData = ref.read(userDataProvider);

      if(userData.id.isNotEmpty){
        fetchGratitudeData(userData.id);
      } else {
        ref.listenManual(userDataProvider, (previous, next) {
          if(next.id.isNotEmpty){
            fetchGratitudeData(next.id);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 50),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
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
      body: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: gratitudeList.length,
            itemBuilder: (context, index) {
              return Container(
                // height: MediaQuery.sizeOf(context).height/2,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.amber.shade200,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 8,
                    children: [
                      Icon(Icons.spa_rounded, size: 20, color: Colors.amber.shade800,),
                      Text(gratitudeList[index]['content'], style: TextStyle(color: TextColor.secondary, fontFamily: 'Nunito', fontWeight: FontWeight.w700),),
                    ],
                  ),
                ),
              );
            },
          )
        )
      ),
    );
  }
}