import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/main.dart';
import 'package:flutter_simple_app/models/users/google_sign_in.dart';
import 'package:flutter_simple_app/models/users/user.dart';
import 'package:flutter_simple_app/models/utils.dart';
import 'package:flutter_simple_app/views/register/components/container_signup.dart';
import 'package:flutter_simple_app/views/register/components/sign_up_account.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../components/login_button.dart';

class SignUp extends StatefulWidget {
  final VoidCallback? onClickedSignUp;
  const SignUp({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<SignUp> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUp> {
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
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.signIn();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
                label: const Text(
                  'Sign up with google',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }

  Future signUp(UserAccount userAccount) async {
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
      Utils.name = name.text;
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
    } on FirebaseAuthException catch (e) {
      Utils.showMessage(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
