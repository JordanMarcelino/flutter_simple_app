import 'package:flutter/material.dart';
import 'package:flutter_simple_app/views/main/pages/main_home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../constants.dart';

class HeaderWithSearcBar extends StatelessWidget {
  const HeaderWithSearcBar({Key? key, required this.widget, required this.name})
      : super(key: key);

  final MainHome widget;
  final String name;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hi $name!',
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
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            height: 54,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: kPrimaryColor.withOpacity(0.43),
                      offset: const Offset(0, 10),
                      blurRadius: 50)
                ]),
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintStyle:
                            TextStyle(color: kPrimaryColor.withOpacity(0.8)),
                        focusedBorder: InputBorder.none,
                        hintText: 'Search',
                        enabledBorder: InputBorder.none),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/icons/search.svg'))
              ],
            ),
          ),
        )
      ],
    );
  }
}
