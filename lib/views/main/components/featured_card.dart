import 'package:flutter/material.dart';

import '../../../constants.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
          bottom: kDefaultPadding + 5, right: kDefaultPadding),
      width: size.width * 0.6,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: kPrimaryColor.withOpacity(0.43),
              offset: const Offset(0, 5),
              blurRadius: 15)
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
