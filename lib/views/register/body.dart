import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_app/models/bloc/obscure/obscuretext_bloc.dart';
import 'package:flutter_simple_app/models/users/google_sign_in.dart';
import 'package:flutter_simple_app/views/register/pages/auth_pages.dart';
import 'package:flutter_simple_app/views/register/pages/email_verification.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Transform.scale(
              scale: 2,
              child: LottieBuilder.network(
                  'https://assets4.lottiefiles.com/packages/lf20_szlepvdh.json'),
            ));
          } else if (snapshot.hasData) {
            return const EmailVerification();
          }

          return BlocProvider(
            create: (context) => ObscuretextBloc(),
            child: ChangeNotifierProvider(
              create: (context) => GoogleSignInProvider(),
              child: const AuthPage(),
            ),
          );
        },
      ),
    );
  }
}
