import 'package:flutter/material.dart';
import 'package:flutter_application_test/data/notifiers.dart';
import 'package:flutter_application_test/views/pages/home_page.dart';
import 'package:flutter_application_test/views/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: const MyApp()
    )
  );
}

//stateless => tidak bisa di refres
//material app => base buat masuk2in sistem app nya (routing, navigating, navbar dll)
//scaffold => kerangka desain app nya

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkMode, 
      builder: (context, value, child) {
        return MaterialApp(
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.amber, 
                brightness: isDarkMode.value ? Brightness.dark : Brightness.light
            )
          ),
          // home: WidgetTree()
          home: HomePage()
        );
      },
    );
  }
}
