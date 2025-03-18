import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GratitudeWrittingPage extends ConsumerStatefulWidget {
  const GratitudeWrittingPage({super.key});

  @override
  ConsumerState<GratitudeWrittingPage> createState() => _GratitudeWrittingPageState();
}

class _GratitudeWrittingPageState extends ConsumerState<GratitudeWrittingPage> {
  FirebaseApi firebaseApi = FirebaseApi();
  final _content = TextEditingController();
  bool _isLoading = false;

  Future saveGratitude(String uid) async {
    final data = {
      "content": _content.text,
      "uid": uid
    };

    setState(() {
      _isLoading = true;
    });

    try {
      final result = await firebaseApi.addDataToFirebase('gratitudes', data);

      Navigator.pop(context);
    } catch (e) {
      print('Error le: $e');
    } finally {
      setState(() {
      _isLoading = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
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
                  saveGratitude(userData.id);
                },
                child: Text(
                  _isLoading ? 'Menyimpan...' : 'Selesai',
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
          padding: EdgeInsets.only(top: 90),
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: GradientContainer.containerColorFull
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    // height: MediaQuery.sizeOf(context).height/2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: TextField(
                        controller: _content,
                        maxLines: 15,
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                          color: TextColor.secondary
                        ),
                        decoration: InputDecoration(
                          hintText: 'Terimakasih',
                          border: InputBorder.none
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}