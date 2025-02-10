import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  String? title = "Available Activity";
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Activity Nih'),
      );
  }
}