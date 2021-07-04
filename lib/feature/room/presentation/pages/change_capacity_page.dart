import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog1.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/course/data/models/course_data.dart';
import 'package:SchoolManagementSystem/feature/room/data/data_sources/room_remote_data_source.dart';
import 'package:SchoolManagementSystem/feature/room/data/models/room_data.dart';
import 'package:flutter/material.dart';

class ChangeCapacityPage extends StatefulWidget {
  final RoomData data;

  static const String routeName = '/ChangeCapacityPage';

  const ChangeCapacityPage({Key key, this.data}) : super(key: key);

  @override
  _ChangeCapacityPageState createState() => _ChangeCapacityPageState();
}

class _ChangeCapacityPageState extends State<ChangeCapacityPage> {
  bool capacity2 = false;
  bool capacity3 = false;
  bool capacity4 = false;
  int capacity;

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryOrangeColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Change Capacity",
                    style: TextStyle(
                        color: kPrimaryOrangeColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              ),
              SizedBox(
                height: size.height/32,
              ),
              Row(
                children: [
                  Text(
                    widget.data.capacity == 20
                        ? "    Current capacity: 20"
                        : widget.data.capacity == 30
                            ? "    Current capacity: 30"
                            : "    Current capacity: 40",
                    style: TextStyle(color: kPrimaryOrangeColor),
                  )
                ],
              ),
              SizedBox(
                height: size.height/64,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  capacity2
                      ? RaisedButton(
                          onPressed: () {
                            setState(() {
                              capacity2 = false;
                              if (capacity2 == true) {
                                capacity3 = false;
                                capacity4 = false;
                              }
                            });
                          },
                          color: kPrimaryOrangeColor,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "20",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        )
                      : RaisedButton(
                          onPressed: () {
                            setState(() {
                              capacity2 = true;
                              if (capacity2 == true) {
                                capacity3 = false;
                                capacity4 = false;
                              }
                            });
                          },
                          color: kPrimaryWhiteColor,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "20",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: kPrimaryOrangeColor),
                          ),
                        ),
                  capacity3
                      ? RaisedButton(
                          onPressed: () {
                            setState(() {
                              capacity3 = false;
                              if (capacity3 == true) {
                                capacity2 = false;
                                capacity4 = false;
                              }
                            });
                          },
                          color: kPrimaryOrangeColor,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "30",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        )
                      : RaisedButton(
                          onPressed: () {
                            setState(() {
                              capacity3 = true;
                              if (capacity3 == true) {
                                capacity2 = false;
                                capacity4 = false;
                              }
                            });
                          },
                          color: kPrimaryWhiteColor,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "30",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: kPrimaryOrangeColor),
                          ),
                        ),
                  capacity4
                      ? RaisedButton(
                          onPressed: () {
                            setState(() {
                              capacity4 = false;
                              if (capacity4 == true) {
                                capacity2 = false;
                                capacity3 = false;
                              }
                            });
                          },
                          color: kPrimaryOrangeColor,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "40",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        )
                      : RaisedButton(
                          onPressed: () {
                            setState(() {
                              capacity4 = true;
                              if (capacity4 == true) {
                                capacity2 = false;
                                capacity3 = false;
                              }
                            });
                          },
                          color: kPrimaryWhiteColor,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "40",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: kPrimaryOrangeColor),
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: size.height/42.66666666666667,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    color: kPrimaryOrangeColor,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                  Builder(
                      builder: (ctx) => RaisedButton(
                            onPressed: () {
                              if (capacity2 == true ||
                                  capacity3 == true ||
                                  capacity4 == true) {
                                if (capacity2) {
                                  capacity = 20;
                                } else if (capacity3) {
                                  capacity = 30;
                                } else if (capacity4) {
                                  capacity = 40;
                                }
                                putCapacityRoom(
                                    idRoom: widget.data.sId,
                                    capacity: capacity,
                                    function: () {
                                      showSuccess();
                                    },
                                    function2: () {
                                      showCancel();
                                    });
                              } else {
                                Scaffold.of(ctx).showSnackBar(new SnackBar(
                                  content:
                                      Text('Please complete all information'),
                                ));
                              }
                            },
                            color: kPrimaryOrangeColor,
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Accept",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.white),
                            ),
                          ))
                ],
              ),
            ],
          )),
    );
  }

  void showCancel() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "Capacity change failed",
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

  void showSuccess() {
    var alert = new AlertDialog1(
      image: "ok",
      title: "SUCCESS",
      description: "Successful capacity change",
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, PageRoutes.showRoomPage);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
