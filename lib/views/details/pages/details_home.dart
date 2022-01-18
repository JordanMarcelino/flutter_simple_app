import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_app/constants.dart';
import 'package:flutter_simple_app/models/bloc/clicked/clicked_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class DetailHome extends StatelessWidget {
  final int id;
  final String image;
  final String desc;
  final String name;
  final int price;
  const DetailHome(
      {Key? key,
      required this.image,
      required this.id,
      required this.name,
      required this.desc,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: kDefaultPadding - 10),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<ClickedBloc, ClickedState>(
                  builder: (context, state) {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: kDefaultPadding * 3),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Transform.rotate(
                                  angle: 180 * pi / 180,
                                  child: SvgPicture.asset(
                                    'assets/icons/angle-circle-right.svg',
                                    width: 50,
                                    color: kPrimaryColor,
                                  )),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: size.height * 0.4,
                            width: size.width * 0.25,
                            margin:
                                const EdgeInsets.only(bottom: kDefaultPadding),
                            child: GestureDetector(
                              onTap: () {
                                context.read<ClickedBloc>().add(ClickedLove());
                              },
                              child: (state.click[0])
                                  ? LottieBuilder.network(
                                      'https://assets2.lottiefiles.com/packages/lf20_t9amg50m.json',
                                      fit: BoxFit.cover,
                                      repeat: false,
                                      height: size.height * 0.2,
                                      alignment: Alignment.centerLeft,
                                    )
                                  : SvgPicture.asset('assets/icons/heart.svg'),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<ClickedBloc>().add(ClickedLike());
                            },
                            child: (state.click[1])
                                ? LottieBuilder.network(
                                    'https://assets5.lottiefiles.com/packages/lf20_wovxkf33.json')
                                : SvgPicture.asset(
                                    'assets/icons/thumbs-up.svg',
                                    width: 50,
                                  ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<ClickedBloc>().add(ClickedDislike());
                            },
                            child: (state.click[2])
                                ? LottieBuilder.network(
                                    'https://assets6.lottiefiles.com/packages/lf20_cV9rDw.json')
                                : Transform.rotate(
                                    angle: 180 * pi / 180,
                                    child: SvgPicture.asset(
                                      'assets/icons/thumbs-down.svg',
                                      width: 50,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Hero(
                  tag: id,
                  child: Container(
                    height: size.height * 0.8,
                    width: size.width * 0.75,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(60),
                          bottomLeft: Radius.circular(60)),
                      image: DecorationImage(
                          image: NetworkImage(
                            image,
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
          ),
        ],
      ),
    );
  }
}
