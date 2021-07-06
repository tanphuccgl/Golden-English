import 'dart:convert';
import 'dart:developer';

import 'package:SchoolManagementSystem/core/error/exceptions.dart';
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/get_current_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

http.Client client = http.Client();

Future<bool> addRoom(
    {@required String nameRoom,
    @required int capacity,
    @required Function function,
    @required Function function2,
    @required Function function3}) async {
  var body = jsonEncode({'nameRoom': nameRoom, 'capacity': capacity});
  final response = await client.post(
    "$mainUrl/addroom",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
    body: body,
  );
  log("Add Room:" + "$mainUrl/addroom");
  log("Response Body Add Room: ${body}");
  log("Response Add Room: ${response.statusCode}");
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
Future<bool> deleteRoom({@required String id ,Function function,Function function2}) async {


  final response = await client.delete(
    "$mainUrl/deleteroom/$id",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
  );
  log("Delete Room:" + "$mainUrl/deleteroom/$id");
  log("Response delete Product: ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    function2();
    throw ServerException();
  }
}
Future<bool> putNameRoom(
    {@required String idRoom, @required String nameRoom,@required Function function,@required Function function2}) async {
  var body = jsonEncode({'nameRoom': nameRoom});
  final response = await client.put(
    "$mainUrl/changenameroom/$idRoom",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
    body: body,
  );
  log("Put Name Room: " + "$mainUrl/changenameroom/$idRoom");
  log("Body Put Name Room : ${body}");
  log("Response Code Put Name Room : ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
function();
    return true;
  } else {
    function2();

    throw ServerException();
  }
}
Future<bool> putCapacityRoom(
    {@required String idRoom, @required int capacity
    ,@required Function function,@required Function function2}) async {
  var body = jsonEncode({'capacity': capacity});
  final response = await client.put(
    "$mainUrl/changecapacityroom/$idRoom",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
    body: body,
  );
  log("Put Capacity Room: " + "$mainUrl/changecapacityroom/$idRoom");
  log("Body Put Capacity Room : ${body}");
  log("Response Code Put Capacity Room : ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    function2();

    throw ServerException();
  }
}

