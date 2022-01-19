import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_app/models/bloc/obscure/obscuretext_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';

class SignUpAccount extends StatelessWidget {
  const SignUpAccount(
      {Key? key,
      required this.email,
      required this.name,
      required this.password,
      required this.formKey})
      : super(key: key);

  final TextEditingController email;
  final TextEditingController name;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    bool toggle = false;
    const style = TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white);
    final size = MediaQuery.of(context).size;

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        height: size.height * 0.4,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding + 20),
        child: Padding(
          padding: const EdgeInsets.only(bottom: kDefaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Required a name'),
                  MaxLengthValidator(15, errorText: 'Max length is 15')
                ]),
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
                validator: MultiValidator([
                  EmailValidator(errorText: 'Enter a valid email'),
                  RequiredValidator(errorText: 'Required an email')
                ]),
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
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Required a password'),
                            MinLengthValidator(6,
                                errorText: 'Enter a min. 6 characters')
                          ]),
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
