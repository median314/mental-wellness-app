import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/data/notifiers.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/views/pages/auth/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {

  Future<void> signout() async {
    FirebaseApi firebaseApi = FirebaseApi();

    try {
      ref.read(userNotifierProvider.notifier).clearUser();

      await firebaseApi.logoutUser();

      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(builder: (context) => LoginPage()), 
        (route) => false
      );
    } catch (e) {
      print('Logout failed: $e');
    }
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false, // User must tap a button to close the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                signout(); // Call the logout function
                isLogin.value = false;
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                spacing: 0,
                children: [
                  InkWell(
                    onTap: () {
                      print("Account Tap");
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: Colors.black12
                          )
                        )
                      ),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.shield_outlined),
                              Text(
                                "Account and Subscription", 
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Account Tap");
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: Colors.black12
                          )
                        )
                      ),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.notifications_none_outlined),
                              Text(
                                "Notifications", 
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Account Tap");
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: Colors.black12
                          )
                        )
                      ),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.mail_outline_outlined),
                              Text(
                                "Get Newsletter", 
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Account Tap");
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: Colors.black12
                          )
                        )
                      ),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.volume_up_outlined),
                              Text(
                                "Sound", 
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Account Tap");
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: Colors.black12
                          )
                        )
                      ),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.lightbulb_outline),
                              Text(
                                "Suggest Ideas", 
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Account Tap");
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: Colors.black12
                          )
                        )
                      ),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.coffee_outlined),
                              Text(
                                "Donate", 
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Account Tap");
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: Colors.black12
                          )
                        )
                      ),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.bug_report_outlined),
                              Text(
                                "Report Bug", 
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: isLogin, 
                    builder: (context, loginStatus, child) {
                      return InkWell(
                        onTap: () {
                          // No direct change to login status or navigation here anymore
                          // Instead, we'll show the confirmation dialog
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Colors.black12
                              )
                            )
                          ),
                          child: Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 10,
                                children: [
                                  Icon(Icons.logout_outlined),
                                  GestureDetector(
                                    onTap: () {
                                      // Show the confirmation dialog instead of directly logging out
                                      _showConfirmationDialog();
                                    },
                                    child: Text(
                                      "Logout", 
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Text('Terms and Conditions'),
                Text('Version 1.0'),
              ],
            )
          ],
        ),
      ),
    );
  }
}