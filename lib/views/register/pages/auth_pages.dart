import 'package:flutter/material.dart';
import 'package:flutter_simple_app/views/register/pages/login_page.dart';
import 'package:flutter_simple_app/views/register/pages/sign_up.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => (isLogin)
      ? LoginPage(onClickedSignUp: toggle)
      : SignUp(onClickedSignUp: toggle);

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
