import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_application_test/views/pages/letters/letters_home_page.dart';
import 'package:intl/intl.dart';

class LetterWritingReviewPage extends StatefulWidget {
  final Map<String, dynamic> messageData;

  const LetterWritingReviewPage({
    super.key,
    required this.messageData
  });

  @override
  State<LetterWritingReviewPage> createState() => _LetterWritingReviewPageState();
}

class _LetterWritingReviewPageState extends State<LetterWritingReviewPage> {
  late Map<String, dynamic> data;
  final String currentDate = DateFormat('dd MMMM yyyy').format(DateTime.now());

  FirebaseApi firebaseApi = FirebaseApi();
  bool _isLoading = false;

  togglePrivate() {
    print(data['isPublic']);
    setState(() {
      data['isPublic'] = !data['isPublic'];
    });
}

  Future handleAdd() async {
    try {
      setState(() {
        _isLoading = true;
      });

      await firebaseApi.addDataToFirebase('letters', data);

      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(
          builder: (context){
            return LettersHomePage();
          }
        ), 
        (route) => false 
      );

    } catch (e) {
      print('Error $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = { ...widget.messageData };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 50),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: AppBar(
            title: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  handleAdd();
                },
                child: Text(
                  '',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: data['isPublic'] ? Colors.blueGrey.shade200 : TextColor.primary,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15)
                  ),
                  onPressed: (){
                    togglePrivate();
                  }, 
                  child: Row(
                    spacing: 5,
                    children: [
                      Icon(
                        data['isPublic'] ? Icons.lock_open_outlined : Icons.lock_outline, 
                        color: Colors.white, 
                        size: 15,
                      ),
                      Text(
                        'Keep Private', 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 13, 
                          fontFamily: 'Nunito', 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )
                )
              ],
            ),
            SizedBox(height: 5,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'To my ${data['type']} self,',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      color: TextColor.secondary
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    data['content'],
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w500,
                      color: TextColor.secondary
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        currentDate,
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 13, 
                          fontFamily: 'Nunito',
                          color: TextColor.secondary
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text(
              data['isPublic'] ? 'Surat yang kamu tulis dapat terbaca secara anonim oleh pengguna lain yang melihat.' : 'Data akan tersimpan dan hanya kamu sendiri yang dapat melihat',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                fontSize: 11,
                color: Colors.blueGrey
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TextColor.primary,
                  minimumSize: Size.zero,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15)
                ),
                onPressed: (){
                  handleAdd();
                }, 
                child: Text(
                  _isLoading ? 'Menyimpan..' : 'Simpan', 
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 13, 
                    fontFamily: 'Nunito', 
                    fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}