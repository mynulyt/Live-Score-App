import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_score/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _confirmedPassTEController =
      TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 8,
            children: [
              SizedBox(height: 40),
              TextFormField(
                controller: _emailTEController,
                decoration: InputDecoration(hintText: "Email"),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "Enter a valid Email";
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _passwordTEController,
                decoration: InputDecoration(hintText: "password"),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "Enter a valid password";
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _confirmedPassTEController,
                decoration: InputDecoration(hintText: "password"),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "Enter a valid password";
                  } else if (_confirmedPassTEController.text !=
                      _passwordTEController.text) {
                    return "Don't macth confirmed password";
                  }
                  return null;
                },
              ),
              FilledButton(
                onPressed: onTapSubmitButton,
                child: Text("Register"),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
                child: Text("go to Login screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapSubmitButton() {
    if (_formkey.currentState!.validate()) {
      _createNewUser();
    }
  }

  Future<void> _createNewUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
      );
      showSnackBar('Register success');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        showSnackBar('The password provide is too weak');
      } else if (e.code == 'emai-already-in-used') {
        showSnackBar("The email is already exit");
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
