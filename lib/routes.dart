import 'package:covid19turkey/ui/detail_cities/detail_cities.dart';
import 'package:covid19turkey/ui/home/home.dart';
import 'package:covid19turkey/ui/info/info_screen.dart';
import 'package:covid19turkey/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String home = '/home';
  static const String infoScreen = '/info_screen';
  static const String detailCities = '/detail_cities';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    home: (BuildContext context) => HomeScreen(),
    infoScreen: (BuildContext context) => InfoScreen(),
    detailCities: (BuildContext context) => CitiesDetail(),
  };
}
