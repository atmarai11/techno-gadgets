import 'package:techno_gadgets/api/http_services.dart';
import 'package:techno_gadgets/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';
import '../response/login_response.dart';


class UserAPI {
  Future<bool> registerUser(User user) async {
    bool isLogin = false;
    Response response;

    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.post(url, data: user.toJson());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<bool> login(String username, String password) async{
  bool isLogin = false;
  try{
    var url = baseUrl + loginUrl;
    var dio = HttpServices().getDioInstance();

    var response = await dio.post(
      url,
      data: {
        "username": username,
        "password": password,
      },
    );
    if(response.statusCode == 200) {
      LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      token = loginResponse.token;
      isLogin = true;
    }
  }
  catch(e) {
    debugPrint(e.toString());
  }
  return isLogin;
}


}
