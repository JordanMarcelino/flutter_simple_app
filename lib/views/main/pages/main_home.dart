import 'package:flutter/material.dart';
import 'package:flutter_simple_app/views/main/components/header_search.dart';
import 'package:flutter_simple_app/views/main/components/text_more_button.dart';

class MainHome extends StatefulWidget {
  final String name;
  const MainHome({Key? key, required this.name}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearcBar(widget: widget),
          const TextAndMoreButton(),
        ],
      ),
    );
  }
}
