import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:live_score/app.dart';
import 'package:live_score/push_notifi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FCMService.initialize();
  print(FCMService.getToken());

  runApp(const FootballLiveScoreApp());
}
