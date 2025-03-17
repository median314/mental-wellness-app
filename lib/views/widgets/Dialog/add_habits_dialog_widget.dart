import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddHabitsDialogWidget extends ConsumerStatefulWidget {
  final Future<List<Map<String, dynamic>>> Function(String) fetchActivityCallback;

  const AddHabitsDialogWidget({
    super.key,
    required this.fetchActivityCallback
  });

  @override
  ConsumerState<AddHabitsDialogWidget> createState() => _AddHabitsDialogWidgetState();
}

class _AddHabitsDialogWidgetState extends ConsumerState<AddHabitsDialogWidget> {
  final _nameInput = TextEditingController();
  final _descriptionInput = TextEditingController();

  bool _isLoading = false;

  Future saveHabits(BuildContext context, uid) async {
    
    setState(() {
      _isLoading = true;
    });

    try {
      FirebaseApi firebaseApi = FirebaseApi();

      Map<String, dynamic> data = {
        "name": 'Today Activities',
        "description": 'Description',
        "activities": [{
          "name": _nameInput.text,
          "description": _descriptionInput.text,
          "time": {
            "minutes": 20,
            "second": 0
          },
          "isDone": false
        }],
        "uid": uid
      };

      List<Map<String, dynamic>> fetchTodayActivity = await widget.fetchActivityCallback(uid);

      print('result today $fetchTodayActivity');

      if(fetchTodayActivity.isEmpty) {
        final result = await firebaseApi.addDataToFirebase('habits', data);
        print('woyyy $result');
      } else {
        final result = await firebaseApi.modifyArrayFirebase('habits', fetchTodayActivity[0]['id'], 'activities', data['activities']);
        print('ini result union: $result');
      }

      if(context.mounted) {
        setState(() {
          _isLoading = false;
        });

        await widget.fetchActivityCallback(uid);

        Navigator.of(context).pop();
      }
    } catch (e) {
      print('Error: $e');
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);

    return AlertDialog(
      title: const Text('Tambahkan task', textAlign: TextAlign.center),
      content: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/capy_login.png', width: 100), // Added file extension
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nama'),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: TextField(
                      controller: _nameInput,
                      style: TextStyle(
                        fontSize: 12
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        fillColor: Colors.white,
                        hintText: 'Nama aktivitas',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Deskripsi'),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: TextField(
                      controller: _descriptionInput,
                      style: TextStyle(
                          fontSize: 12
                      ),
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Deskripsi',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Batal', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
        ),
        ElevatedButton(
          onPressed: () {
            // Add your save logic here
             saveHabits(context, userData.id);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            backgroundColor: TextColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          ),
          child: Text(
            _isLoading ? 'Menyimpan...':'Simpan', 
            style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}