import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_admin_app/screens/authantication/sign_in/view/sign_in_screen.dart';
import 'package:ecom_admin_app/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../complete_profile/complete_profile_screen.dart';

class AuthanticationService {
  final FirebaseAuth _firebaseAuth;

  AuthanticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut(BuildContext context) async {
    await _firebaseAuth
        .signOut()
        .then((value) => Navigator.pushNamed(context, SignInScreen.routeName))
        .then((value) => Fluttertoast.showToast(msg: "Log out success"));
  }

  Future<dynamic> signIn(
      BuildContext context, String email, String password) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.pushNamed(context, HomeScreen.routeName)
              .then((value) => Fluttertoast.showToast(msg: "Login success")));
    } on FirebaseAuthException catch (e) {
      return Fluttertoast.showToast(msg: e.message!);
      // return e.message;
    }
  }

  Future<dynamic> signUp(
      BuildContext context, String email, String password) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.pushNamed(context, CompleteProfileScreen.routeName))
          .then((value) => Fluttertoast.showToast(msg: "Log out success"));
    } on FirebaseAuthException catch (e) {
      return Fluttertoast.showToast(msg: e.message!);
    }
  }

  Future<dynamic> completeProfile(
    BuildContext context, String firstName, String lastName, String phone, String address
  ) async {
    try{
      await FirebaseFirestore.instance
            .collection('users')
            .add(
              {
                'userId' : _firebaseAuth.currentUser!.uid,
                'firstName': firstName,
                'lastName': lastName,
                'phone' : phone,
                'address' : address,
                'userType' : 'admin'
                }
              ).then((value) => 
              Navigator.pushNamed(context, HomeScreen.routeName)
            );
    }catch (e){
      return Fluttertoast.showToast(msg: e.toString()!);
    }
  }
}
