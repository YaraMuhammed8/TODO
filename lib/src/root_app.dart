import 'package:flutter/material.dart';
import 'package:todo/views/splash_screen.dart';
class RootApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}