class CourseData {
  String sId;
  String nameCourse;
  String schedule;
  int during;
  int amount;
  int isCheck;

  String createDate;

  CourseData(
      {this.sId,
        this.nameCourse,
        this.schedule,
        this.during,
        this.amount,
        this.isCheck,
        this.createDate});

  CourseData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nameCourse = json['nameCourse'];
    schedule = json['schedule'];
    during = json['during'];
    amount = json['amount'];
    isCheck = json['isCheck'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nameCourse'] = this.nameCourse;
    data['schedule'] = this.schedule;
    data['during'] = this.during;
    data['amount'] = this.amount;
    data['isCheck'] = this.isCheck;
    data['createDate'] = this.createDate;
    return data;
  }
}
