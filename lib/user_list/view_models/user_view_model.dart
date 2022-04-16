import 'package:ecom_admin_app/user_list/models/user_list_model.dart';
import 'package:ecom_admin_app/user_list/repo/api_status.dart';
import 'package:ecom_admin_app/user_list/repo/user_services.dart';
import 'package:flutter/material.dart';

import '../models/user_error.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError _userError = UserError();
  UserModel? _selectedUser;
  UserModel _addingUser = UserModel(id: 0, name: '', username: '', email: '', address: Address(street: '', suite: '', city: '', zipcode: '', geo: Geo(lat: '', lng: '')), phone: '', website: '', company: Company(name: '', catchPhrase: '', bs: ''));

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError;
  UserModel? get selectedUser => _selectedUser;
  UserModel get addingUser => _addingUser;

  UsersViewModel() {
    getusers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setSelecteduser(UserModel selectedUser) {
    _selectedUser = selectedUser;
  }

  setAddingUser(UserModel addUser) {
    _addingUser = addUser;
  }

  addUser() async {
    if(!isValid()){
      return;
    }
    _userListModel.add(addingUser);
    _addingUser = getEmptyUserObject();
    notifyListeners();
    return true;
  }

  bool isValid() {
    if (addingUser.name.isEmpty) {
      return false;
    }
    if (addingUser.email.isEmpty) {
      return false;
    }
    return true;
  }

  getusers() async {
    setLoading(true);
    var response = await UserService.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError =
          UserError(code: response.code, errorMessage: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

  UserModel getEmptyUserObject() {
    return UserModel(id: 0, name: '', username: '', email: '', address: Address(street: '', suite: '', city: '', zipcode: '', geo: Geo(lat: '', lng: '')), phone: '', website: '', company: Company(name: '', catchPhrase: '', bs: ''));
  }
}
