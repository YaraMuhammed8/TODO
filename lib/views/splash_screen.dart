import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo/views/intro_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        splashTransition: SplashTransition.slideTransition,
        splashIconSize: 3000,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/images/list.png", fit: BoxFit.cover, height: 80, width: 80,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("TO", style: TextStyle(color: Color(0xff4E7D96),
                    fontSize: 25, fontFamily: "Hubballi", fontWeight: FontWeight.bold),
                ),
                Text("DO", style: TextStyle(color: Color(0xff9FB9C8),
                    fontSize: 25, fontFamily: "Hubballi",fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ),
        nextScreen: IntroScreen());
  }
}
