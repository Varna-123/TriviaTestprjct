import 'package:flutter/material.dart';
import 'package:trivia/HomeScreen/homescreen.dart';
import 'package:trivia/router/router_constants.dart';
import 'package:trivia/screen3/view/screen_3.dart';
import 'package:trivia/sreen2/screen2.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case RouterConstants.screen2Route:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => Screen_2(),
        );
        break;
      case RouterConstants.screen3Route:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => Screen_3(),
        );

      default:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => Home_Screen(),
        );
    }
  }
}
