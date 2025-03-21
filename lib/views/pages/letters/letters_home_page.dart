import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/widgets/Letter/letter_list_display_widget.dart';
import 'package:flutter_application_test/views/widgets/Letter/letter_writting_page.dart';

class LettersHomePage extends StatefulWidget {
  const LettersHomePage({super.key});

  @override
  State<LettersHomePage> createState() => _LettersHomePageState();
}

class _LettersHomePageState extends State<LettersHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Letter', 
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: TextColor.primary
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
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
          top: false,
          child: Column(        
            children: [
              Container(
                padding: EdgeInsets.only(left: 24, right: 24, top: 80, bottom: 10),
                height: MediaQuery.sizeOf(context).height/2.8,
                decoration: BoxDecoration(
                  gradient: GradientContainer.containerColorFull
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Kirim pesan untuk dirimu sendiri, untuk masa lalu, masa depan atau saat ini. Sebagai refleksi diri dan menjadi dirimu yang lebih baik lagi",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: TextColor.secondary
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TextColor.primary,
                          minimumSize: Size.zero,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context){
                                return LetterWrittingPage();
                              }
                            )
                          );
                        }, 
                        child: Text("Mulai Menulis", style: TextStyle(color: Colors.white),)
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              LetterListDisplayWidget()
            ],
          ),
        ),
      ),
    );
  }
}