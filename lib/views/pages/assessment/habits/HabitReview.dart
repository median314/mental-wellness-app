import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/assessment/habits/HabitsRunning.dart';

class Habitreview extends StatefulWidget {
  const Habitreview({super.key});

  @override
  State<Habitreview> createState() => _HabitreviewState();
}

class _HabitreviewState extends State<Habitreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halo, Ayam Jago', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          spacing: 20,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          spacing: 20,
                          children: [
                            Column(
                              children: [
                                Text('SU', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                Text('20', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)
                              ],
                            ),
                            Column(
                              children: [
                                Text('MO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(99)
                                  ),
                                  child: Center(child: Text('23', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)))
                              ],
                            ),
                            Column(
                              children: [
                                Text('TU', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                Text('22', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)
                              ],
                            ),
                            Column(
                              children: [
                                Text('WE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(99)
                                  ),
                                  child: Center(child: Text('23', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)))
                              ],
                            ),
                            Column(
                              children: [
                                Text('TH', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                Text('24', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                              decoration: BoxDecoration(
                                color: Color(0xff8B4512),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                children: [
                                  Text('FR', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
                                  Text('25', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),)
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text('SA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                Text('26', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)
                              ],
                            ),
                            Column(
                              children: [
                                Text('SU', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                Text('27', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)
                              ],
                            ),
                            Column(
                              children: [
                                Text('MO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                Text('28', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)
                              ],
                            ),
                            Column(
                              children: [
                                Text('TU', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                Text('29', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)
                              ],
                            ),
                            Column(
                              children: [
                                Text('WE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                Text('30', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Image.asset('assets/images/capy_login.png', width: 200,)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0, -3),
                    blurRadius: 20,
                    spreadRadius: 3
                  )],
                  gradient: GradientContainer.containerColorFull2
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    spacing: 10,
                    children: [
                      Text(
                        'Aktifitas hari ini',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff8B4512)),
                      ),
                      Container(
                        height: 250,
                        child: SingleChildScrollView(
                          child: Column(
                            spacing: 10,
                            children: [
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      spacing: 20,
                                      children: [
                                        Container(color: Colors.amber, height: 30, width: 30,),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                spacing: 5,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Walking Walking', style: TextStyle(fontWeight: FontWeight.bold),),
                                                  Text('Jalan kemana aja', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),),
                                                ],
                                              ),
                                              Column(
                                                spacing: 5,
                                                children: [
                                                  Text('30 min', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      color: Colors.amber,
                                                    ),
                                                    child: InkWell(
                                                      onTap: (){
                                                        Navigator.push(
                                                          context, 
                                                          MaterialPageRoute(builder: (context) => Habitsrunning())
                                                        );
                                                      },
                                                      child: Text(
                                                        'Start', 
                                                        style: TextStyle(
                                                          fontSize: 12, 
                                                          fontWeight: FontWeight.w600
                                                        )
                                                      )
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                )
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      spacing: 20,
                                      children: [
                                        Container(color: Colors.amber, height: 30, width: 30,),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                spacing: 5,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Walking Walking', style: TextStyle(fontWeight: FontWeight.bold),),
                                                  Text('Jalan kemana aja', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),),
                                                ],
                                              ),
                                              Column(
                                                spacing: 5,
                                                children: [
                                                  Text('30 min', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      color: Colors.amber,
                                                    ),
                                                    child: Text('Start', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                )
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      spacing: 20,
                                      children: [
                                        Container(color: Colors.amber, height: 30, width: 30,),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                spacing: 5,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Walking Walking', style: TextStyle(fontWeight: FontWeight.bold),),
                                                  Text('Jalan kemana aja', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),),
                                                ],
                                              ),
                                              Column(
                                                spacing: 5,
                                                children: [
                                                  Text('30 min', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      color: Colors.amber,
                                                    ),
                                                    child: Text('Start', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                )
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      spacing: 20,
                                      children: [
                                        Container(color: Colors.amber, height: 30, width: 30,),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                spacing: 5,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Walking Walking', style: TextStyle(fontWeight: FontWeight.bold),),
                                                  Text('Jalan kemana aja', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),),
                                                ],
                                              ),
                                              Column(
                                                spacing: 5,
                                                children: [
                                                  Text('30 min', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      color: Colors.amber,
                                                    ),
                                                    child: Text('Start', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff8B4512),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        onPressed: () {

                        }, 
                        child: Text('Tambah', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}