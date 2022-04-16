import 'package:ecom_admin_app/user_list/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        actions: [
          IconButton(
            onPressed: () async {
              bool userAdded = await usersViewModel.addUser();
              if(!userAdded){
                return;
              }
              Navigator.pop(context);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Name'),
              onChanged: (val) async {
                usersViewModel.addingUser.name = val;
                var x = usersViewModel.addingUser;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
              onChanged: (val) async {
                usersViewModel.addingUser.email = val;
              },
            ),
          ],
        ),
      ),
    );
  }
}
