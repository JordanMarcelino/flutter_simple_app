import 'package:flutter/material.dart';

import '../../../constants.dart';

class TextAndMoreButton extends StatelessWidget {
  const TextAndMoreButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(TextSpan(
                text: text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    shadows: [
                      Shadow(
                          color: kPrimaryColor.withOpacity(0.33),
                          offset: const Offset(0, 8),
                          blurRadius: 20)
                    ]))),
            TextButton(
              onPressed: () {},
              child: const Text(
                'More',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              style: ButtonStyle(
                  fixedSize:
                      MaterialStateProperty.all(const Size.fromWidth(50)),
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
            )
          ],
        ),
      ),
    );
  }
}
