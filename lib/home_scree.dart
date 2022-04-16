import 'package:ecom_admin_app/user_list/models/user_list_model.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:ecom_admin_app/user_list/view_models/user_view_model.dart';
// import 'package:toast/toast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(children: [
        _ui(usersViewModel, context),
        ],
      ),
    );
  }

  _ui(UsersViewModel usersViewModel, BuildContext context){
    if(usersViewModel.loading){
      return Container();
    } 
    if(usersViewModel.userError.errorMessage != ''){
      // return Fluttertoast.showToast(msg: usersViewModel.userError.errorMessage.toString());
      // Toast.show(usersViewModel.userError.errorMessage.toString(), context);
      return Container();
    }
    return Expanded(child: ListView.separated(
      itemBuilder: (context, index) {
        UserModel userModel = usersViewModel.userListModel[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(userModel.name, style: const TextStyle(color: Colors.black),)],
        );
      }, 
      separatorBuilder: (context, index) => const Divider(), 
      itemCount: usersViewModel.userListModel.length));
  }

} 