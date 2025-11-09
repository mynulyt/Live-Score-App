import 'package:flutter/material.dart';
import 'package:live_score/app.dart';

// Demo navigation handler
class NotificationNavigator {
  static void handleNavigation(String path) {
    if (path == '/home') {
      Navigator.pushNamed(FootballLiveScoreApp.navigator.currentContext!, '/');
    }
  }
}
