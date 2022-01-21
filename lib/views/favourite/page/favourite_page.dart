import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/models/product/product.dart';
import 'package:flutter_simple_app/models/users/user.dart';
import 'package:flutter_simple_app/views/favourite/components/product_card.dart';

import '../../../constants.dart';

class FavouriteHome extends StatefulWidget {
  const FavouriteHome({Key? key, required this.userAccount}) : super(key: key);
  final UserAccount? userAccount;

  @override
  _FavouriteHomeState createState() => _FavouriteHomeState();
}

class _FavouriteHomeState extends State<FavouriteHome> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Stack(
        children: [
          Container(
            height: size.height * 3,
            width: size.width,
            padding: const EdgeInsets.all(kDefaultPadding),
            child: StreamBuilder<List<Product>>(
                stream: readProduct(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final product = snapshot.data!;
                    return ListView(
                        scrollDirection: Axis.vertical,
                        children: product.map(buildCard).toList());
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget buildCard(Product product) => ProductCard(
      image: product.image,
      name: product.name,
      desc: product.desc,
      price: product.price,
      id: product.id);

  Stream<List<Product>> readProduct() =>
      FirebaseFirestore.instance.collection(user.uid).snapshots().map((event) =>
          event.docs.map((e) => Product.fromJson(e.data())).toList());
}
