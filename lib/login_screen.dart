import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_score/home_page.dart';
import 'package:live_score/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

              FilledButton(onPressed: onTapSubmitButton, child: Text("Login")),

              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SignupScreen()),
                  );
                },
                child: Text("go to Sign screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapSubmitButton() {
    if (_formkey.currentState!.validate()) {
      _loginUser();
    }
  }

  Future<void> _loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
      );
      showSnackBar('Login success');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.message ?? 'Something went to wrong');
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
