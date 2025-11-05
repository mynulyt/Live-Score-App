import 'package:flutter/material.dart';

import 'package:live_score/signup_screen.dart';

class LiveScoreApp extends StatelessWidget {
  const LiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignupScreen());
  }
}
