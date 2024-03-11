import 'package:donor/home/home.dart';
import 'package:flutter/material.dart';
import 'package:donor/auth/login.dart';
import 'package:donor/auth/signup.dart';
import 'package:donor/donor/add.dart';
import 'package:donor/search/search.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SearchScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(),
      );
    case Home.routeName:
      return MaterialPageRoute(settings: routeSettings, builder: (_) => Home());
    case AddDonorPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AddDonorPage());
    case LoginScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => LoginScreen());
    case SignupScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => SignupScreen());
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
