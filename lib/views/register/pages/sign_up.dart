import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/main.dart';
import 'package:flutter_simple_app/models/users/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_simple_app/models/utils.dart';
import 'package:flutter_simple_app/views/register/components/container_signup.dart';
import 'package:flutter_simple_app/views/register/components/sign_up_account.dart';
import 'package:lottie/lottie.dart';
import '../../../constants.dart';
import '../components/login_button.dart';

class SignUp extends StatefulWidget {
  final VoidCallback? onClickedSignUp;
  const SignUp({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<SignUp> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          const ContainerSignUp(
            lowerText: 'Account',
            upperText: 'Create',
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.4,
              ),
              SignUpAccount(
                  email: email,
                  name: name,
                  password: password,
                  formKey: formKey),
              LoginButton(
                text: 'Register',
                onPress: () async {
                  final user = UserAccount(name: name.text);
                  await signUp(user);
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
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignUp,
                  text: 'Login',
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

  Future createUser(UserAccount user) async {
    User? currentUser = _auth.currentUser;
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

  Future signUp(UserAccount userAccount) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

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
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((value) => createUser(userAccount));
    } on FirebaseAuthException catch (e) {
      Utils.showMessage(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
