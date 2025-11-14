import 'package:flutter/material.dart';

Future<void> showAlertDialog(
  BuildContext context, {
  required String title,
  required String message,
  Function()? onConfirm,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (onConfirm != null) {
                onConfirm();
              }

              Navigator.of(context).pop();
            },
            child: const Text('Confirm'),
          ),
        ],
      );
    },
  );
}
