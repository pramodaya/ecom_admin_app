import 'package:ecom_admin_app/components/app_loading.dart';
import 'package:ecom_admin_app/components/app_title.dart';
import 'package:ecom_admin_app/components/user_list_row.dart';
import 'package:ecom_admin_app/user_list/models/user_list_model.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:ecom_admin_app/user_list/view_models/user_view_model.dart';

import '../../utils/navigation_utils.dart';
// import 'package:toast/toast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            onPressed: () async {
              openAddUser(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _ui(usersViewModel, context),
          ],
        ),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel, BuildContext context) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    if (usersViewModel.userError.errorMessage != '') {
      // return Fluttertoast.showToast(msg: usersViewModel.userError.errorMessage.toString());
      // Toast.show(usersViewModel.userError.errorMessage.toString(), context);
      return Container();
    }
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              UserModel userModel = usersViewModel.userListModel[index];
              return UserListRow(
                userModel: userModel,
                onTap: () async {
                  usersViewModel.setSelecteduser(userModel);
                  openUserDetails(context);
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: usersViewModel.userListModel.length));
  }
}
