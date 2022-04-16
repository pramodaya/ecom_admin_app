import 'package:ecom_admin_app/user_list/views/add_user_screen.dart';
import 'package:ecom_admin_app/user_list/views/user_details_screen.dart';
import 'package:flutter/material.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UserDetailsScreen(),
    ),
  );
}

void openAddUser(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AddUserScreen(),
    ),
  );
}