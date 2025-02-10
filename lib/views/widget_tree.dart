import 'package:flutter/material.dart';
import 'package:flutter_application_test/data/notifiers.dart';
import 'package:flutter_application_test/views/pages/activity_page.dart';
import 'package:flutter_application_test/views/pages/home_page.dart';
import 'package:flutter_application_test/views/pages/auth/login_page.dart';
import 'package:flutter_application_test/views/pages/promo_page.dart';
import 'package:flutter_application_test/views/pages/settings/settings_page.dart';
import 'package:flutter_application_test/views/widgets/navbar_widget.dart';

List<Widget> pages = [
  HomePage(),
  MyPromoPage(),
  ActivityPage(),
  LoginPage()
];

List<Widget> authPages = [
  LoginPage()
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLogin, 
      builder: (context, loginStatus, child) {
        return loginStatus ? Scaffold(
          appBar: AppBar(
            // title: Text("Mental Wellness App"),
            actions: [
              ValueListenableBuilder(
                valueListenable: isDarkMode, 
                builder: (context, currentMode, child) {
                  return IconButton(
                    onPressed: () {
                      isDarkMode.value = !currentMode;
                    }, 
                    icon: isDarkMode.value ? Icon(Icons.dark_mode) : Icon(Icons.sunny)
                  );
                },
              ),
              IconButton(
                padding: EdgeInsets.all(10),
                onPressed: () {
                  print('Setting Pressed');
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) {
                        return SettingsPage();
                      }
                    )
                  );
                }, 
                icon: Icon(Icons.settings)
              )
            ],
          ),
          body: ValueListenableBuilder(
            valueListenable: selectedPageNotifier, 
            builder: (context, selectedPage, child) {
              return pages.elementAt(selectedPage);
            },
          ),
          bottomNavigationBar: NavbarWidget(),
        ) : Material(
          child: LoginPage(),
        );
      },
    );
  }
}