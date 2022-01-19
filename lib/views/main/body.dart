import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/constants.dart';
import 'package:flutter_simple_app/models/users/user.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pages/main_home.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding + 15),
        height: 80,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: kPrimaryColor.withOpacity(0.33),
              offset: const Offset(0, -10),
              blurRadius: 35)
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/shopping-cart.svg',
              color: kPrimaryColor,
            ),
            SvgPicture.asset('assets/icons/heart.svg'),
            SvgPicture.asset('assets/icons/user.svg'),
          ],
        ),
      ),
      appBar: appBar(),
      body: FutureBuilder<UserAccount?>(
          future: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text('Something went wrong ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return MainHome(
                userAccount: snapshot.data,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Future<UserAccount?> readUsers() async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);
    final snapshot = await docUser.get();

    if (snapshot.exists) return UserAccount.fromJson(snapshot.data());
  }

  AppBar appBar() {
    return AppBar(
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
    );
  }
}
