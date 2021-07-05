
import 'dart:convert';
import 'dart:developer';

import 'package:SchoolManagementSystem/core/error/exceptions.dart';
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/feature/sign_in/data/models/login_data.dart';
import 'package:SchoolManagementSystem/feature/sign_in/data/models/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
abstract class LoginRemoteDataSource {
  Future<LoginData> login(String email, String pass);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client client;

  LoginRemoteDataSourceImpl({@required this.client});

  @override
  Future<LoginData> login(String email, String pass) {
    return _login(email, pass);
  }

  Future<LoginData> _login(String email, String pass) async {
    var body = jsonEncode({'email': email, 'password': pass});
    final response = await client
        .post('$mainUrl/account/login',
        headers: {
          "Accept": "application/json",
          "content-type": "application/json" // k co header la failed 415
        },
        body: body)
        .timeout(Duration(seconds: 15));
    log("Post Login:" + "$mainUrl/account/login");
    log("Post body Login:" + body);
    log("Response Json Login: ${json.decode(response.body)}");

    if (response.statusCode == 200) {

      var success = LoginResponseModel.fromJson(json.decode(response.body));

      return success.data;
    } else {
      throw ServerException();
    }
  }
}


http.Client client = http.Client();

Future<bool> putNewPw(
    {@required String email,
      @required String token,
      @required String newPassword,
      Function function,
      Function function2}) async {
  var body = jsonEncode({
    'token': token,
    'newPassword': newPassword,
  });

  final response = await client.post(
    "$mainUrl/accountchange/newpassword/${email}",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",

      // k co header la failed 415
    },
    body: body,
  );
  log("Put New Password:" + "$mainUrl/account/newpassword/${email}");
  log("Response Status New Password : ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    function2();
    throw ServerException();
  }
}

Future<bool> postForgotPw(
    {String email, Function function, Function function2}) async {
  var body = jsonEncode({'email': email});
  final response = await client.post("$mainUrl/account/forgotpassword",
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",

        // k co header la failed 415
      },
      body: body);
  log("Post Forgot Pw :" + "$mainUrl/account/forgotpassword");
  log("Response Post Forgot Pw : ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    function2();
    throw ServerException();
  }
}

