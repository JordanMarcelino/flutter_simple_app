import 'package:flutter/material.dart';

import '../../../constants.dart';

class ContainerSignUp extends StatelessWidget {
  final String upperText;
  final String lowerText;
  const ContainerSignUp(
      {Key? key, required this.upperText, required this.lowerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
        fontSize: 50,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: 2);

    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.8,
      child: Stack(
        children: [
          ClipPath(
            clipper: BlueClipperPath(),
            child: Container(
              height: size.height * 0.8,
              color: kBlueColor,
            ),
          ),
          ClipPath(
            clipper: DarkBlueClipperPath(),
            child: Container(
              height: size.height * 0.55,
              color: kDarkBlueColor,
            ),
          ),
          ClipPath(
            clipper: PinkClipperPath(),
            child: Container(
              height: size.height * 0.2,
              width: size.width * 0.4,
              color: kPinkColor,
            ),
          ),
          Container(
            height: size.height * 0.4,
            alignment: Alignment.centerLeft,
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding + 20),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: '$upperText\n',
                style: style,
              ),
              TextSpan(
                text: lowerText,
                style: style,
              )
            ])),
          ),
        ],
      ),
    );
  }
}

class PinkClipperPath extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width - 80, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

class DarkBlueClipperPath extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

class BlueClipperPath extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.9);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
