import 'package:flutter/material.dart';
import 'package:flutter_simple_app/views/main/components/product_card.dart';

import '../../../constants.dart';

class ProductList extends StatelessWidget {
  const ProductList({
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
            ProductCard(
              image:
                  'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8&w=1000&q=80',
              name: 'Nike',
              desc: 'Rico Flare',
              price: 250,
              id: 1,
            ),
            ProductCard(
              image:
                  'https://p4.wallpaperbetter.com/wallpaper/381/913/72/shoes-basketball-air-jordan-sports-basketball-hd-art-wallpaper-preview.jpg',
              name: 'Nike',
              desc: 'Lord Faras',
              price: 280,
              id: 2,
            ),
            ProductCard(
              image:
                  'https://media.istockphoto.com/photos/running-shoes-picture-id1249496770?b=1&k=20&m=1249496770&s=170667a&w=0&h=_SUv4odBqZIzcXvdK9rqhPBIenbyBspPFiQOSDRi-RI=',
              name: 'Nike',
              desc: 'Wahyu\'z',
              price: 190,
              id: 3,
            ),
            ProductCard(
              image:
                  'https://p4.wallpaperbetter.com/wallpaper/440/106/472/kobe-iv-nike-basketball-sneakers-wallpaper-preview.jpg',
              name: 'Nike',
              desc: 'Kobe IV',
              price: 350,
              id: 4,
            ),
            ProductCard(
              image:
                  'https://sneakernews.com/wp-content/uploads/2018/06/nike-hyperdunk-kay-yow-av2059-001.jpg',
              name: 'Nike',
              desc: 'Le Jihan',
              price: 300,
              id: 5,
            ),
          ],
        ),
      ),
    );
  }
}
