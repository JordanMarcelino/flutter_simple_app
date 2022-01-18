import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/main.dart';
import 'package:flutter_simple_app/models/utils.dart';
import 'package:flutter_simple_app/views/register/components/email_password.dart';
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
                onPressed: () {},
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

  Future logIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
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
