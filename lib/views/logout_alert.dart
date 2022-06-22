import 'package:flutter/material.dart';
import 'package:todo/views/home_screen.dart';
import 'package:todo/views/register_screen.dart';

import '../components/navigation.dart';

class LogoutAlert extends StatelessWidget {
  const LogoutAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Log out form TODO'),
      content: const Text("Do you want to logout from your account?"),
      actions: [
        TextButton(
            onPressed: () {
              navigateAndFinish(context, const HomeScreen());
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => RegisterScreen()),
                ModalRoute.withName('/'),
              );
            },
            child: const Text("Logout")),
      ],
    );
  }
}
