import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<void> showAlertDialog({
  required BuildContext context,
required String title,
required String content,
required String defaultActionText,
required final VoidCallback onOkPressed,
}) async {
  if(Platform.isIOS) {
    return  await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed:()=> onOkPressed(),
            child: Text(defaultActionText),
          )
        ],
      )
    );
  }

  return await showDialog(
    context: context,
    builder: (context)=> AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => onOkPressed,
          child: Text(defaultActionText),
        )
      ],
    )
  );
}