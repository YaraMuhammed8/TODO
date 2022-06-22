import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo/views/home_screen.dart';

import '../components/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => navigateAndFinish(
        context,
        HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/list.png",
                fit: BoxFit.cover,
                height: 80,
                width: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "TO",
                    style: TextStyle(
                        color: Color(0xff4E7D96),
                        fontSize: 25,
                        fontFamily: "Hubballi",
                        fontWeight: FontWeight.bold),
                  ),
                  Text("DO",
                      style: TextStyle(
                          color: Color(0xff9FB9C8),
                          fontSize: 25,
                          fontFamily: "Hubballi",
                          fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
