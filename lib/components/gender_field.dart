import 'package:flutter/material.dart';

class GenderField extends StatefulWidget {
  @override
  State<GenderField> createState() => _GenderFieldState();
}

class _GenderFieldState extends State<GenderField> {
  String gender = "male";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Gender: ", style: TextStyle(fontWeight: FontWeight.bold),),
        Radio(
            value: "male",
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value.toString();
              });
            }),
        const Text("Male"),
        Radio(
            value: "female",
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value.toString();
              });
            }),
        const Text("Female"),
      ],
    );
  }
}
