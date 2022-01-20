import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/main.dart';
import 'package:flutter_simple_app/models/utils.dart';
import 'package:flutter_simple_app/views/register/components/email_password.dart';
import 'package:flutter_simple_app/views/register/pages/forgot_password.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import '../../../constants.dart';
import '../components/custom_container.dart';
import '../components/login_button.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? onClickedSignUp;
  const LoginPage({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController forgotEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Column(
            children: [
              const CustomContainer(
                lowerText: 'Again!',
                upperText: 'Hello',
              ),
              EmailAndPassword(email: email, password: password),
              LoginButton(
                text: 'Login',
                onPress: () async {
                  await logIn();
                },
              ),
              registerAndForgot(size),
            ],
          )
        ],
      ),
    );
  }

  Padding registerAndForgot(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
      child: Container(
        width: size.width,
        margin: const EdgeInsets.only(top: kDefaultPadding + 10),
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignUp,
                  text: 'Register',
                  style: const TextStyle(
                      fontSize: 20,
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline))
            ])),
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => ForgotPage(
                            forgotEmail: forgotEmail,
                            forgotClicked: resetPassword,
                            formKey: formKey,
                          ),
                      barrierDismissible: false);
                },
                child: const Text(
                  'Forgot',
                  style: TextStyle(
                      fontSize: 20,
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
      ),
    );
  }

  Future resetPassword() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Transform.scale(
            scale: 1.5,
            child: LottieBuilder.network(
                'https://assets4.lottiefiles.com/packages/lf20_szlepvdh.json'),
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgotEmail.text.trim());
      Fluttertoast.showToast(
          msg: 'Password reset email sent',
          backgroundColor: Colors.greenAccent,
          gravity: ToastGravity.SNACKBAR,
          fontSize: 20,
          textColor: Colors.white);

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      Utils.showMessage(e.message);
    }
  }

  Future logIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Transform.scale(
            scale: 1.5,
            child: LottieBuilder.network(
                'https://assets4.lottiefiles.com/packages/lf20_szlepvdh.json'),
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
    } on FirebaseAuthException catch (e) {
      Utils.showMessage(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
