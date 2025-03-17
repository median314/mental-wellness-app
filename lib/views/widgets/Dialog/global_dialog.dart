import 'package:flutter/material.dart';
import 'package:flutter_application_test/styles/styles.dart';

class GlobalDialog extends StatefulWidget {
  final String title;
  final String content;
  final String confirmButtonText;
  final Function actionFunctionCallback; // Changed to accept any Function
  final dynamic actionParam; // Optional parameter to pass to the function

  const GlobalDialog({
    super.key,
    required this.title,
    required this.content,
    required this.confirmButtonText,
    required this.actionFunctionCallback,
    this.actionParam, // Optional parameter
  });

  @override
  State<GlobalDialog> createState() => _GlobalDialogState();
}

class _GlobalDialogState extends State<GlobalDialog> {
  bool _isLoading = false;

  handleActions() async {
    setState(() {
      _isLoading = true;
    });

    // Call the function with or without parameters
    if (widget.actionParam != null) {
      await widget.actionFunctionCallback(widget.actionParam);
    } else {
      await widget.actionFunctionCallback();
    }

    setState(() {
      _isLoading = false;
    });
    
    // Close the dialog after the action completes
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Batal', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : handleActions, // Disable when loading
          style: ElevatedButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            backgroundColor: TextColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          ),
          child: _isLoading 
            ? SizedBox(
                width: 20, 
                height: 20, 
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
              ) 
            : Text(
                widget.confirmButtonText, 
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