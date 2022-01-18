import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_app/models/bloc/obscure/obscuretext_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class SignUpAccount extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController name;
  final GlobalKey<FormState> formKey;

  const SignUpAccount(
      {Key? key,
      required this.email,
      required this.password,
      required this.name,
      required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool toggle = false;
    const style = TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white);
    Size size = MediaQuery.of(context).size;

    return Form(
      key: formKey,
      child: Container(
        height: size.height * 0.4,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding + 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  value == null && value!.isEmpty ? 'Enter a name' : null;
                },
                controller: name,
                style: style,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: 'Name',
                    hintStyle: TextStyle(fontSize: 22, color: Colors.white)),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  value != null && EmailValidator.validate(value)
                      ? 'Enter a valid email'
                      : null;
                },
                controller: email,
                style: style,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 22, color: Colors.white)),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              BlocBuilder<ObscuretextBloc, ObscuretextState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            value != null && value.length < 6
                                ? 'Enter a min. 6 characters'
                                : null;
                          },
                          controller: password,
                          obscureText: state.obscure,
                          style: style,
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintText: 'Password',
                              hintStyle:
                                  TextStyle(fontSize: 22, color: Colors.white)),
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
                          child: SvgPicture.asset(
                            state.assets,
                            color: Colors.white,
                          ))
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
