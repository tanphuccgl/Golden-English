import 'package:SchoolManagementSystem/feature/course/data/models/course_data.dart';

class CourseResponseModel {
  int status;
  bool success;
  String message;
  List<CourseData> data;

  CourseResponseModel({this.status, this.success, this.message, this.data});

  CourseResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<CourseData>();
      json['data'].forEach((v) {
        data.add(new CourseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
