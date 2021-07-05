import 'dart:developer';

import 'package:SchoolManagementSystem/core/api/api_room.dart';
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/spinkit.dart';
import 'package:SchoolManagementSystem/feature/home/presentation/pages/home_page.dart';
import 'package:SchoolManagementSystem/feature/room/data/models/room_data.dart';
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
                  Column(
                    children: [
                      Container(
                        height: size.width*1.5,width: size.width,
                        child: SfCalendar(
                          view: CalendarView.month,
                   //       onTap: calendarTapped,
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
                                MonthAppointmentDisplayMode.appointment,
                            appointmentDisplayCount: 6,
                          ),
                        ),
                      ),
                    ],
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

  void calendarTapped(CalendarTouchDetails details) {
    print(details.targetElement);


//     Meeting appointment = details.appointments.addAll(getAppointments());
//     print(appointment);
//   appointment=getAppointments();
//     print(appointment[1]);
//       final Meeting appointmentDetails =
//           getAppointments()[ details.appointments.];
// print( details.date.day);
//       _subjectText = appointmentDetails.eventName;
//       // _dateText = DateFormat('MMMM dd, yyyy')
//       //     .format(appointmentDetails.startTime)
//       //     .toString();
//       _startTimeText =
//           DateFormat('hh:mm a').format(appointmentDetails.from).toString();
//       _endTimeText =
//           DateFormat('hh:mm a').format(appointmentDetails.to).toString();
//       if (appointmentDetails.isAllDay) {
//         _timeDetails = 'All day';
//       } else {
//         _timeDetails = '$_startTimeText - $_endTimeText';
//       }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(child: new Text('$_subjectText')),
            content: Container(
              height: 80,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        details.appointments.length.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(''),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(_timeDetails,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15)),
                    ],
                  )
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text('close'))
            ],
          );
        });
  }

  List<Meeting> getAppointments() {
    List<Meeting> meetings = <Meeting>[];
    DateTime today = DateTime.utc(2021, 7, 12);
    DateTime startTime = DateTime(today.year, today.month, today.day);
    DateTime endTime =
        startTime.add(const Duration(hours: 23, minutes: 59, seconds: 59));


    for (int idroom = 0; idroom < roomResponseModel.data.length; idroom++) {
      // for duyet room
      if (roomResponseModel.data[idroom].lichchan.length != 0) {
        var i = 1;
        int tong = 0;
        for (int lc = 0;
            lc < roomResponseModel.data[idroom].lichchan.length;
            lc++) {
          // duyet tung phan tu trong array lich chan
          for (int date = i;
              date <
                  (abc(tong, lc, idroom) * 7) +
                      (roomResponseModel.data[idroom].lichchan[lc].during * 7);
              date++) {
            // log(abc(tong, lc, idroom).toString());
            int c = 11;
            c = c + date;


            i = abc(tong, lc + 1, idroom) * 7;

            startTime = DateTime(today.year, today.month, c);
//log(c.toString());
            DateTime endTime = startTime
                .add(const Duration(hours: 23, minutes: 59, seconds: 59));

            if ((startTime.weekday == DateTime.monday) ||
                (startTime.weekday == DateTime.wednesday) ||
                (startTime.weekday == DateTime.friday)) {
           //   log("bang "+c.toString());
              if(roomResponseModel.data[idroom].lichchan[lc].nameCourse!=null)

                {
                  meetings.add(Meeting(
                      eventName:
                      " ${roomResponseModel.data[idroom].nameRoom} | ${roomResponseModel.data[idroom].lichchan[lc].nameCourse}",
                      isAllDay: true,
                      background: Colors.deepOrangeAccent,
                      to: startTime,
                      from: endTime));
                }


              // if (roomResponseModel.data[idroom].lichchan[lc]
              //     .nameCourse !== undefined) {
              //   temp.push(item);
              // }
            }
          }
        }
      }
      if (roomResponseModel.data[idroom].lichle.length != 0) {
        var i = 1;
        int tong = 0;
        for (int lc = 0;
        lc < roomResponseModel.data[idroom].lichle.length;
        lc++) {
          // duyet tung phan tu trong array lich chan
          for (int date = i;
          date <
              (abc1(tong, lc, idroom) * 7) +
                  (roomResponseModel.data[idroom].lichle[lc].during * 7);
          date++) {
            // log(abc(tong, lc, idroom).toString());
            int c = 11;
            c = c + date;


            i = abc1(tong, lc + 1, idroom) * 7;

            startTime = DateTime(today.year, today.month, c);
//log(c.toString());
            DateTime endTime = startTime
                .add(const Duration(hours: 23, minutes: 59, seconds: 59));

            if ((startTime.weekday == DateTime.tuesday) ||
                (startTime.weekday == DateTime.thursday) ||
                (startTime.weekday == DateTime.saturday)) {
              //   log("bang "+c.toString());
              if(roomResponseModel.data[idroom].lichle[lc].nameCourse!=null)
                {
                  meetings.add(Meeting(
                      eventName:
                      " ${roomResponseModel.data[idroom].nameRoom} | ${roomResponseModel.data[idroom].lichle[lc].nameCourse}",
                      isAllDay: true,
                      background: Colors.deepOrangeAccent,
                      to: startTime,
                      from: endTime));

                }


              // if (roomResponseModel.data[idroom].lichchan[lc]
              //     .nameCourse !== undefined) {
              //   temp.push(item);
              // }
            }
          }
        }
      }


    }

    return meetings;
  }

  int abc(int tong, int lc, int a) {
    roomResponseModel.data[a].lichchan.sublist(0, lc).forEach((element) {
      tong = tong + element.during;
    });
    return tong;
  }
  int abc1(int tong, int lc, int a) {
    roomResponseModel.data[a].lichle.sublist(0, lc).forEach((element) {
      tong = tong + element.during;
    });
    return tong;
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
