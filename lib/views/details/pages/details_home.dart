import 'package:flutter/material.dart';
import 'package:flutter_simple_app/constants.dart';
import 'package:flutter_simple_app/views/details/components/buy_button.dart';
import 'package:flutter_simple_app/views/details/components/headers_details.dart';
import 'package:flutter_simple_app/views/details/components/product_details.dart';

class DetailHome extends StatefulWidget {
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
  State<DetailHome> createState() => _DetailHomeState();
}

class _DetailHomeState extends State<DetailHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding - 10),
            child: Column(
              children: [
                HeaderDetails(widget: widget),
                ProductDetails(widget: widget),
              ],
            ),
          ),
          const BuyButton(),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
