
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/get_current_user.dart';
import 'package:SchoolManagementSystem/feature/course/data/models/course_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiCourse {
  ApiCourse._();

  static Future<CourseResponseModel> getData() async {
    try {
      final response = await Dio().get('$mainUrl/course',
          options: new Options(headers: {
            'auth-token': '${getCurrentUser().token}',
          }));
      print("Get Link Course: $mainUrl/course");
      print("Get Course: ${response.data}");
      print("Status Get Course: ${response.statusCode}");
      return CourseResponseModel.fromJson(response.data);

      //return (reponse.data as List).map((e) => Country.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e);
    }
  }
}
