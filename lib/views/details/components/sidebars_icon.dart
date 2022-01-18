import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_app/models/bloc/clicked/clicked_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../constants.dart';

class SidebarIcon extends StatefulWidget {
  const SidebarIcon(
      {Key? key,
      required this.icon,
      required this.lotte,
      required this.index,
      required this.event,
      required this.scale})
      : super(key: key);
  final String icon;
  final double scale;
  final ClickedEvent event;
  final int index;
  final String lotte;

  @override
  State<SidebarIcon> createState() => _SidebarIconState();
}

class _SidebarIconState extends State<SidebarIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 10),
                blurRadius: 22,
                color: kPrimaryColor.withOpacity(0.53)),
            const BoxShadow(
                offset: Offset(-10, -10), blurRadius: 22, color: Colors.white)
          ]),
      child: BlocBuilder<ClickedBloc, ClickedState>(
        builder: (context, state) {
          return GestureDetector(
              onTap: () {
                context.read<ClickedBloc>().add(widget.event);
              },
              child: state.click[widget.index]
                  ? Transform.scale(
                      scale: widget.scale,
                      child: LottieBuilder.network(
                        widget.lotte,
                        repeat: false,
                      ),
                    )
                  : SvgPicture.asset(widget.icon));
        },
      ),
    );
  }
}
