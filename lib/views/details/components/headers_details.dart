import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/models/bloc/clicked/clicked_bloc.dart';
import 'package:flutter_simple_app/views/details/components/sidebars_icon.dart';
import 'package:flutter_simple_app/views/details/pages/details_home.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class HeaderDetails extends StatelessWidget {
  const HeaderDetails({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DetailHome widget;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Transform.rotate(
                        angle: 180 * pi / 180,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/angle-circle-right.svg',
                            height: size.height * 0.4,
                            color: kPrimaryColor,
                          ),
                        )),
                  ),
                ),
                const Spacer(),
                SidebarIcon(
                  scale: 3,
                  event: ClickedLove(),
                  icon: 'assets/icons/heart.svg',
                  index: 0,
                  lotte:
                      'https://assets7.lottiefiles.com/datafiles/N03bNcunCAhiE6o/data.json',
                ),
                const Spacer(),
                SidebarIcon(
                  scale: 3,
                  event: ClickedLike(),
                  icon: 'assets/icons/thumbs-up.svg',
                  index: 1,
                  lotte:
                      'https://assets5.lottiefiles.com/packages/lf20_wovxkf33.json',
                ),
                const Spacer(),
                SidebarIcon(
                  scale: 1.8,
                  event: ClickedDislike(),
                  icon: 'assets/icons/thumbs-down.svg',
                  index: 2,
                  lotte:
                      'https://assets6.lottiefiles.com/packages/lf20_xtd4pwco.json',
                ),
                const Spacer(),
                SidebarIcon(
                  scale: 1.3,
                  event: ClickedBell(),
                  icon: 'assets/icons/bell.svg',
                  index: 3,
                  lotte:
                      'https://assets6.lottiefiles.com/private_files/lf30_5oi69klt.json',
                ),
                const Spacer()
              ],
            ),
          ),
          Hero(
            tag: widget.id,
            child: Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                    bottomLeft: Radius.circular(60)),
                image: DecorationImage(
                    image: NetworkImage(
                      widget.image,
                    ),
                    fit: BoxFit.cover,
                    alignment: Alignment.center),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.53),
                      offset: const Offset(0, 10),
                      blurRadius: 50)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
