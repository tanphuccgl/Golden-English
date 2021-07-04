import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/calendar/presentation/pages/calendar_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/course_page.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/room_page.dart';
import 'package:flutter/material.dart';

class GridViewDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Items item1 = new Items(
        title: "Room",
        subtitle: "Classroom Management",
        event: "3 Events",
        img: "assets/icons/classroom.png",
        function: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>RoomPage()));
//Navigator.pushReplacementNamed(context, PageRoutes.roomPage);
        });

    Items item2 = new Items(
      title: "Course",
      subtitle: "Course Management",
      event: "4 Items",
      img: "assets/icons/course.png", function: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CoursePage()));
    }
    );
    Items item3 = new Items(
      title: "Calendar",
      subtitle: "Lucy Mao going to Office",
      event: "",
      img: "assets/icons/calendar.png",
        function: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CalendarPage()));}
    );
    Items item4 = new Items(
      title: "Notification",
      subtitle: "Rose favirited your Post",
      event: "",
      img: "assets/icons/notification.png",
    );
    Items item5 = new Items(
      title: "Settings",
      subtitle: "Homework, Design",
      event: "4 Items",
      img: "assets/icons/setting.png",
    );
    Items item6 = new Items(
      title: "About us",
      subtitle: "",
      event: "2 Items",
      img: "assets/icons/aboutus.png",
    );
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
Size size= MediaQuery.of(context).size;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(onTap: data.function,
              child: Container(
                decoration: BoxDecoration(
                    color: kPrimaryOrange2Color,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: size.width/8.571428571428571,
                    ),
                    SizedBox(
                      height: size.height/45.71428571428571,
                    ),
                    Text(data.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: size.height/80,
                    ),
                    Text(data.subtitle,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: size.height/45.71428571428571 ,
                    ),
                    Text(data.event,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Function function;

  Items({this.title, this.subtitle, this.event, this.img, this.function});
}
