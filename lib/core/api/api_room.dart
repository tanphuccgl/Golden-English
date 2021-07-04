
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/get_current_user.dart';
import 'package:SchoolManagementSystem/feature/room/data/models/room_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiRoom {
  ApiRoom._();

  static Future<RoomResponseModel> getData() async {
    try {
      final response = await Dio().get('$mainUrl/room',options: new Options(headers:
      {
        'auth-token': '${getCurrentUser().token}',
      }));

      print("Get Room: ${response.data}");
      print("Status Get Room: ${response.statusCode}");
      return RoomResponseModel.fromJson(response.data);

      //return (reponse.data as List).map((e) => Country.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e);
    }
  }






}