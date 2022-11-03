// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'package:e_butler_task/src/presentation_layer/Screens/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation_layer/Screens/AddLocationScreen.dart';
import '../../presentation_layer/Screens/EditUserScreen.dart';
import '../../presentation_layer/Screens/LoginScreen.dart';
import '../../presentation_layer/Screens/MainScreen.dart';
import '../../presentation_layer/Screens/UserDetailsScreen.dart';

class Routes {
  static const String intitailRoute = '/';
  static const String loginScreen = '/LoginScreen';
  static const String mainScreen = '/MainScreen';
  static const String userDetailsScreen = '/UserDetailsScreen';
  static const String addLocationScreen = '/AddLocationScreen';
  static const String editUserScreen = '/EditUserScreen';
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
        
      case Routes.addLocationScreen:
        return MaterialPageRoute(builder: (context) => AddLocationScreen());

      case Routes.editUserScreen:
        return MaterialPageRoute(builder: (context) => EditUserScreen());

      case Routes.userDetailsScreen:
        final map = routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => UserDetailsScreen(
                  user: map['user'],
                ));
    }
  }
}
