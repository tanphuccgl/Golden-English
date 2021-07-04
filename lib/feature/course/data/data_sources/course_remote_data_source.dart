import 'dart:convert';
import 'dart:developer';

import 'package:SchoolManagementSystem/core/error/exceptions.dart';
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/get_current_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

http.Client client = http.Client();

Future<bool> addCourse(
    {@required String nameCourse,
    @required String schedule,
    @required int during,
    @required int amount,
    @required Function function,
    @required Function function2,
    @required Function function3}) async {
  var body = jsonEncode({
    'nameCourse': nameCourse,
    'schedule': schedule,
    'during': during,
    'amount': amount
  });
  final response = await client.post(
    "$mainUrl/addcourse",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
    body: body,
  );
  log("Add Course:" + "$mainUrl/addcourse");
  log("Response Body Add Course: ${body}");
  log("Response Add Course: ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else if (response.statusCode == 402) {
    function2();
  } else {
    function3();
    throw ServerException();
  }
}

Future<bool> deleteCourse({@required String id,Function function,Function function2}) async {
  final response = await client.delete(
    "$mainUrl/deletecourse/$id",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
  );
  log("Delete Course:" + "$mainUrl/deletecourse/$id");
  log("Response delete Course: ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    function2();
    throw ServerException();
  }
}

Future<bool> putNameCourse(
    {@required String idCourse,
    @required String nameCourse,
    @required Function function,
    @required Function function2,@required Function function3}) async {
  var body = jsonEncode({'nameCourse': nameCourse});
  final response = await client.put(
    "$mainUrl/changenamecourse/$idCourse",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
    body: body,
  );
  log("Put Name Course: " + "$mainUrl/changenamecourse/$idCourse");
  log("Body Put Name Course : ${body}");
  log("Response Code Put Name Course : ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;

  }else if(response.statusCode==402)
    {
      function2();
    }
  else {
    function3();
    throw ServerException();
  }
}

Future<bool> putNumberofStudent(
    {@required String id, @required int amount,@required Function function,@required Function function2}) async {
  var body = jsonEncode({'amount': amount});
  final response = await client.put(
    "$mainUrl/changeamountcourse/$id",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
    body: body,
  );
  log("Put Amount Course: " + "$mainUrl/changeamountcourse/$id");
  log("Body Put Amount Course : ${body}");
  log("Response Code Put Amount Course : ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    function2();

    throw ServerException();
  }
}
Future<bool> putSchedule(
    {@required String id, @required String schedule,@required Function function,@required Function function2}) async {
  var body = jsonEncode({'schedule': schedule});
  final response = await client.put(
    "$mainUrl/changeschedulecourse/$id",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
    body: body,
  );
  log("Put Schedule Course: " + "$mainUrl/changeschedulecourse/$id");
  log("Body Put Schedule Course : ${body}");
  log("Response Code Put Schedule Course : ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    function2();

    throw ServerException();
  }
}

