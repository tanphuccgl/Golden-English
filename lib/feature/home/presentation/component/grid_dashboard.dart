import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog1.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog2.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/about_us/presentation/pages/about_us_page.dart';
import 'package:SchoolManagementSystem/feature/calendar/presentation/pages/calendar_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/course_page.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/room_page.dart';
import 'package:SchoolManagementSystem/feature/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';

class GridViewDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void showNotification() {
      var alert = new AlertDialog1(
        image: "developing",
        title: "Notification",
        description: "Functions in development",
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

    Items item1 = new Items(
        title: "Room",
        subtitle: "Classroom Management",
        event: "3 Items",
        img: "assets/icons/classroom.png",
        function: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RoomPage()));
//Navigator.pushReplacementNamed(context, PageRoutes.roomPage);
        });

    Items item2 = new Items(
        title: "Course",
        subtitle: "Course Management",
        event: "3 Items",
        img: "assets/icons/course.png",
        function: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CoursePage()));
        });
    Items item3 = new Items(
        title: "Calendar",
        subtitle: "View current class schedule",
        event: "",
        img: "assets/icons/calendar.png",
        function: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CalendarPage()));
        });
    Items item4 = new Items(
        title: "Notification",
        subtitle: "New notification",
        event: "",
        img: "assets/icons/notification.png",
        function: () {
          showNotification();
        });
    Items item5 = new Items(
        title: "Settings",
        subtitle: "Change password and log out",
        event: "2 Items",
        img: "assets/icons/setting.png",
        function: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingsPage()));
        });
    Items item6 = new Items(
        title: "About us",
        subtitle: "Developer and app information",
        event: "",
        img: "assets/icons/aboutus.png",
        function: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutUsPage()));
        });
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    Size size = MediaQuery.of(context).size;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(
              onTap: data.function,
              child: Container(
                decoration: BoxDecoration(
                    color: kPrimaryOrange2Color,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: size.width / 8.571428571428571,
                    ),
                    SizedBox(
                      height: size.height / 45.71428571428571,
                    ),
                    Center(
                      child: Text(data.title,textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: size.height / 80,
                    ),
                    Center(
                      child: Text(data.subtitle,textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: size.height / 45.71428571428571,
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
