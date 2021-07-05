import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog1.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog2.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/core/utils/spinkit.dart';
import 'package:SchoolManagementSystem/feature/course/data/data_sources/course_remote_data_source.dart';
import 'package:SchoolManagementSystem/feature/course/data/models/course_data.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/change_name_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/change_number_of_student_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/change_schedule_page.dart';

import 'package:flutter/material.dart';

class DetailCoursePage extends StatefulWidget {
  final CourseData data;
  static const String routeName = '/DetailCoursePage';

  const DetailCoursePage({Key key, this.data}) : super(key: key);

  @override
  _DetailCoursePageState createState() => _DetailCoursePageState();
}

class _DetailCoursePageState extends State<DetailCoursePage> {
  String name;
  bool button20 = false;
  bool button30 = false;
  bool button40 = false;
  int capacity;
  TextEditingController nameText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryOrangeColor,
          ),
          onPressed: () {
            Navigator.pop(context);
            //Navigator.pushReplacementNamed(context, PageRoutes.showCoursePage);
          },
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    Size size = MediaQuery.of(context).size;
    return widget.data != null
        ? Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: SingleChildScrollView(
              child: Container(
                height: size.height + size.height / 12.8,
                width: size.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Detail Course",
                          style: TextStyle(
                              color: kPrimaryOrangeColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 32,
                    ),
                    Row(children: [
                      Text(
                        "    Course Name: ${widget.data.nameCourse}",
                        style: TextStyle(color: kPrimaryOrangeColor),
                      )
                    ]),
                    SizedBox(
                      height: size.height / 64,
                    ),
                    Row(children: [
                      Text(
                        "    Number of Students: ${widget.data.amount}",
                        style: TextStyle(color: kPrimaryOrangeColor),
                      )
                    ]),
                    SizedBox(
                      height: size.height / 64,
                    ),
                    Row(children: [
                      Text(
                        widget.data.schedule == "1"
                            ? "    Schedule: All Week"
                            : widget.data.schedule == "2"
                                ? "    Schedule: 2-4-6"
                                : "    Schedule: 3-5-7",
                        style: TextStyle(color: kPrimaryOrangeColor),
                      )
                    ]),
                    SizedBox(
                      height: size.height / 64,
                    ),
                    Row(children: [
                      Text(
                        "    Study Time: ${widget.data.during} week",
                        style: TextStyle(color: kPrimaryOrangeColor),
                      )
                    ]),
                    SizedBox(
                      height: size.height / 64,
                    ),
                    Row(children: [
                      Text(
                        "    Date Created: ${widget.data.createDate}",
                        style: TextStyle(color: kPrimaryOrangeColor),
                      )
                    ]),
                    SizedBox(
                      height: size.height / 64,
                    ),
                    Row(children: [
                      Text(
                        widget.data.isCheck == 2
                            ? "    Add to calendar: Added"
                            : "    Add to calendar: Not yet added",
                        style: TextStyle(color: kPrimaryOrangeColor),
                      )
                    ]),
                    SizedBox(
                      height: size.height / 64,
                    ),
                    widget.data.isCheck == 2
                        ? _buildMenu2(
                            title: "Add To Calendar",
                            icon: "assets/icons/ic_launcher.png",
                            onPress: () => {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             ChangeCourseNamePage(
                              //               data: widget.data,
                              //             )))
                              // Navigator.pushReplacementNamed(
                              //     context, PageRoutes.changeCourseNamePage)
                            },
                          )
                        : _buildMenu(
                            title: "Add To Calendar",
                            icon: "assets/icons/ic_launcher.png",
                            onPress: () => {
                              AlertDialog2.yesAbortDialog(
                                  context: context,
                                  title: "Add to Calendar",
                                  body:  "If you add it to the schedule, you cannot change it"
                                    ,
                                  onPressed: () {
                                   putIsCheck(id: widget.data.sId,);
                                   postAddToCalendar(function: (){
                                     showSuccessAdd();
                                   }, function2: (){
                                     showCancel();
                                   });
                                  })
                            },
                          ),
                    SizedBox(
                      height: size.height / 64,
                    ),
                    Row(
                      children: [
                        Text(
                          "Edit Course",
                          style: TextStyle(
                              color: kPrimaryOrangeColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 32,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          widget.data.isCheck == 2
                              ? _buildMenu2(
                                  title: "Change Course Name",
                                  icon: "assets/icons/ic_launcher.png",
                                  onPress: () => {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             ChangeCourseNamePage(
                                    //               data: widget.data,
                                    //             )))
                                  },
                                )
                              : _buildMenu(
                                  title: "Change Course Name",
                                  icon: "assets/icons/ic_launcher.png",
                                  onPress: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangeCourseNamePage(
                                                  data: widget.data,
                                                )))
                                    // Navigator.pushReplacementNamed(
                                    //     context, PageRoutes.changeCourseNamePage)
                                  },
                                ),
                          widget.data.isCheck == 2
                              ? _buildMenu2(
                                  title: "Change Number of Student",
                                  icon: "assets/icons/ic_launcher.png",
                                  onPress: () => {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             ChangeNumberOfStudentPage(
                                    //               data: widget.data,
                                    //             )))
                                  },
                                )
                              : _buildMenu(
                                  title: "Change Number of Student",
                                  icon: "assets/icons/ic_launcher.png",
                                  onPress: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangeNumberOfStudentPage(
                                                  data: widget.data,
                                                )))
                                  },
                                ),
                          widget.data.isCheck == 2
                              ? _buildMenu2(
                                  title: "Change Schedule",
                                  icon: "assets/icons/ic_launcher.png",
                                  onPress: () => {},
                                )
                              : _buildMenu(
                                  title: "Change Schedule",
                                  icon: "assets/icons/ic_launcher.png",
                                  onPress: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangeSchedudlePage(
                                                  data: widget.data,
                                                )))
                                  },
                                ),
                          widget.data.isCheck == 2
                              ?   _buildMenu2(
                            title: "Delete Course",
                            icon: "assets/icons/ic_launcher.png",
                            onPress: () {

                            },
                          ):  _buildMenu(
                            title: "Delete Course",
                            icon: "assets/icons/ic_launcher.png",
                            onPress: () {
                              AlertDialog2.yesAbortDialog(
                                  context: context,
                                  title: "Delete",
                                  body:
                                      "Do you want to delete the Course ${widget.data?.nameCourse}?",
                                  onPressed: () {
                                    deleteCourse(
                                        id: widget.data.sId,
                                        function: () {
                                          showSuccessDelete();
                                        },
                                        function2: () {
                                          showErrorDelete();
                                        });
                                  });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: SpinkitLoading(),
          );
  }

  void showCancel() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "Same Course name",
      onPressed: () {
        Navigator.pop(context);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void showSuccess() {
    var alert = new AlertDialog1(
      image: "ok",
      title: "SUCCESS",
      description: "Successful Course editing",
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, PageRoutes.showCoursePage);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
  void showCancelAdd() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "Add to failure calendar",
      onPressed: () {
        Navigator.pop(context);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void showSuccessAdd() {
    var alert = new AlertDialog1(
      image: "ok",
      title: "SUCCESS",
      description: "Successfully added to the calendar",
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, PageRoutes.showCoursePage);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  Widget _buildMenu({String title, String icon, Function onPress}) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: kPrimaryOrangeColor,
        onPressed: onPress,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: size.width / 16.36363636363636,
            ),
            SizedBox(width: size.width / 18),
            Expanded(
                child: Text(
              title,
              style: TextStyle(color: kPrimaryOrange2Color),
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: kPrimaryOrange2Color,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu2({String title, String icon, Function onPress}) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: kPrimaryOrangeColor,
        onPressed: onPress,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: size.width / 16.36363636363636,
            ),
            SizedBox(width: size.width / 18),
            Expanded(
                child: Text(
              title,
              style: TextStyle(color: kPrimaryOrange2Color.withOpacity(0.5)),
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: kPrimaryOrange2Color.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }


  void showSuccessDelete() {
    var alert = new AlertDialog1(
      image: "ok",
      title: "SUCCESS",
      description: "Successfully delete Course",
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);

        Navigator.pushReplacementNamed(context, PageRoutes.showCoursePage);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void showErrorDelete() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "Course deletion failed",
      onPressed: () {   Navigator.pop(context);

      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
