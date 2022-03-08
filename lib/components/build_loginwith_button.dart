import 'package:flutter/material.dart';
class LoginWithButton extends StatelessWidget {
  Color backgroundColor;
  Color textColor;
  String platformName;

  LoginWithButton({required this.textColor,required this.backgroundColor,required this.platformName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: MaterialButton(
        color: backgroundColor,
        textColor:textColor,
        height: 50,
        elevation: 2,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$platformName ",style: const TextStyle(fontSize: 14),),
            Image.asset("assets/images/$platformName.png",height: 15,width: 15,fit: BoxFit.cover,),
          ],),
      ),
    );;
  }
}
