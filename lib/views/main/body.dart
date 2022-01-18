import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/constants.dart';
import 'package:flutter_simple_app/models/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pages/main_home.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Transform.rotate(
                angle: 180 * pi / 180,
                child: SvgPicture.asset(
                  'assets/icons/angle-circle-right.svg',
                  color: Colors.white,
                ))),
      ),
      body: MainHome(name: Utils.name),
    );
  }
}
