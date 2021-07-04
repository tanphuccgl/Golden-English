import 'package:SchoolManagementSystem/feature/room/data/models/room_data.dart';

class RoomResponseModel {
  int status;
  bool success;
  String message;
  List<RoomData> data;

  RoomResponseModel({this.status, this.success, this.message, this.data});

  RoomResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<RoomData>();
      json['data'].forEach((v) {
        data.add(new RoomData.fromJson(v));
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



