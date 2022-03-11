import 'package:flutter/material.dart';
import 'package:todo/components/build_button.dart';
import 'package:todo/components/build_loginwith_button.dart';
import 'package:todo/components/build_textformfield.dart';
import 'package:todo/components/gender_field.dart';
import 'package:todo/components/or_line.dart';
import 'package:todo/views/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Image.asset("assets/images/list.png", fit: BoxFit.cover, height: 30, width: 30,),
              const Text(" TO", style: TextStyle(color: Color(0xff4E7D96), fontSize: 30,
                  fontFamily: "Hubballi",fontWeight: FontWeight.bold),
              ),
              const Text("DO", style: TextStyle(color: Color(0xff9FB9C8), fontSize: 30,
                  fontFamily: "Hubballi", fontWeight: FontWeight.bold))
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Register",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 30,
                        fontFamily: "Cairo", fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          BuildTextFormField(
                              controller: name,
                              keyboardType: TextInputType.text,
                              labelText: "Name",
                              hintText: "Enter your name",
                              prefixIcon: Icons.person_outline),
                          const SizedBox(height: 10),
                          BuildTextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            labelText: "E-mail",
                            hintText: "Enter your e-mail",
                            prefixIcon: Icons.email_outlined,
                          ),
                          const SizedBox(height: 10),
                          BuildTextFormField(
                              controller: password,
                              keyboardType: TextInputType.text,
                              labelText: "Password",
                              hintText: "Enter your Password",
                              prefixIcon: Icons.lock_outline,
                              isPassword: true),
                          GenderField(),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text("Forget password?", textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold))
                      ),
                    ],
                  ),
                  BuildButton(text: "Register", onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
                        ModalRoute.withName('/'),
                      );
                    }
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: OrLine(),
                  ),
                  Row(
                    children: [
                      Text("Login with: ", style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500)),
                      Expanded(
                        child: LoginWithButton(
                            backgroundColor: const Color(0xffF1F6F7),
                            platformName: "Google",
                            textColor: Colors.black),
                      ),
                      Expanded(
                          child: LoginWithButton(
                              backgroundColor: const Color(0xff385C8E),
                              platformName: "Facebook",
                              textColor: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [const Text("Already have an account?"),
                        TextButton(
                          child: const Text("Log in", style: TextStyle(color: Color(0xff9FB9C8),fontWeight: FontWeight.bold)),
                          onPressed: () {},
                        )
                      ]),
                ],
              ),
            ),
          ),
        ));
  }
}