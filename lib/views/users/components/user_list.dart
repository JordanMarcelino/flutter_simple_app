import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_app/models/bloc/users/user_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class UserList extends StatefulWidget {
  const UserList({
    Key? key,
  }) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Column(
            children: [
              listGenerate('assets/icons/dollar.svg', context, DollarClick(),
                  state, 0, 'Balance'),
              listGenerate('assets/icons/heart.svg', context, FavouriteClick(),
                  state, 1, 'Favourite'),
              listGenerate('assets/icons/address-book.svg', context,
                  AddresClick(), state, 2, 'Daftar Transaksi'),
              listGenerate('assets/icons/shop.svg', context, StoreClick(),
                  state, 3, 'Toko yang difollow'),
            ],
          );
        },
      ),
    );
  }

  Padding listGenerate(String asset, BuildContext context, UserEvent userEvent,
      UserState state, int index, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: ListTile(
        selected: state.click[index],
        onTap: () {
          context.read<UserBloc>().add(userEvent);
        },
        selectedTileColor: kPinkColor.withOpacity(0.43),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: kPrimaryColor.withOpacity(0.23),
        contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        leading: SvgPicture.asset(asset),
        title: Text(
          label,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
