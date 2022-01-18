import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key, required this.onPress, required this.text})
      : super(key: key);
  final Function()? onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        height: size.height * 0.1,
        width: size.width,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
                height: 90,
                width: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFCE48A),
                )),
            Positioned(
              bottom: 20,
              right: 25,
              child: TextButton(
                onPressed: onPress,
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: SizedBox(
                height: size.height * 0.1,
                width: size.width * 0.2,
                child: LottieBuilder.network(
                    'https://assets10.lottiefiles.com/packages/lf20_hslwihoj.json'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
