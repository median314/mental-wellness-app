import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';

class JournalListDisplay extends StatefulWidget {
  const JournalListDisplay({super.key});

  @override
  State<JournalListDisplay> createState() => _JournalListDisplayState();
}

class _JournalListDisplayState extends State<JournalListDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.sizeOf(context).height/2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 5),
              spreadRadius: 1,
              blurRadius: 5,
            )
          ]
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height/2.5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Great day today',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(99)
                              ),
                              child: Text(
                                '😁 Happy', 
                                style: TextStyle(
                                  fontSize: 10, 
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffF7F6F6),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Test',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Nunito',
                                color: TextColor.secondary,
                                fontSize: 13
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Great day today',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(99)
                              ),
                              child: Text(
                                '😁 Happy', 
                                style: TextStyle(
                                  fontSize: 10, 
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffF7F6F6),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Test',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Nunito',
                                color: TextColor.secondary,
                                fontSize: 13
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Great day today',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(99)
                              ),
                              child: Text(
                                '😁 Happy', 
                                style: TextStyle(
                                  fontSize: 10, 
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffF7F6F6),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Test',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Nunito',
                                color: TextColor.secondary,
                                fontSize: 13
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Great day today',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(99)
                              ),
                              child: Text(
                                '😁 Happy', 
                                style: TextStyle(
                                  fontSize: 10, 
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffF7F6F6),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Test',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Nunito',
                                color: TextColor.secondary,
                                fontSize: 13
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Great day today',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(99)
                              ),
                              child: Text(
                                '😁 Happy', 
                                style: TextStyle(
                                  fontSize: 10, 
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffF7F6F6),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Test',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Nunito',
                                color: TextColor.secondary,
                                fontSize: 13
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  minimumSize: Size.zero,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10)
                ),
                onPressed: (){}, 
                child: Text('Tambah Journal', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'Nunito'),)
              ),
            )
          ],
        ),
    );
  }
}