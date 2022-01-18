import 'package:flutter/material.dart';
import 'package:flutter_simple_app/views/main/components/featured_card.dart';

import '../../../constants.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: const [
            FeaturedCard(
              image:
                  'https://www.kindpng.com/picc/m/205-2059034_basketball-shoes-kyrie-irving-2-5-hd-png-download.png',
            ),
            FeaturedCard(
              image: 'https://wallpaper.dog/large/381375.png',
            ),
            FeaturedCard(
              image:
                  'https://www.teahub.io/photos/full/82-825681_basketball-shoes-wallpaper-hd.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
