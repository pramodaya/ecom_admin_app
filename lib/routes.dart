
// We use name route
// All our routes will be available here

import 'package:ecom_admin_app/screens/add_product/view/add_product_screen.dart';
import 'package:ecom_admin_app/screens/authantication/forgot_password/forgot_password_screen.dart';
import 'package:ecom_admin_app/screens/authantication/sign_in/view/sign_in_screen.dart';
import 'package:ecom_admin_app/screens/authantication/sign_up/sign_up_screen.dart';
import 'package:ecom_admin_app/screens/authantication/view/authantication_wrapper.dart';
import 'package:ecom_admin_app/screens/category/view/category_screen.dart';
import 'package:ecom_admin_app/screens/order/view/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'screens/cart/cart_screen.dart';
import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/details/details_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/login_success/login_success_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CategoryScreen.routeName: (context) => CategoryScreen(),
  AuthanticationWrapper.routeName : (context) => AuthanticationWrapper(),
  AddProductScreen.routeName :(context) => AddProductScreen(),
  OrderScreen.routeName : (context) => OrderScreen(),
};
