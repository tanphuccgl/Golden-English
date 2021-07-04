
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/component/listview_settings_sourse.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {

  static const String routeName = '/CoursePage';


  const CoursePage({Key key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

  Future<bool> onWillPop() async {
    Navigator.pop(context);
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    return Future.value(true);
  }
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return WillPopScope(
       onWillPop: onWillPop,
      child: Scaffold(
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
              Navigator.pushReplacementNamed(context, PageRoutes.homePage);
            },
          ),
        ),
        body:Padding(padding: EdgeInsets.only(left: 25,right: 25),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Course",
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
            Expanded(child: ListViewSettingCourse()),
          ],
        ),),

      ),
    );
  }
}
