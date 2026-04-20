import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, Object message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Error"),
        content: Text(message.toString()),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // close dialog
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}