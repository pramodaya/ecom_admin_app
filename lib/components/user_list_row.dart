import 'package:ecom_admin_app/components/app_title.dart';
import 'package:ecom_admin_app/user_list/models/user_list_model.dart';
import 'package:flutter/material.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final VoidCallback? onTap;
  const UserListRow({required this.userModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(title: userModel.name),
            Text(
              userModel.email,
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
