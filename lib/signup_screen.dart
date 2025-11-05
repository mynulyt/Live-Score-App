import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController confirmedPassTEController = TextEditingController();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          spacing: 8,
          children: [
            TextFormField(
              controller: emailTEController,
              decoration: InputDecoration(hintText: "Email"),
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter a valid Email";
                }
                return null;
              },
            ),

            TextFormField(
              controller: passwordTEController,
              decoration: InputDecoration(hintText: "password"),
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter a valid password";
                }
                return null;
              },
            ),

            TextFormField(
              controller: confirmedPassTEController,
              decoration: InputDecoration(hintText: "password"),
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter a valid password";
                } else if (passwordTEController != confirmedPassTEController) {
                  return "Don't macth confirmed password";
                }
                return null;
              },
            ),
            FilledButton(onPressed: () {}, child: Text("Register")),
          ],
        ),
      ),
    );
  }
}
