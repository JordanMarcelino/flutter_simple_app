import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_app/models/bloc/users/user_bloc.dart';
import 'package:flutter_simple_app/models/users/user.dart';
import 'package:flutter_simple_app/views/users/components/headers_users.dart';
import 'package:flutter_simple_app/views/users/components/user_list.dart';

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
    return BlocProvider(
      create: (context) => UserBloc(),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [HeaderUser(widget: widget), const UserList()],
            ),
          ],
        ),
      ),
    );
  }
}
