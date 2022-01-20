import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_app/constants.dart';
import 'package:flutter_simple_app/views/details/body.dart';
import 'package:flutter_simple_app/views/main/body.dart';
import 'package:flutter_simple_app/views/register/body.dart';
import 'package:flutter_simple_app/views/users/body.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'models/utils.dart';
import 'package:page_transition/page_transition.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple App',
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              GoogleFonts.montserratTextTheme().apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => AnimatedSplashScreen(
              nextScreen: const Wrapper(),
              splash: Transform.scale(
                scale: 3.5,
                child: LottieBuilder.network(
                  'https://assets2.lottiefiles.com/packages/lf20_5zh17nif.json',
                ),
              ),
              animationDuration: const Duration(seconds: 2),
              backgroundColor: kPrimaryColor,
              duration: 3000,
              splashTransition: SplashTransition.slideTransition,
              pageTransitionType: PageTransitionType.rightToLeftWithFade,
            ),
        '/details': (context) => const DetailPage(),
        '/home': (context) => const MainPage(),
        '/favorite': (context) => const MainPage(),
        '/user': (context) => const UserPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/user':
            return PageTransition(
                type: PageTransitionType.leftToRight,
                child: const UserPage(),
                settings: settings);
          case '/home':
            return PageTransition(
                type: PageTransitionType.rightToLeft,
                child: const UserPage(),
                settings: settings);
          default:
            null;
        }
      },
    );
  }
}
