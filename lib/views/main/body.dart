import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/constants.dart';
import 'package:flutter_simple_app/models/users/user.dart';
import 'package:flutter_simple_app/views/users/pages/user_home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pages/main_home.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final user = FirebaseAuth.instance.currentUser;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: kPrimaryColor.withOpacity(0.43),
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          backgroundColor: Colors.white,
          selectedIndex: index,
          height: 80,
          onDestinationSelected: (value) => setState(() {
            index = value;
          }),
          destinations: [
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/icons/shopping-cart.svg',
                color: kDarkBlueColor,
              ),
              label: 'Home',
              icon: SvgPicture.asset(
                'assets/icons/shopping-cart.svg',
              ),
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/icons/heart.svg',
                  color: kDarkBlueColor),
              label: 'Favourite',
              icon: SvgPicture.asset('assets/icons/heart.svg'),
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/icons/user.svg',
                color: kDarkBlueColor,
              ),
              label: 'User',
              icon: SvgPicture.asset('assets/icons/user.svg'),
            ),
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
              final screen = [
                MainHome(userAccount: snapshot.data),
                MainHome(userAccount: snapshot.data),
                UserHome(
                  userAccount: snapshot.data,
                )
              ];
              return screen[index];
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
