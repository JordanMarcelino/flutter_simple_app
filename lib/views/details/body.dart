import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_app/models/bloc/clicked/clicked_bloc.dart';
import 'package:flutter_simple_app/models/utils.dart';
import 'package:flutter_simple_app/views/details/pages/details_home.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ClickedBloc(),
        child: DetailHome(
          id: Utils.id,
          image: Utils.image,
          desc: Utils.desc,
          name: Utils.product,
          price: Utils.price,
        ),
      ),
    );
  }
}
