import 'package:flutter/material.dart';

class Utils {
  static var messengerKey = GlobalKey<ScaffoldMessengerState>();

  static String name = '';

  static get getName => name;

  static void showMessage(String? text) {
    if (text == null) return;

    SnackBar snackbar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
