import 'package:agroera_project/landing_page/landing_page.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const nameRoutes = "SplashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        backgroundColor: Colors.white,
        onInit: () {
          debugPrint("On Init");
        },
        onEnd: () {
          debugPrint("On End");
        },
        childWidget: SizedBox(
          height: 250,
          width: 250,
          child: Image.asset(
            //height: 300,
            //width: 300,
            //fit: BoxFit.cover,
            "assets/images/logoapp.png",
          ),
        ),
        onAnimationEnd: () => debugPrint("On Fade In End"),
        duration: const Duration(seconds: 3),
        nextScreen: const LandingPage(),
      ),
    );
  }
}
