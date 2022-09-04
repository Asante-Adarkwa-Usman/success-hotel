import 'package:flutter/material.dart';
import 'package:totel/views/parent_screen.dart';
import 'package:totel/views/screens/home_screen.dart';
import 'package:totel/views/screens/notification_screen.dart';
import 'package:totel/views/screens/offers_screen.dart';
import 'package:totel/views/screens/settings_screen.dart';
import 'package:totel/views/screens/waiting_screen.dart.dart';

// Route Names

const String homePage = '/home';
const String parentPage = '/parent';
const String waitingPage = '/waiting';
const String offersPage = '/offers';
const String settingsPage = '/settings';
const String notificationPage = '/notification';

// Control our page route flow
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => HomeScreen());

    case parentPage:
      return MaterialPageRoute(builder: (context) => const ParentScreen());

    case waitingPage:
      return MaterialPageRoute(builder: (context) => const WaitingScreen());

    case offersPage:
      return MaterialPageRoute(builder: (context) => const OffersScreen());

    case settingsPage:
      return MaterialPageRoute(builder: (context) => const SettingsScreen());

    case notificationPage:
      return MaterialPageRoute(
          builder: (context) => const NotificationScreen());

    default:
      throw ('This route name does not exit');
  }
}
