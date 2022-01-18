import 'package:flutter/material.dart';

class Utils {
  static var messengerKey = GlobalKey<ScaffoldMessengerState>();
  static int id = 0;
  static String image = '';
  static String product = '';
  static String desc = '';
  static int price = 0;

  static get getId => id;
  static get getImage => image;
  static get getProduct => product;
  static get getDesc => desc;
  static get getPrice => price;

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
