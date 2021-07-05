import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/about_us/presentation/pages/about_us_page.dart';
import 'package:SchoolManagementSystem/feature/calendar/presentation/pages/calendar_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/add_course_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/change_name_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/change_number_of_student_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/change_schedule_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/course_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/detail_course_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/search_course_page.dart';
import 'package:SchoolManagementSystem/feature/course/presentation/pages/show_source_page.dart';
import 'package:SchoolManagementSystem/feature/home/presentation/pages/home_page.dart';
import 'package:SchoolManagementSystem/feature/onboarding_screen/presentation/pages/onboarding_screen.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/add_room_page.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/change_capacity_page.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/detail_room_page.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/change_name_room_page.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/room_page.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/search_room_page.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/show_room_page.dart';
import 'package:SchoolManagementSystem/feature/settings/presentation/pages/change_pw_page.dart';
import 'package:SchoolManagementSystem/feature/settings/presentation/pages/settings_page.dart';
import 'package:SchoolManagementSystem/feature/sign_in/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:SchoolManagementSystem/core/utils/injection_container.dart' as di;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/sign_in/data/models/login_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  int initScreen;
  prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  runApp(MyApp(initScreen: initScreen,));
}

SharedPreferences prefs;
LoginData appUser;
// ProfileData appProfile;

class MyApp extends StatefulWidget {
  final int initScreen;

  const MyApp({Key key, this.initScreen}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
      initialRoute: widget.initScreen == 0 || widget.initScreen == null
          ? PageRoutes.onBoardingScreen
          : PageRoutes.signIn,
      routes: {

        PageRoutes.onBoardingScreen: (context) => OnBoardingScreen(),
        PageRoutes.signIn: (context) => SignInPage(),
        PageRoutes.homePage: (context) => HomePage(),

        PageRoutes.roomPage: (context) => RoomPage(),
        PageRoutes.showRoomPage: (context) => ShowRoomPage(),
        PageRoutes.addRoomPage: (context) => AddRoomPage(),
        PageRoutes.detailRoomPage: (context) => DetailRoomPage(),
        PageRoutes.changeNameRoomPage: (context) => ChangeNameRoomPage(),
        PageRoutes.changeCapacityPage: (context) => ChangeCapacityPage(),
        PageRoutes.searchRoomPage: (context) => SearchRoomPage(),


        PageRoutes.coursePage: (context) => CoursePage(),
        PageRoutes.showCoursePage: (context) => ShowCoursePage(),
        PageRoutes.addCoursePage: (context) => AddCoursePage(),
        PageRoutes.detailCoursePage: (context) => DetailCoursePage(),
        PageRoutes.changeCourseNamePage: (context) => ChangeCourseNamePage(),
        PageRoutes.changeNumberOfStudentPage: (context) => ChangeNumberOfStudentPage(),
        PageRoutes.changeSchedulePage: (context) => ChangeSchedudlePage(),
        PageRoutes.searchCoursePage: (context) => SearchCoursePage(),

        PageRoutes.calendarPage: (context) => CalendarPage(),
        PageRoutes.aboutUsPage: (context) => AboutUsPage(),


        PageRoutes.settingsPage: (context) => SettingsPage(),
        PageRoutes.changePwPage: (context) => ChangePwPage(),





      },
    );
  }
}