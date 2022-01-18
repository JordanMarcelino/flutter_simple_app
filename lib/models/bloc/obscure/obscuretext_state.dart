part of 'obscuretext_bloc.dart';

@immutable
abstract class ObscuretextState {
  String assets;
  bool obscure;
  ObscuretextState({required this.assets, required this.obscure});
}

class ObscuretextInitial extends ObscuretextState {
  ObscuretextInitial()
      : super(assets: 'assets/icons/eye-crossed.svg', obscure: true);
}

class ObscureTextResult extends ObscuretextState {
  ObscureTextResult(String assets, bool obscure)
      : super(assets: assets, obscure: obscure);
}
