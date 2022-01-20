import 'package:flutter/material.dart';

class Utils {
  static var messengerKey = GlobalKey<ScaffoldMessengerState>();
  static int id = 0;
  static String image = '';
  static String product = '';
  static String desc = '';
  static int price = 0;
  static String name = '';
  static bool useGoogle = false;
  static String currentRoute = '/home';

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
