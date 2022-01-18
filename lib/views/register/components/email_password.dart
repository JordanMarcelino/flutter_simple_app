import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_app/models/bloc/obscure/obscuretext_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class EmailAndPassword extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  const EmailAndPassword(
      {Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool toggle = false;
    const style = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.25,
      margin: const EdgeInsets.only(top: kDefaultPadding),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding + 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Column(
          children: [
            TextField(
              controller: email,
              style: style,
              decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      fontSize: 22, color: kTextColor.withOpacity(0.5))),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            BlocBuilder<ObscuretextBloc, ObscuretextState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: password,
                        obscureText: state.obscure,
                        style: style,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                fontSize: 22,
                                color: kTextColor.withOpacity(0.5))),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          toggle = !toggle;
                          (toggle)
                              ? context
                                  .read<ObscuretextBloc>()
                                  .add(ObscureToggleOn())
                              : context
                                  .read<ObscuretextBloc>()
                                  .add(ObscureToggleOff());
                        },
                        child: SvgPicture.asset(state.assets))
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
