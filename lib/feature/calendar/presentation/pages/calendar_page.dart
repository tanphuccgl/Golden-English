import 'package:SchoolManagementSystem/core/api/api_room.dart';
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/spinkit.dart';
import 'package:SchoolManagementSystem/feature/home/presentation/pages/home_page.dart';
import 'package:SchoolManagementSystem/feature/room/data/models/room_response_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  static const String routeName = '/CalendarPage';

  const CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  RoomResponseModel roomResponseModel;

  Future<bool> onWillPop() async {
    Navigator.pop(context);
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    return Future.value(true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiRoom.getData().then((value) {
      setState(() {
        roomResponseModel = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ),
        body: roomResponseModel?.data != null
            ? Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: Text(
                          "Calendar",
                          style: TextStyle(
                              color: kPrimaryWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 64,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: size.height / 1.28,
                            child: SfCalendar(
                              view: CalendarView.month,
                              //  onTap: calendarTapped,
                              firstDayOfWeek: 7,
                              cellBorderColor: kPrimaryOrange2Color,
                              todayHighlightColor: kPrimaryOrange2Color,
                              //  initialDisplayDate: DateTime(2021, 03, 01, 08, 30),
                              //initialSelectedDate: DateTime(2021, 03, 01, 08, 30),
                              dataSource: MeetingDataSource(getAppointments()),
                              selectionDecoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.red, width: 2),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                shape: BoxShape.rectangle,
                              ),
                              showNavigationArrow: true,

                              monthViewSettings: MonthViewSettings(
                                  appointmentDisplayMode:
                                      MonthAppointmentDisplayMode.appointment),
                            ),
                          ),
                          Text(
                            "fadshfjl",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "fadshfjl",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "fadshfjl",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "fadshfjl",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "fadshfjl",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "fadshfjl",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "fadshfjl",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "fadshfjl",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "fadshfjl",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Center(
                child: SpinkitLoading(),
              ),
      ),
    );
  }

  String _subjectText = '',
      _startTimeText = '',
      _endTimeText = '',
      _dateText = '',
      _timeDetails = '';
  Color _headerColor, _viewHeaderColor, _calendarColor;

  // void calendarTapped(CalendarTapDetails details) {
  //         getAppointments().map((e) => e.)
  //   if (details.targetElement == CalendarElement.calendarCell
  //     ) {
  //     print("Adf");
  //     for (int i = 0; i <= getAppointments().length; i++)
  //       {
  //         final Meeting appointmentDetails = getAppointments()[i];
  //
  //         _subjectText = appointmentDetails.eventName;
  //         // _dateText = DateFormat('MMMM dd, yyyy')
  //         //     .format(appointmentDetails.startTime)
  //         //     .toString();
  //         _startTimeText =
  //             DateFormat('hh:mm a').format(appointmentDetails.from).toString();
  //         _endTimeText =
  //             DateFormat('hh:mm a').format(appointmentDetails.to).toString();
  //         if (appointmentDetails.isAllDay) {
  //           _timeDetails = 'All day';
  //         } else {
  //           _timeDetails = '$_startTimeText - $_endTimeText';
  //         }
  //         showDialog(
  //             context: context,
  //             builder: (BuildContext context) {
  //               return AlertDialog(
  //                 title: Container(child: new Text('$_subjectText')),
  //                 content: Container(
  //                   height: 80,
  //                   child: Column(
  //                     children: <Widget>[
  //                       Row(
  //                         children: <Widget>[
  //                           Text(
  //                             '$_startTimeText',
  //                             style: TextStyle(
  //                               fontWeight: FontWeight.w400,
  //                               fontSize: 20,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         children: <Widget>[
  //                           Text(''),
  //                         ],
  //                       ),
  //                       Row(
  //                         children: <Widget>[
  //                           Text(_timeDetails,
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.w400, fontSize: 15)),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //                 actions: <Widget>[
  //                   new FlatButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pop();
  //                       },
  //                       child: new Text('close'))
  //                 ],
  //               );
  //             });
  //       }
  //
  //   }
  // }

  List<Meeting> getAppointments() {
    List<Meeting> meetings = <Meeting>[];
    DateTime today = DateTime.utc(2021, 7, 12);
    DateTime startTime = DateTime(today.year, today.month, today.day);
    DateTime endTime =
        startTime.add(const Duration(hours: 23, minutes: 59, seconds: 59));
    int indexRoom = 0;
    int indexCourse = 0;
    for (indexRoom = 0;
        indexRoom <= roomResponseModel.data.length - 1;
        indexRoom++) {
      if (roomResponseModel.data[indexRoom] != null) {
        for (indexCourse = 0;
            indexCourse <=
                roomResponseModel.data[indexRoom].lichchan.length - 1;
            indexCourse++) {
          if (roomResponseModel
                  .data[indexRoom].lichchan[indexCourse].nameCourse !=
              null) {
            if (roomResponseModel
                    .data[indexRoom].lichchan[indexCourse].during ==
                2) {
              if (indexCourse == 0) {
                int a = 12;
                for (int i = 1; i <= 6; i++) {
                  if (i <= 3) {
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 2;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.deepOrangeAccent,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 3 && i <= 6) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.deepOrangeAccent,
                        to: startTime,
                        from: endTime));
                  }
                }
              }
              if (indexCourse == 1) {
                int a = 12 + 14;

                for (int i = 1; i <= 6; i++) {
                  if (i <= 3) {
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 2;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.blue,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 3 && i <= 6) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.blue,
                        to: startTime,
                        from: endTime));
                  }
                }
              }
              if (indexCourse == 2) {
                int a = 12 + 14 + 14;

                for (int i = 1; i <= 6; i++) {
                  if (i <= 3) {
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 2;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.orange,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 3 && i <= 6) {
                    print(a);

                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.orange,
                        to: startTime,
                        from: endTime));
                  }
                }
              }
            }
            if (roomResponseModel
                    .data[indexRoom].lichchan[indexCourse].during ==
                3) {
              if (indexCourse == 0) {
                int a = 12;
                for (int i = 1; i <= 9; i++) {
                  if (i <= 3) {
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 2;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.purple,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 3 && i <= 6) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.purple,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 6 && i <= 9) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a + 1);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.purple,
                        to: startTime,
                        from: endTime));
                  }
                }
              }
              if (indexCourse == 1) {
                int a = 12 + 14;
                for (int i = 1; i <= 9; i++) {
                  if (i <= 3) {
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 2;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.green,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 3 && i <= 6) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.green,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 6 && i <= 9) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a + 1);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.green,
                        to: startTime,
                        from: endTime));
                  }
                }
              }
              if (indexCourse == 2) {
                int a = 12 + 14 + 21;
                for (int i = 1; i <= 9; i++) {
                  if (i <= 3) {
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 2;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.black,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 3 && i <= 6) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.black45,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 6 && i <= 9) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a + 1);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichchan[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.black87,
                        to: startTime,
                        from: endTime));
                  }
                }
              }
            }
          }
        }

        for (indexCourse = 0;
            indexCourse <= roomResponseModel.data[indexRoom].lichle.length - 1;
            indexCourse++) {
          if (roomResponseModel
                  .data[indexRoom].lichle[indexCourse].nameCourse !=
              null) {
            if (roomResponseModel.data[indexRoom].lichle[indexCourse].during ==
                2) {
              if (indexCourse == 0) {
                int a = 13;
                for (int i = 1; i <= 6; i++) {
                  if (i <= 3) {
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 2;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.deepOrangeAccent,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 3 && i <= 6) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.deepOrangeAccent,
                        to: startTime,
                        from: endTime));
                  }
                }
              }
              if (indexCourse == 1) {
                int a = 13 + 14;

                for (int i = 1; i <= 6; i++) {
                  if (i <= 3) {
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 2;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.blue,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 3 && i <= 6) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.blue,
                        to: startTime,
                        from: endTime));
                  }
                }
              }
              if (indexCourse == 2) {
                int a = 13 + 14 + 14;

                for (int i = 1; i <= 6; i++) {
                  if (i <= 3) {
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 2;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.orange,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 3 && i <= 6) {
                    print(a);

                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.orange,
                        to: startTime,
                        from: endTime));
                  }
                }
              }
            }
            if (roomResponseModel.data[indexRoom].lichle[indexCourse].during ==
                3) {
              if (indexCourse == 0) {
                int a = 13;
                for (int i = 1; i <= 9; i++) {
                  if (i <= 3) {
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 2;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.purple,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 3 && i <= 6) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.purple,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 6 && i <= 9) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a + 1);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.purple,
                        to: startTime,
                        from: endTime));
                  }
                }
              }
              if (indexCourse == 1) {
                int a = 13 + 14;
                for (int i = 1; i <= 9; i++) {
                  if (i <= 3) {
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 2;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.green,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 3 && i <= 6) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.green,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 6 && i <= 9) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a + 1);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.green,
                        to: startTime,
                        from: endTime));
                  }
                }
              }
              if (indexCourse == 2) {
                int a = 13 + 14 + 21;
                for (int i = 1; i <= 9; i++) {
                  if (i <= 3) {
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 2;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.black,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 3 && i <= 6) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.black45,
                        to: startTime,
                        from: endTime));
                  }
                  if (i > 6 && i <= 9) {
                    a = a + 1;
                    startTime = DateTime(today.year, today.month, a + 1);
                    a = a + 1;
                    endTime = startTime.add(
                        const Duration(hours: 23, minutes: 59, seconds: 59));
                    meetings.add(Meeting(
                        eventName: roomResponseModel
                            .data[indexRoom].lichle[indexCourse].nameCourse,
                        isAllDay: true,
                        background: Colors.black87,
                        to: startTime,
                        from: endTime));
                  }
                }
              }
            }
          }
        }
      }
    }

    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  String getNotes(int index) => appointments[index].description;

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

class Meeting {
  Meeting(
      {this.eventName,
      this.from,
      this.to,
      this.background,
      this.isAllDay,
      this.description});

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  String description;
}
