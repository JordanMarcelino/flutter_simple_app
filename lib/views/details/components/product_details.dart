import 'package:flutter/material.dart';
import 'package:flutter_simple_app/views/details/pages/details_home.dart';

import '../../../constants.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DetailHome widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: kDefaultPadding,
          left: kDefaultPadding - 10,
          right: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '${widget.name}\n',
                style: const TextStyle(
                    color: kTextColor,
                    fontSize: 50,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: widget.desc,
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor.withOpacity(0.56))),
          ])),
          Text(
            '\$${widget.price}',
            style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          )
        ],
      ),
    );
  }
}
