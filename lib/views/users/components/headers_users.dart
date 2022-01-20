import 'package:flutter/material.dart';
import 'package:flutter_simple_app/views/users/pages/user_home.dart';
import 'package:lottie/lottie.dart';

import '../../../constants.dart';

class HeaderUser extends StatelessWidget {
  const HeaderUser({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final UserHome widget;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hi ${widget.userAccount!.name}!',
                maxLines: 2,
                softWrap: true,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  height: size.height * 0.15,
                  child: LottieBuilder.network(
                      'https://assets9.lottiefiles.com/packages/lf20_snxqzipw.json'))
            ],
          ),
          height: size.height * 0.3,
          padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding + 55),
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.06),
          child: Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Transform.scale(
              scale: 0.5,
              child: LottieBuilder.network(
                  'https://assets4.lottiefiles.com/packages/lf20_aodoKw.json',
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }
}
