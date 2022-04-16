import 'package:ecom_admin_app/components/app_title.dart';
import 'package:ecom_admin_app/user_list/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text(usersViewModel.selectedUser!.name),),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(title: usersViewModel.selectedUser!.name),
             Text(
              usersViewModel.selectedUser!.email,
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}