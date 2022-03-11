import 'package:flutter/material.dart';
class BuildButton extends StatelessWidget {
  String text;
  Function onPressed;

  BuildButton({required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffFFD4B8),
              Color(0xffFFA090),
            ],
          )),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        minWidth: double.infinity,
        height: 55,
        textColor: Colors.white,
        child:  Text(text, style: const TextStyle(fontSize: 20, fontFamily: "Cairo"),
        ),
      ),
    );
  }
}
