import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_app/views/main/components/featured_list.dart';
import 'package:flutter_simple_app/views/main/components/header_search.dart';
import 'package:flutter_simple_app/views/main/components/product_list.dart';
import 'package:flutter_simple_app/views/main/components/text_more_button.dart';

class MainHome extends StatefulWidget {
  final String name;
  const MainHome({Key? key, required this.name}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    String name = '';
    for (var i = 0; i < user.email!.length; i++) {
      if (user.email![i] == '@') break;
      name = name + user.email![i];
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearcBar(
            widget: widget,
            name: name,
          ),
          const TextAndMoreButton(
            text: 'Recommended',
          ),
          const ProductList(),
          const TextAndMoreButton(
            text: 'Featured Shoes',
          ),
          const FeaturedList()
        ],
      ),
    );
  }
}
