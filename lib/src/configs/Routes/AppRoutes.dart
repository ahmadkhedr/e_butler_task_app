// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable


import 'package:e_butler_task/src/presentation_layer/Screens/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation_layer/Screens/LoginScreen.dart';
import '../../presentation_layer/Screens/MainScreen.dart';

class Routes {
  static const String intitailRoute = '/';
  static const String loginScreen = '/LoginScreen';
  static const String mainScreen = '/MainScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitailRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case Routes.mainScreen:
        return MaterialPageRoute(builder: (context) => MainScreen());
    }
  }
}
