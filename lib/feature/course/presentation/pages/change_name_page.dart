import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog1.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/course/data/data_sources/course_remote_data_source.dart';
import 'package:SchoolManagementSystem/feature/course/data/models/course_data.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/detail_course_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/show_source_page.dart';
import 'package:flutter/material.dart';

class ChangeCourseNamePage extends StatefulWidget {
  final CourseData data;
  static const String routeName = '/ChangeCourseNamePage';

  const ChangeCourseNamePage({Key key, this.data}) : super(key: key);

  @override
  _ChangeCourseNamePageState createState() => _ChangeCourseNamePageState();
}

class _ChangeCourseNamePageState extends State<ChangeCourseNamePage> {
  TextEditingController nameText;

  String name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameText = TextEditingController(text: "${widget.data.nameCourse}");
    name = widget.data.nameCourse;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  "Change Course Name",
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
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.red)),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: kPrimaryOrangeColor,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                  ),
                ),
                Builder(
                    builder: (ctx) => RaisedButton(
                          onPressed: () {
                            if (name != null) {
                              putNameCourse(
                                  idCourse: widget.data.sId,
                                  nameCourse: name,
                                  function: () {
                                    showSuccess();
                                  },
                                  function2: () {
                                    showCancel1();
                                  },
                                  function3: () {
                                    showCancel2();
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
            )
          ],
        ),
      ),
    );
  }

  void showCancel1() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "ERROR",
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
      description: "Failed to change course name",
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
      description: "Successfully changed course name",
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
