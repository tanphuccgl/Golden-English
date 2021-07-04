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
        subtitle: "March, Wednesday",
        event: "${""} Classes",
        img: "assets/icons/showcourse.png",
        function: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowCoursePage()));
        });

    ItemsCourse item2 = new ItemsCourse(
      title: "Add Course",
      subtitle: "Bocali, Apple",
      event: "4 Items",
      img: "assets/icons/add.png",function: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCoursePage()));
    },
    );

    ItemsCourse item3 = new ItemsCourse(
      title: "Search",
      subtitle: "Lucy Mao going to Office",
      event: "",
      img: "assets/icons/search.png",function: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchCoursePage()));
    },
    );

    ItemsCourse item4 = new ItemsCourse(
      title: "Activity",
      subtitle: "Rose favirited your Post",
      event: "",
      img: "assets/logos/ic_launcher.png",
    );

    ItemsCourse item5 = new ItemsCourse(
      title: "To do",
      subtitle: "Homework, Design",
      event: "4 Items",
      img: "assets/logos/ic_launcher.png",
    );

    ItemsCourse item6 = new ItemsCourse(
      title: "Settings",
      subtitle: "",
      event: "2 Items",
      img: "assets/logos/ic_launcher.png",
    );
    List<ItemsCourse> myList = [item1, item2, item3, item4, item5, item6];
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
                  Text(myList[index].event,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          fontWeight: FontWeight.w600)),
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
