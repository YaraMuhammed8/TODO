import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildTextFormField extends StatefulWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  String labelText;
  String hintText;
  IconData? prefixIcon;
  bool isPassword;
  Function? onTap;

  BuildTextFormField({
    Key? key,
    required this.controller,
    this.prefixIcon,
    required this.hintText,
    required this.keyboardType,
    required this.labelText,
    this.isPassword = false,
    this.onTap,
  }) : super(key: key);

  @override
  State<BuildTextFormField> createState() => _BuildTextFormFieldState();
}

class _BuildTextFormFieldState extends State<BuildTextFormField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: Colors.blueGrey),
      child: SizedBox(
        height: 60,
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill the field';
            }
            return null;
          },
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!();
            }
          },
          obscureText:
              (widget.isPassword && hidePassword), //from loginScreen page
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF9F9F9),
              labelText: widget.labelText,
              hintText: widget.hintText,
              prefixIcon: Icon(widget.prefixIcon),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: Icon(hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off))
                  : null),
        ),
      ),
    );
  }
}
