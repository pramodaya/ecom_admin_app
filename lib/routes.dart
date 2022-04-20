
// We use name route
// All our routes will be available here
import 'package:flutter/material.dart';

import 'screens/sign_in/view/sign_in_screen.dart';
import 'screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),

};
