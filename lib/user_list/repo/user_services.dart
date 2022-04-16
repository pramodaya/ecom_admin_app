import 'dart:io';

import 'package:ecom_admin_app/user_list/models/user_list_model.dart';
import 'package:ecom_admin_app/user_list/repo/api_status.dart';
import 'package:ecom_admin_app/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserService{
  static Future<Object> getUsers() async {
    try{
      var url = Uri.parse(USERS_LIST);
      var response = await http.get(url);
      if(200== response.statusCode){
        return Success(code: 200, response: usersListModelFromJson(response.body));
      }
      return Failure(code: USER_INVALID_RESONSE, errorResponse: 'Invaild Response');
    }     
    on HttpException{
      return Failure(code: No_INTERNET, errorResponse: 'No Internet');
    }
    on FormatException{
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    }
    catch(e){
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  } 
}