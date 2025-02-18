import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/mood/MoodSelection.dart';
import 'package:flutter_application_test/views/pages/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: double.infinity,
        child: SingleChildScrollView(
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
                    width: 55,
                    height: 55,
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
                              'Halo, Ayam Jago',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Bagaimana kabarmu hari ini?',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
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
                          icon: Icon(Icons.settings_outlined, size: 30,)
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
                              style: ThemeText.progressHeader,
                            ),
                            Text(
                              'Beri rating pada mood kamu hari ini',
                              style: ThemeText.progressBody,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
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
                            style: ThemeText.progressHeader,
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
                            child: TextField(
                              maxLines: null,
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
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff8B4512),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: () {
                              print('Simpen');
                            }, 
                            child: Text(
                              'Simpan', 
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
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
                          'Aktivitas harianmu',
                          style: TextStyle(
                            color: Color(0xff8B4512),
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                        Text(
                          'Lihat semua',
                          style: TextStyle(
                            color: Color(0xff8B4512),
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 15,
                      children: [
                        Row(
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
                                        'Morning Walk',
                                        style: TextStyle(
                                          color: Color(0xff8B4512),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        '30 Menit',
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFBE00),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text('Start'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
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
                                        'Morning Walk',
                                        style: TextStyle(
                                          color: Color(0xff8B4512),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        '30 Menit',
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFBE00),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text('Done'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
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
                                        'Morning Walk',
                                        style: TextStyle(
                                          color: Color(0xff8B4512),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        '30 Menit',
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFBE00),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text('Done'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
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
                      'Jelajahi Program Baru',
                      style: ThemeText.progressHeader
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 15,
                        children: [
                          Column(
                            spacing: 8,
                            children: [
                              Image.asset("assets/images/bg_test.jpg", width: 150,),
                              Text("Gratitude", style: ThemeText.progressBody),
                            ],
                          ),
                          Column(
                            spacing: 8,
                            children: [
                              Image.asset("assets/images/bg_test.jpg", width: 150,),
                              Text("Gratitude", style: ThemeText.progressBody),
                            ],
                          ),
                          Column(
                            spacing: 8,
                            children: [
                              Image.asset("assets/images/bg_test.jpg", width: 150,),
                              Text("Gratitude", style: ThemeText.progressBody),
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
        ),
      ),
    );
  }
}