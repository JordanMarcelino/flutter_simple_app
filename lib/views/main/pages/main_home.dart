import 'package:flutter/material.dart';
import 'package:flutter_simple_app/models/users/user.dart';
import 'package:flutter_simple_app/views/main/components/featured_list.dart';
import 'package:flutter_simple_app/views/main/components/header_search.dart';
import 'package:flutter_simple_app/views/main/components/product_list.dart';
import 'package:flutter_simple_app/views/main/components/text_more_button.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key, required this.userAccount}) : super(key: key);
  final UserAccount? userAccount;

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearcBar(
            account: widget.userAccount,
            widget: widget,
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
