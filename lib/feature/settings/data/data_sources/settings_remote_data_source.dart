import 'dart:convert';
import 'dart:developer';

import 'package:SchoolManagementSystem/core/error/exceptions.dart';
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/get_current_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

http.Client client = http.Client();

Future<bool> putChangePw({@required Function function,@required Function function1,
  @required String password,
  @required String newPassword ,
}) async {
  var body = jsonEncode({
    'password': password,
    'newPassword': newPassword ,

  });
  final response = await client.put(
    "$mainUrl/account/changepassword",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },body: body,
  );
  log("Put Change Pw: " + "$mainUrl/account/changepassword");
  log("Response Put Change Pw: ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    function1();
    throw ServerException();
  }
}