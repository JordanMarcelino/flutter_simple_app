import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_app/models/bloc/obscure/obscuretext_bloc.dart';
import 'package:flutter_simple_app/views/main/body.dart';
import 'package:flutter_simple_app/views/register/pages/auth_pages.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MainPage();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return BlocProvider(
              create: (context) => ObscuretextBloc(), child: const AuthPage());
        },
      ),
    );
  }
}
