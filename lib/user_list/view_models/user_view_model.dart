import 'package:ecom_admin_app/user_list/models/user_list_model.dart';
import 'package:ecom_admin_app/user_list/repo/api_status.dart';
import 'package:ecom_admin_app/user_list/repo/user_services.dart';
import 'package:flutter/material.dart';

import '../models/user_error.dart';

class UsersViewModel extends ChangeNotifier{
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError _userError = UserError();

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError;

  UsersViewModel(){
    getusers();
  }

  setLoading(bool loading) async{
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel){
    _userListModel = userListModel;
  }

  setUserError(UserError userError){
    _userError = userError;
  }

  getusers() async{
    setLoading(true);
    var response = await UserService.getUsers();
    if(response is Success){
      setUserListModel(response.response as List<UserModel>);
    }
    if(response is Failure){
      UserError userError = UserError(code: response.code, errorMessage: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}