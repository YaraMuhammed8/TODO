import 'package:flutter/material.dart';
class OrLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: const [
          Expanded(child: Divider()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("or", style: TextStyle(color: Color(0xff7F7F7F))),
          ),
          Expanded(child: Divider()),
        ]);
  }
}
