import 'package:flutter/material.dart';
import 'package:flutter_application_test/data/notifiers.dart';
import 'package:flutter_application_test/views/pages/auth/login_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                                fontSize: 16,
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
                                fontSize: 16,
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
                                fontSize: 16,
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
                                fontSize: 16,
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
                                fontSize: 16,
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
                                fontSize: 16,
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
                                fontSize: 16,
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
                        isLogin.value = !loginStatus;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          })
                        );
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
                                ValueListenableBuilder(
                                  valueListenable: isLogin, 
                                  builder: (context, loginStatus, child) {
                                    return GestureDetector(
                                      onTap: () {
                                        isLogin.value = false;
                                      },
                                      child: Text(
                                        "Logout", 
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    );
                                  },
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
            height: 100,
          ),
          Column(
            children: [
              Text('Terms and Conditions'),
              Text('Version 1.0'),
            ],
          )
        ],
      ),
    );
  }
}