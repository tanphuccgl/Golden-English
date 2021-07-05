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

class PageRoutes{


  static const String onBoardingScreen=OnBoardingScreen.routeName;
  static const String signIn=SignInPage.routeName;
  static const String homePage = HomePage.routeName;

  static const String roomPage = RoomPage.routeName;
  static const String showRoomPage = ShowRoomPage.routeName;
  static const String addRoomPage = AddRoomPage.routeName;
  static const String detailRoomPage = DetailRoomPage.routeName;
  static const String changeNameRoomPage = ChangeNameRoomPage.routeName;
  static const String changeCapacityPage = ChangeCapacityPage.routeName;
  static const String searchRoomPage = SearchRoomPage.routeName;




  static const String coursePage = CoursePage.routeName;
  static const String showCoursePage = ShowCoursePage.routeName;
  static const String addCoursePage = AddCoursePage.routeName;
  static const String detailCoursePage = DetailCoursePage.routeName;
  static const String changeCourseNamePage = ChangeCourseNamePage.routeName;
  static const String changeNumberOfStudentPage = ChangeNumberOfStudentPage.routeName;
  static const String changeSchedulePage = ChangeSchedudlePage.routeName;
  static const String searchCoursePage = SearchCoursePage.routeName;

  static const String calendarPage = CalendarPage.routeName;
  static const String aboutUsPage = AboutUsPage.routeName;

  static const String settingsPage = SettingsPage.routeName;
  static const String changePwPage = ChangePwPage.routeName;







}
