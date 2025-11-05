import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:live_score/home_page.dart';
import 'package:live_score/signup_screen.dart';

class FootballLiveScoreApp extends StatefulWidget {
  static GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

  const FootballLiveScoreApp({super.key});

  @override
  State<FootballLiveScoreApp> createState() => _FootballLiveScoreAppState();
}

class _FootballLiveScoreAppState extends State<FootballLiveScoreApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: FootballLiveScoreApp.navigator,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            return const HomePage();
          } else {
            return SignupScreen();
          }
        },
      ),
    );
  }
}
