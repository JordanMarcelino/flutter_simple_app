import 'package:flutter/material.dart';
import 'package:flutter_simple_app/main.dart';
import 'package:flutter_simple_app/models/utils.dart';
import '../../../constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.desc,
      required this.price,
      required this.id})
      : super(key: key);
  final String image;
  final String name;
  final String desc;
  final int price;
  final int id;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Utils.id = id;
        Utils.image = image;
        Utils.desc = desc;
        Utils.price = price;
        Utils.product = name;
        navigatorKey.currentState!.pushNamed('/details');
      },
      child: Container(
        margin: const EdgeInsets.only(
            right: kDefaultPadding, bottom: kDefaultPadding - 5),
        height: size.height * 0.289,
        width: size.width * 0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: kPrimaryColor.withOpacity(0.43),
                offset: const Offset(0, 5),
                blurRadius: 15)
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Hero(
              tag: id,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  height: size.height * 0.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: kDefaultPadding - 10,
                  left: kDefaultPadding - 5,
                  right: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '$name\n'.toUpperCase(),
                        style: const TextStyle(
                            color: kTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: desc.toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor.withOpacity(0.56))),
                  ])),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
