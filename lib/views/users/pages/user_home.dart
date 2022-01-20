import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/models/users/user.dart';
import 'package:flutter_simple_app/views/users/components/headers_users.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key, required this.userAccount}) : super(key: key);
  final UserAccount? userAccount;

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [HeaderUser(widget: widget)],
          ),
        ],
      ),
    );
  }
}
