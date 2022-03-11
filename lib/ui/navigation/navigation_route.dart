import 'package:caf_application/ui/home/home_screen.dart';
import 'package:caf_application/ui/login/login_screen.dart';
import 'package:caf_application/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

const startScreen = "/";
const homeScreen = "/home";
const loginScreen = "/login";

final Map<String, WidgetBuilder> customRoutes = {
  startScreen: ((context) => SplashScreen()),
  homeScreen: ((context) => HomeScreen()),
  loginScreen: ((context) => LoginScreen())
};
