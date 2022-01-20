import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/models/users/user.dart';
import 'package:flutter_simple_app/models/utils.dart';
import 'package:flutter_simple_app/views/users/pages/user_home.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
            GestureDetector(
              onTap: () {
                Utils.name = '/home';
                Navigator.pushReplacementNamed(context, '/home',
                    arguments: 'arguments data');
              },
              child: SvgPicture.asset(
                'assets/icons/shopping-cart.svg',
                color: kPrimaryColor,
              ),
            ),
            GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/icons/heart.svg')),
            GestureDetector(
                onTap: (Utils.currentRoute == '/user')
                    ? null
                    : () {
                        Navigator.pushReplacementNamed(context, '/user',
                            arguments: 'arguments data');
                      },
                child: SvgPicture.asset('assets/icons/user.svg')),
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
              return UserHome(
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
