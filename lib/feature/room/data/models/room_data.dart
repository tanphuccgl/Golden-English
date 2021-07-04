import 'package:SchoolManagementSystem/feature/course/data/models/course_data.dart';

class RoomData {
  List<CourseData> lichchan;
  List<CourseData> lichle;
  String sId;
  String nameRoom;
  int capacity;

  RoomData({this.lichchan, this.lichle, this.sId, this.nameRoom, this.capacity});

  RoomData.fromJson(Map<String, dynamic> json) {
    if (json['lichchan'] != null) {
      lichchan = new List<CourseData>();
      json['lichchan'].forEach((v) {
        lichchan.add(new CourseData.fromJson(v));
      });
    }
    if (json['lichle'] != null) {
      lichle = new List<CourseData>();
      json['lichle'].forEach((v) {
        lichle.add(new CourseData.fromJson(v));
      });
    }
    sId = json['_id'];
    nameRoom = json['nameRoom'];
    capacity = json['capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lichchan != null) {
      data['lichchan'] = this.lichchan.map((v) => v.toJson()).toList();
    }
    if (this.lichle != null) {
      data['lichle'] = this.lichle.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['nameRoom'] = this.nameRoom;
    data['capacity'] = this.capacity;
    return data;
  }
}