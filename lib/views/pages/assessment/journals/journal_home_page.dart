import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/journals/journal_single_page.dart';
import 'package:flutter_application_test/views/pages/home_page.dart';

class JournalHomePage extends StatefulWidget {
  const JournalHomePage({super.key});

  @override
  State<JournalHomePage> createState() => _JournalHomePageState();
}

class _JournalHomePageState extends State<JournalHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Journal", style: TextStyle(color: TextColor.primary, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: (){
        //     Navigator.pop(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) {
        //           return HomePage();
        //       })
        //     );
        //   }, 
        //   icon: Icon(Icons.arrow_back_ios_new_outlined)
        // ),
        leading: null,
      ),
      body: Column(
        spacing: 20,
        children: [
          Container(
            padding: EdgeInsets.only(top: 65, left: 20, right: 20, bottom: 30),
            height: MediaQuery.sizeOf(context).height/2,
            decoration: BoxDecoration(
              gradient: GradientContainer.containerColorFull,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
              boxShadow: [BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(0, 4),
                spreadRadius: 5,
                blurRadius: 10
              )]
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Jurnal harian untuk bercerita apa yang terjadi hari ini dan refleksi diri untuk menjadi lebih baik', 
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xff8B4512), fontFamily: 'Nunito'),
                  ),
                  Image.asset("assets/images/capy_login.png", width: 200,)
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff8B4512),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  child:
                    Text('2 / 9', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),),
                ),
                Text('Lanjutkan journalmu', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff8B4512), fontFamily: 'Nunito')),
                Text('My Sleep Journal', style: TextStyle(color: TextColor.secondary, fontSize: 12, fontWeight: FontWeight.w600, fontFamily: 'Nunito'),)
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            // padding: EdgeInsets.all(10),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Koleksi Journal', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context){
                              return JournalSinglePage();
                            })
                          );
                        },
                        child: Column(
                          spacing: 5,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset("assets/images/bg_test.jpg", width: 200)
                            ),
                            Text('Daily Journal', style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                      Column(
                        spacing: 5,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset("assets/images/bg_test.jpg", width: 200)
                          ),
                          Text('Sleep Journal', style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Column(
                        spacing: 5,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset("assets/images/bg_test.jpg", width: 200)
                          ),
                          Text('Family Journal', style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}