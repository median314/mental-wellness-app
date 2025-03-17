import 'package:flutter/material.dart';

class LetterSingleDialog extends StatefulWidget {
  final Map<String, dynamic> data;

  const LetterSingleDialog({
    super.key,
    required this.data
  });

  @override
  State<LetterSingleDialog> createState() => _LetterSingleDialogState();
}

class _LetterSingleDialogState extends State<LetterSingleDialog> {
  late Map<String, dynamic> messageData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messageData = widget.data;
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(messageData['content']),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), 
          child: Text("close")
        )
      ],
    );
  }
}