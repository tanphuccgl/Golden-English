import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/add_course_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/search_course_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/show_source_page.dart';

import 'package:flutter/material.dart';

class ItemsCourse {
  String title;
  String subtitle;
  String event;
  String img;
  Function function;

  ItemsCourse({this.title, this.subtitle, this.event, this.img, this.function});
}

class ListViewSettingCourse extends StatefulWidget {

  const ListViewSettingCourse({Key key})
      : super(key: key);

  @override
  _ListViewSettingCourseState createState() => _ListViewSettingCourseState();
}

class _ListViewSettingCourseState extends State<ListViewSettingCourse> {
  @override
  Widget build(BuildContext context) {
    ItemsCourse item1 = new ItemsCourse(
        title: "Show Course",
        subtitle: "View current courses and edit courses",
        img: "assets/icons/showcourse.png",
        function: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowCoursePage()));
        });

    ItemsCourse item2 = new ItemsCourse(
      title: "Create Course",
      subtitle: "Add a new Course",

      img: "assets/icons/add.png",function: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCoursePage()));
    },
    );

    ItemsCourse item3 = new ItemsCourse(
      title: "Search",
      subtitle: "Search courses by name",

      img: "assets/icons/search.png",function: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchCoursePage()));
    },
    );

    List<ItemsCourse> myList = [item1, item2, item3,];
Size size= MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5),
          child: GestureDetector(
            onTap: myList[index].function,
            child: Container(
              decoration: BoxDecoration(
                  color: kPrimaryOrange2Color,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    myList[index].img,
                    width: size.width/8.571428571428571,
                  ),
                  SizedBox(
                    height: size.height/128,
                  ),
                  Text(myList[index].title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: size.height/80,
                  ),
                  Text(myList[index].subtitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: size.height/45.71428571428571,
                  ),

                ],
              ),
            ),
          ),
        );
      },
      padding: EdgeInsets.only( top: 20, bottom: 20),
      itemCount: myList.length,
    );
  }
}
