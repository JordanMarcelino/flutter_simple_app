import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/models/users/user.dart';
import 'package:flutter_simple_app/models/utils.dart';
import 'package:flutter_simple_app/views/main/body.dart';
import 'package:flutter_simple_app/views/register/components/email_verif.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool isVerified = false;
  bool canResendEmail = true;
  Timer? timer;

  @override
  void initState() {
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isVerified) {
      sendEmailVerif();
      timer = Timer.periodic(const Duration(seconds: 3), (_) {
        checkEmailVerif();
      });
    }
    super.initState();
  }

  Future checkEmailVerif() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isVerified) {
      await createUser(UserAccount(name: Utils.name));
      timer?.cancel();
    }
  }

  Future sendEmailVerif() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } on FirebaseAuthException catch (e) {
      Utils.showMessage(e.message);
    }

    Fluttertoast.showToast(
        msg: 'A verification email has been sent to your email',
        backgroundColor: Colors.greenAccent,
        gravity: ToastGravity.CENTER,
        fontSize: 20,
        textColor: Colors.white);
  }

  Future createUser(UserAccount user) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(currentUser!.uid);
    user.id = currentUser.uid;

    var json = user.toJson();
    await docUser.set(json);

    Fluttertoast.showToast(
        msg: 'Account has created successfully',
        backgroundColor: Colors.greenAccent,
        gravity: ToastGravity.CENTER,
        fontSize: 20,
        textColor: Colors.white);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => isVerified
      ? const MainPage()
      : EmailVerifPage(
          canResend: canResendEmail,
          resendEmailVerif: sendEmailVerif,
        );
}
