import 'package:flutter/material.dart';

class HomescreenDialogWidget extends StatelessWidget {
  const HomescreenDialogWidget({
    super.key,
    required this.isDialogOpen
  });

  final bool isDialogOpen;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Hallo semua!'),
    );
  }
}