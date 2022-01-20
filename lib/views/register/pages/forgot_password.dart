import 'package:flutter/material.dart';
import 'package:flutter_simple_app/main.dart';
import 'package:flutter_simple_app/views/register/components/container_signup.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage(
      {Key? key,
      required this.forgotEmail,
      required this.forgotClicked,
      required this.formKey})
      : super(key: key);
  final Function()? forgotClicked;
  final GlobalKey<FormState> formKey;
  final TextEditingController forgotEmail;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              const ContainerSignUp(
                  upperText: 'Forgot', lowerText: 'Password?'),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.4,
                          left: kDefaultPadding,
                          right: kDefaultPadding),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Required an email'),
                          EmailValidator(errorText: 'Enter a valid email')
                        ]),
                        controller: forgotEmail,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2)),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                fontSize: 22,
                                color: Colors.white.withOpacity(0.5))),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  Size(size.width, size.height * 0.08)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          onPressed: forgotClicked,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.email,
                                color: kPrimaryColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Reset Password',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: kDefaultPadding,
                          right: kDefaultPadding,
                          top: kDefaultPadding),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  Size(size.width, size.height * 0.08)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          onPressed: () {
                            navigatorKey.currentState!
                                .popUntil((route) => route.isFirst);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Cancel',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
