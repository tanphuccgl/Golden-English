import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:flutter/material.dart';

enum DialogAction { yes, abort }

class AlertDialog2 {
  static Future<DialogAction> yesAbortDialog({ BuildContext context,
    String title,
    String body,Function onPressed,}

      ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('No'),
            ),
            RaisedButton(color: kPrimaryOrangeColor,
              onPressed: onPressed,
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}
