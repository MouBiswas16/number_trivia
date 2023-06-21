import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Ok"),
        ),
      ],
      title: Text("Some problem occurred!"),
      contentPadding: EdgeInsets.all(20),
      content: Text("Go back and try again"),
    );
  }
}
