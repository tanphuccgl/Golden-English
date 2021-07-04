import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog1.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/course/data/data_sources/course_remote_data_source.dart';
import 'package:SchoolManagementSystem/feature/course/data/models/course_data.dart';
import 'package:flutter/material.dart';

class ChangeSchedudlePage extends StatefulWidget {
  final CourseData data;
  static const String routeName = '/ChangeSchedudlePage';

  const ChangeSchedudlePage({Key key, this.data}) : super(key: key);

  @override
  _ChangeSchedudlePageState createState() => _ChangeSchedudlePageState();
}

class _ChangeSchedudlePageState extends State<ChangeSchedudlePage> {
  bool schedule2 = false;
  bool schedule3 = false;
  bool schedule1 = false;
  String schedule;

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
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
          },
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Change Schedule",
                    style: TextStyle(
                        color: kPrimaryOrangeColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              ),
              SizedBox(
                height: size.height/32,
              ),
              Row(
                children: [
                  Text(
                    widget.data.schedule == "1"
                        ? "    Current class schedule: All Week"
                        : widget.data.schedule == "2"
                            ? "    Current class schedule: 2-4-6"
                            : "    Current class schedule: 3-5-7",
                    style: TextStyle(color: kPrimaryOrangeColor),
                  )
                ],
              ),
              SizedBox(
                height: size.height/64,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  schedule2
                      ? RaisedButton(
                          onPressed: () {
                            setState(() {
                              schedule2 = false;
                              if (schedule2 == true) {
                                schedule3 = false;
                                schedule1 = false;
                              }
                            });
                          },
                          color: kPrimaryOrangeColor,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "2-4-6",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        )
                      : RaisedButton(
                          onPressed: () {
                            setState(() {
                              schedule2 = true;
                              if (schedule2 == true) {
                                schedule3 = false;
                                schedule1 = false;
                              }
                            });
                          },
                          color: kPrimaryWhiteColor,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "2-4-6",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: kPrimaryOrangeColor),
                          ),
                        ),
                  schedule3
                      ? RaisedButton(
                          onPressed: () {
                            setState(() {
                              schedule3 = false;
                              if (schedule3 == true) {
                                schedule2 = false;
                                schedule1 = false;
                              }
                            });
                          },
                          color: kPrimaryOrangeColor,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "3-5-7",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        )
                      : RaisedButton(
                          onPressed: () {
                            setState(() {
                              schedule3 = true;
                              if (schedule3 == true) {
                                schedule2 = false;
                                schedule1 = false;
                              }
                            });
                          },
                          color: kPrimaryWhiteColor,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "3-5-7",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: kPrimaryOrangeColor),
                          ),
                        ),
                  schedule1
                      ? RaisedButton(
                          onPressed: () {
                            setState(() {
                              schedule1 = false;
                              if (schedule1 == true) {
                                schedule2 = false;
                                schedule3 = false;
                              }
                            });
                          },
                          color: kPrimaryOrangeColor,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "All week",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        )
                      : RaisedButton(
                          onPressed: () {
                            setState(() {
                              schedule1 = true;
                              if (schedule1 == true) {
                                schedule2 = false;
                                schedule3 = false;
                              }
                            });
                          },
                          color: kPrimaryWhiteColor,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "All week",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: kPrimaryOrangeColor),
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: size.height/42.66666666666667,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    color: kPrimaryOrangeColor,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                  Builder(
                      builder: (ctx) => RaisedButton(
                            onPressed: () {
                              if (schedule1 == true ||
                                  schedule2 == true ||
                                  schedule3 == true) {
                                if (schedule1) {
                                  schedule = "1";
                                } else if (schedule2) {
                                  schedule = "2";
                                } else if (schedule3) {
                                  schedule = "3";
                                }
                                putSchedule(
                                    id: widget.data.sId,
                                    schedule: schedule,
                                    function: () {
                                      showSuccess();
                                    },
                                    function2: () {
                                      showCancel();
                                    });
                              } else {
                                Scaffold.of(ctx).showSnackBar(new SnackBar(
                                  content:
                                      Text('Please complete all information'),
                                ));
                              }
                            },
                            color: kPrimaryOrangeColor,
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Accept",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.white),
                            ),
                          ))
                ],
              ),
            ],
          )),
    );
  }

  void showCancel() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "Failed to change class schedule",
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
      description: "Successfully changed class schedule",
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
}
