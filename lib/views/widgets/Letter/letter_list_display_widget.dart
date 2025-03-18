import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/widgets/Letter/letter_single_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Utils {
  static String truncate(
    String text,
    int maxLength, {
    String suffix = '...',
  }) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}$suffix';
  }
}

class LetterListDisplayWidget extends ConsumerStatefulWidget {
  const LetterListDisplayWidget({super.key});

  @override
  ConsumerState<LetterListDisplayWidget> createState() => _LetterListDisplayWidgetState();
}

class _LetterListDisplayWidgetState extends ConsumerState<LetterListDisplayWidget> {
  String selectedType = "personal";
  String selectedTimeframe = "all"; // Added this to track the timeframe selection
  List<Map<String, dynamic>> dataLetter = [];
  List<Map<String, dynamic>> originDataLetter = [];
  bool _isLoading = false;

  FirebaseApi firebaseApi = FirebaseApi();


  toggleChangeType(String type) {
    setState(() {
      selectedType = type;
    });
  }

  toggleChangeTimeframe(String timeframe) {
    final currentData = [...originDataLetter];

    if(selectedTimeframe == timeframe) {
      setState(() {
        selectedTimeframe = 'all';
        dataLetter = originDataLetter;
      });
    } else {
      final filterData = currentData.where((x) => x['type'] == timeframe).toList();

      setState(() {
        selectedTimeframe = timeframe;
        dataLetter = filterData;
      });

    }
  }

  Stream<QuerySnapshot> getLettersStream(String uid) {
    Query query = FirebaseFirestore.instance.collection('letters');

    if(selectedType == 'personal') {
      query = query.where('uid', isEqualTo: uid);
    } else {
      query = query.where("isPublic", isEqualTo: true);
    }

    query = query.orderBy("createdAt", descending: true);

    return query.snapshots();
  }

  List<Map<String, dynamic>> filterByTimeframe(List<Map<String, dynamic>> letters) {
    if (selectedTimeframe == 'all') {
      return letters;
    }
    return letters.where((letter) => letter['type'] == selectedTimeframe).toList();
  }

  Future fetchLetterData(uid) async {
    var conditions = [
      { "field": "isPublic", "operator": "==", "value": selectedType == 'personal' ? false : true},
    ];

    if(selectedType == 'personal') {
      conditions = [ ...conditions, { "field": "uid", "operator": "==", "value": uid} ];
    }

    final sortBy = {
      "field": "createdAt",
      "descending": true
    };

    setState(() {
      _isLoading = true;
    });

    try {
      final results = await firebaseApi.getCollectionDataWithCondition('letters', conditions, null, sortBy);

      if(results.isNotEmpty) {
        setState(() {
          dataLetter = results;
          originDataLetter = results;
        });
      } else {
        setState(() {
          dataLetter = [];
          originDataLetter = [];
        });
      }

    } catch (e) {
      print('Error cuy $e');
      setState(() {
        dataLetter = [];
        originDataLetter = [];
      });
    } finally {
      setState(() {
        _isLoading = false; // Fixed: Was setting to true instead of false
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userData = ref.read(userDataProvider);

      if(userData.id.isNotEmpty) {
        fetchLetterData(userData.id);
      } else {
        ref.listenManual(userDataProvider, (previous, next) {
          if(next.id.isNotEmpty) {
            fetchLetterData(next.id);
          }
        });
      }
    });
  }

  // Create a method for the timeframe filter buttons to avoid code duplication
  Widget _buildTimeframeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedTimeframe == "past" ? TextColor.primary : Colors.white,
            minimumSize: Size.zero,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: TextColor.primary
              )
            )
          ),
          onPressed: () {
            toggleChangeTimeframe('past');
          }, 
          child: Text(
            "Past",
            style: TextStyle(
              color: selectedTimeframe == 'past' ? Colors.white : TextColor.primary,
              fontSize: 12
            ),
          )
        ),
        const SizedBox(width: 5), // Add proper spacing
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedTimeframe == "present" ? TextColor.primary : Colors.white,
            minimumSize: Size.zero,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: TextColor.primary
              )
            )
          ),
          onPressed: () {
            toggleChangeTimeframe('present');
          }, 
          child: Text(
            "Present",
            style: TextStyle(
              color: selectedTimeframe == 'present' ? Colors.white : TextColor.primary,
              fontSize: 12
            ),
          )
        ),
        const SizedBox(width: 5), // Add proper spacing
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedTimeframe == "future" ? TextColor.primary : Colors.white,
            minimumSize: Size.zero,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: TextColor.primary
              )
            )
          ),
          onPressed: () {
            toggleChangeTimeframe('future');
          }, 
          child: Text(
            "Future",
            style: TextStyle(
              color: selectedTimeframe == 'future' ? Colors.white : TextColor.primary,
              fontSize: 12
            ),
          )
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            // Top category selection buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedType == "personal" ? TextColor.primary : Colors.white,
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: TextColor.primary
                      )
                    )
                  ),
                  onPressed: () {
                    toggleChangeType('personal');
                    fetchLetterData(userData.id);
                  }, 
                  child: Text(
                    "Personal",
                    style: TextStyle(
                      color: selectedType == 'personal' ? Colors.white : TextColor.primary
                    ),
                  )
                ),
                const SizedBox(width: 10), // Add proper spacing
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedType == "community" ? TextColor.primary : Colors.white,
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: TextColor.primary
                      )
                    )
                  ),
                  onPressed: () {
                    toggleChangeType('community');
                    fetchLetterData(userData.id);
                  }, 
                  child: Text(
                    "Community",
                    style: TextStyle(
                      color: selectedType == 'community' ? Colors.white : TextColor.primary
                    ),
                  )
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Empty state or data display
          //   if (dataLetter.isEmpty) 
          //     Column(
          //       children: [
          //         _buildTimeframeButtons(),
          //         const SizedBox(height: 20),
          //         Text(
          //           'Pesannya kosong cuy',
          //           style: TextStyle(
          //             color: TextColor.primary,
          //             fontWeight: FontWeight.bold,
          //             fontFamily: 'Poppins',
          //             fontSize: 16
          //           ),
          //         ),
          //         const SizedBox(height: 30),
          //         Image.asset('assets/images/capy_content.png', width: 280),
          //         const SizedBox(height: 50),
          //         Text(
          //           'Ubur2 ikan lele, mari menulis le',
          //           style: TextStyle(
          //             color: TextColor.primary,
          //             fontWeight: FontWeight.bold,
          //             fontFamily: 'Poppins',
          //             fontSize: 16
          //           ),
          //         )
          //       ],
          //     )
          //   else
          //     Container(
          //       height: MediaQuery.of(context).size.height / 2.2,
          //       decoration: BoxDecoration(
          //         color: Colors.amber.shade50,
          //         borderRadius: BorderRadius.circular(10),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey.shade300,
          //             offset: const Offset(0, 3),
          //             blurRadius: 10,
          //             spreadRadius: 2
          //           )
          //         ]
          //       ),
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             // Timeframe buttons
          //             _buildTimeframeButtons(),
          //             const SizedBox(height: 10),
                      
          //             // Letters list
          //             Expanded(
          //               child: ListView.builder(
          //                 padding: EdgeInsets.zero,
          //                 shrinkWrap: true,
          //                 itemCount: dataLetter.length,
          //                 itemBuilder: (context, index) {
          //                   return InkWell(
          //                     onTap: () => showDialog(
          //                       context: context, 
          //                       builder: (context) {
          //                         return LetterSingleDialog(data: dataLetter[index], uid: userData.id);
          //                       }
          //                     ),
          //                     child: Container(
          //                       margin: const EdgeInsets.symmetric(vertical: 8),
          //                       child: Row(
          //                         mainAxisSize: MainAxisSize.min,
          //                         children: [
          //                           Flexible(
          //                             child: Container(
          //                               padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          //                               decoration: BoxDecoration(
          //                                 color: Colors.amber.shade100,
          //                                 borderRadius: BorderRadius.circular(10)
          //                               ),
          //                               child: Text(
          //                                 dataLetter[index]['content'] ?? 'Test',
          //                                 style: TextStyle(
          //                                   fontWeight: FontWeight.w600,
          //                                   fontFamily: 'Nunito',
          //                                   color: TextColor.secondary,
          //                                   fontSize: 13
          //                                 ),
          //                                 maxLines: 4,
          //                                 overflow: TextOverflow.ellipsis,
          //                               ),
          //                             ),
          //                           )
          //                         ]
          //                       ),
          //                     ),
          //                   );
          //                 }
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     )
          // ],
          StreamBuilder<QuerySnapshot>(
              stream: userData.id.isNotEmpty ? getLettersStream(userData.id) : null,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                // Handle error state
                if (snapshot.hasError) {
                  return Center(child: Text('Error loading data'));
                }

                // Process the data when available
                List<Map<String, dynamic>> letters = [];
                if (snapshot.hasData) {
                  for (var doc in snapshot.data!.docs) {
                    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                    letters.add(data);
                  }
                }

                // Save to originDataLetter for filtering
                originDataLetter = letters;
                
                // Apply timeframe filtering
                List<Map<String, dynamic>> filteredLetters = filterByTimeframe(letters);

                // Show empty state if no letters
                if (filteredLetters.isEmpty) {
                  return Column(
                    children: [
                      _buildTimeframeButtons(),
                      const SizedBox(height: 20),
                      Text(
                        'Pesannya kosong cuy',
                        style: TextStyle(
                          color: TextColor.primary,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 16
                        ),
                      ),
                      const SizedBox(height: 30),
                      Image.asset('assets/images/capy_content.png', width: 280),
                      const SizedBox(height: 50),
                      Text(
                        'Ubur2 ikan lele, mari menulis le',
                        style: TextStyle(
                          color: TextColor.primary,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 16
                        ),
                      )
                    ],
                  );
                }

                // Show letter list
                return Container(
                  height: MediaQuery.of(context).size.height / 2.2,
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(0, 3),
                        blurRadius: 10,
                        spreadRadius: 2
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Timeframe buttons
                        _buildTimeframeButtons(),
                        const SizedBox(height: 10),
                        
                        // Letters list
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: filteredLetters.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => showDialog(
                                  context: context, 
                                  builder: (context) {
                                    return LetterSingleDialog(
                                      data: filteredLetters[index], 
                                      uid: userData.id,
                                      selectedType: selectedType,
                                    );
                                  }
                                ),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(  // Make the container expand to use available space
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.amber.shade100,
                                                  borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Text(
                                                  filteredLetters[index]['content'] ?? 'Test',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Nunito',
                                                    color: TextColor.secondary,
                                                    fontSize: 13
                                                  ),
                                                  maxLines: 4,
                                                  overflow: TextOverflow.ellipsis,
                                                )
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            // The icon takes minimal space and won't expand
                                            selectedType == 'personal' && !filteredLetters[index]['isPublic'] 
                                              ? Icon(Icons.lock, size: 16) 
                                              : SizedBox(width: 16,)
                                          ],
                                        ),
                                      )
                                    ]
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}