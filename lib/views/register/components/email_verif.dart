import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/views/register/components/container_signup.dart';

import '../../../constants.dart';

class EmailVerifPage extends StatefulWidget {
  const EmailVerifPage(
      {Key? key, required this.resendEmailVerif, required this.canResend})
      : super(key: key);
  final Function()? resendEmailVerif;
  final bool canResend;

  @override
  State<EmailVerifPage> createState() => _EmailVerifPageState();
}

class _EmailVerifPageState extends State<EmailVerifPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const ContainerSignUp(
                upperText: 'Email', lowerText: 'Verification'),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.45,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                                Size(size.width, size.height * 0.08)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        onPressed:
                            widget.canResend ? widget.resendEmailVerif : null,
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
                              'Resend Email',
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
                          FirebaseAuth.instance.signOut();
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
    );
  }
}
