import 'dart:async';

import 'package:SchoolManagementSystem/core/api/api_course.dart';
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/spinkit.dart';
import 'package:SchoolManagementSystem/feature/course/data/models/course_data.dart';
import 'package:SchoolManagementSystem/feature/course/data/models/course_response_model.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/detail_course_page.dart';
import 'package:flutter/material.dart';

class SearchCoursePage extends StatefulWidget {
  static const String routeName = '/SearchCoursePage';

  const SearchCoursePage({Key key}) : super(key: key);

  @override
  _SearchCoursePageState createState() => _SearchCoursePageState();
}

class _SearchCoursePageState extends State<SearchCoursePage> {
  CourseResponseModel courseResponseModel;
  List<CourseData> courses = [];
  String query = '';
  Timer debouncer;

  @override
  void initState() {
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
            Navigator.pop(context);
          },
        ),
      ),
      body: courseResponseModel != null
          ? Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Search Course",
                        style: TextStyle(
                            color: kPrimaryWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height/64,
                  ),
                  buildSearch(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        final course = courses[index];

                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailCoursePage(
                                            data: course,
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kPrimaryOrange2Color,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // Image.asset(
                                  //  Course.img,
                                  //   width: 42,
                                  // ),
                                  SizedBox(
                                    height: size.height/128,
                                  ),
                                  Text("Course Name: ${course.nameCourse}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(
                                    height: size.height/80,
                                  ),
                                  Text(
                                      "Number of Students: ${course.amount.toString()}",
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(
                                    height: size.height/80,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: SpinkitLoading(),
            ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Course name?',
        onChanged: searchBook,
      );

  Future searchBook(String query) async {
    final courses = await courseResponseModel.data.where((e) {
      final a = e.nameCourse.toLowerCase();
      final b = query.toLowerCase();
      return a.contains(b);
    }).toList();

    setState(() {
      this.query = query;
      this.courses = courses;
    });
  }
}

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key key,
    @required this.text,
    @required this.onChanged,
    @required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;
Size size= MediaQuery.of(context).size;
    return Container(
      height: size.height/15.23809523809524,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
