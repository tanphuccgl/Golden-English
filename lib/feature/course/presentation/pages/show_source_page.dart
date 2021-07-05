import 'package:SchoolManagementSystem/core/api/api_course.dart';
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog1.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog2.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/core/utils/spinkit.dart';
import 'package:SchoolManagementSystem/feature/course/data/data_sources/course_remote_data_source.dart';
import 'package:SchoolManagementSystem/feature/course/data/models/course_response_model.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/course_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/detail_course_page.dart';
import 'package:flutter/material.dart';

class ShowCoursePage extends StatefulWidget {
  static const String routeName = '/ShowCoursePage';

  const ShowCoursePage({
    Key key,
  }) : super(key: key);

  @override
  _ShowCoursePageState createState() => _ShowCoursePageState();
}

class _ShowCoursePageState extends State<ShowCoursePage> {
  CourseResponseModel courseResponseModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiCourse.getData().then((value) {
      setState(() {
        courseResponseModel = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (courseResponseModel != null) {
      return Scaffold(
        backgroundColor: kPrimaryOrangeColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryWhiteColor,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CoursePage()));
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
                      "Show Course",
                      style: TextStyle(
                          color: kPrimaryWhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 32,
                ),
                Expanded(
                  child: GridView.count(
                      childAspectRatio: 1.0,
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      children: courseResponseModel.data.map((data) {
                        return GestureDetector(
                          onTap: () async {
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailCoursePage(
                                          data: data,
                                        )));
                          },
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: null,
                                child: Container(
                                  height: size.height,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      color: kPrimaryOrange2Color,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      // Image.asset(
                                      //   data.img,
                                      //   width: 42,
                                      // ),

                                      Container(
                                        width: size.width / 3.6,
                                        child: Center(
                                          child: Text(data?.nameCourse ?? "",
                                              textAlign: TextAlign.center,
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height / 80,
                                      ),
                                      Text("${data.amount} students",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(
                                        height: size.height / 45.71428571428571,
                                      ),
                                      Text("Study in ${data.during} weeks",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(
                                        height: size.height / 45.71428571428571,
                                      ),

                                      data.schedule == "2"
                                          ? Text("Schedule: 2-4-6",
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600))
                                          : data.schedule == "1"
                                              ? Text("Schedule: Study all week",
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600))
                                              : Text("Schedule: 3-5-7",
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ),
                              data.isCheck == 2
                                  ? Positioned(
                                      right: -10,
                                      top: -10,
                                      child: IconButton(
                                        icon: CircleAvatar(
                                          backgroundColor:
                                              Colors.deepOrangeAccent,
                                          child: Icon(
                                            Icons.work_outline,
                                            size: 20,
                                            color: kPrimaryWhiteColor,
                                          ),
                                        ),
                                      ))
                                  : Positioned(
                                      right: -10,
                                      top: -10,
                                      child: IconButton(
                                        icon: CircleAvatar(
                                          backgroundColor:
                                              Colors.deepOrangeAccent,
                                          child: Icon(
                                            Icons.work_off_outlined,
                                            size: 20,
                                            color: kPrimaryWhiteColor,
                                          ),
                                        ),
                                      )),
                            ],
                          ),
                        );
                      }).toList()),
                ),
              ],
            )),
      );
    } else {
      return Scaffold(
        backgroundColor: kPrimaryOrangeColor,
        body: Center(
          child: SpinkitLoading(),
        ),
      );
    }
  }

  void showSuccess() {
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

  void showError() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "Course deletion failed",
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
