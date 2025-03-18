import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/gratitudes/gratitude_jar_list.dart';
import 'package:flutter_application_test/views/pages/gratitudes/gratitude_writting_page.dart';

class GratitudeHomePage extends StatefulWidget {
  const GratitudeHomePage({super.key});

  @override
  State<GratitudeHomePage> createState() => _GratitudeHomePageState();
}

class _GratitudeHomePageState extends State<GratitudeHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Gratitude',
          style: TextStyle(
            color: TextColor.primary,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: Container(
            padding: EdgeInsets.only( left: 24, right: 24),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: GradientContainer.containerColor
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/jar.png', width: 260,),
                SizedBox(height: 50,),
                Text(
                  'Isi dengan momen-momen, besar dan kecil. Setiap catatan adalah pengingat kebaikan dalam harimu. Mulai rekam kebahagiaanmu sekarang.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TextColor.secondary,
                    fontFamily: 'Nunito',
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TextColor.primary,
                          // minimumSize: Size.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context){
                                return GratitudeWrittingPage();
                              }
                            )
                          );
                        }, 
                        child: Text(
                          'Mulai',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),
                        )
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TextColor.primary,
                          // minimumSize: Size.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context){
                                return GratitudeJarList();
                              }
                            )
                          );
                        }, 
                        child: Text(
                          'Lihat Toples',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),
                        )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}