import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog1.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/course/data/data_sources/course_remote_data_source.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCoursePage extends StatefulWidget {
  static const String routeName = '/AddCoursePage';

  const AddCoursePage({Key key}) : super(key: key);

  @override
  _AddCoursePageState createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  TextEditingController nameText = TextEditingController();
  TextEditingController amountText = TextEditingController();

  String name;
  int amount;
  bool schedule2 = false;
  bool schedule3 = false;
  bool schedule1 = false;
  String schedule;
  int during;
  bool during1 = false;
  bool during2 = false;
  bool error = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amount = 0;
    during = 0;
    schedule = "";
  }

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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Create Course",
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
                TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  maxLength: 40,
                  controller: nameText,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3, left: 10),
                      labelText: "  " + "Course Name",
                      labelStyle: TextStyle(color: kPrimaryOrangeColor),
                      //  errorText: "Please enter Course name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryOrangeColor)),
                      // hintText: info,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      )),
                ),
                SizedBox(
                  height: size.height/64,
                ),
                TextField(
                  onChanged: (value) {
                    amount = int.parse(value);
                  },
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  maxLength: 2,
                  controller: amountText,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3, left: 10),
                      labelText: "  " + "Number of Students",
                      labelStyle: TextStyle(color: kPrimaryOrangeColor),
                      hintText: "From 15 to 40 students",
                      //  errorText: "Please enter Course name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryOrangeColor)),
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      )),
                ),
                SizedBox(
                  height: size.height/64,
                ),
                Row(children: [
                  Text(
                    "    Schedule",
                    style: TextStyle(color: kPrimaryOrangeColor),
                  )
                ]),
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
                  height: size.height/64,
                ),
                Row(children: [
                  Text(
                    "    Study Time",
                    style: TextStyle(color: kPrimaryOrangeColor),
                  )
                ]),
                SizedBox(
                  height: size.height/64,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    during1
                        ? RaisedButton(
                            onPressed: () {
                              setState(() {
                                during1 = false;

                                during2 = true;
                              });
                            },
                            color: kPrimaryOrangeColor,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "2 week",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.white),
                            ),
                          )
                        : RaisedButton(
                            onPressed: () {
                              setState(() {
                                during1 = true;

                                during2 = false;
                              });
                            },
                            color: kPrimaryWhiteColor,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "2 week",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: kPrimaryOrangeColor),
                            ),
                          ),
                    during2
                        ? RaisedButton(
                            onPressed: () {
                              setState(() {
                                during2 = false;

                                during1 = true;
                              });
                            },
                            color: kPrimaryOrangeColor,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "3 week",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.white),
                            ),
                          )
                        : RaisedButton(
                            onPressed: () {
                              setState(() {
                                during2 = true;

                                during1 = false;
                              });
                            },
                            color: kPrimaryWhiteColor,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "3 week",
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
                          Navigator.pushReplacementNamed(
                              context, PageRoutes.coursePage);
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
                                if (name != null &&
                                    (schedule2 == true ||
                                        schedule3 == true ||
                                        schedule1 == true) &&
                                    (during1 == true || during2 == true) &&
                                    (amount <= 40 &&
                                        amount >= 15) ) {
                                  print(schedule2);
                                  print(schedule3);
                                  print(schedule1);
                                  print("name " + name);

                                  print(during1);
                                  print(during2);
                                  if (schedule2) {
                                    schedule = "2";
                                  } else if (schedule3) {
                                    schedule = "3";
                                  } else if (schedule1) {
                                    schedule = "1";
                                  }
                                  print("schedule " + schedule);
                                  if (during1) {
                                    during = 2;
                                  } else if (during2) {
                                    during = 3;
                                  }
                                  print("during " + during.toString());

                                  addCourse(
                                      nameCourse: name,
                                      schedule: schedule,
                                      during: during,
                                      amount: amount,
                                      function: () {
                                        showSuccess();
                                      },
                                      function2: () {
                                        showCancel1();
                                      },
                                      function3: () {
                                        showCancel2();
                                      });
                                } else if (amount > 40 || amount < 15) {
                                  Scaffold.of(ctx).showSnackBar(new SnackBar(
                                    content: Text(
                                        'The number of registered students is only from 15 to 40'),
                                  ));
                                } else {
                                  // print(schedule2);
                                  // print(schedule3);
                                  // print(schedule1);
                                  // print("name " + name);
                                  //
                                  // print(during1);
                                  // print(during2);
                                  // print("schedule " + schedule);
                                  // print("during " + during.toString());
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
                )
              ],
            ),
          ),
        ));
  }

  void showCancel1() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "This Course already exists",
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

  void showCancel2() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "Add failed courses",
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
      description: "Successfully added course",
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, PageRoutes.coursePage);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
