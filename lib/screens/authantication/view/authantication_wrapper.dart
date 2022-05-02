import 'package:ecom_admin_app/screens/authantication/sign_in/view/sign_in_screen.dart';
import 'package:ecom_admin_app/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthanticationWrapper extends StatelessWidget {
  static String routeName = "/authanticationWrapper";
  const AuthanticationWrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if(firebaseUser != null){
        return HomeScreen();
    }
    return SignInScreen();
  }
}