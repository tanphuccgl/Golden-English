import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog1.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/room/data/data_sources/room_remote_data_source.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/room_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddRoomPage extends StatefulWidget {
  static const String routeName = '/AddRoomPage';

  const AddRoomPage({Key key}) : super(key: key);

  @override
  _AddRoomPageState createState() => _AddRoomPageState();
}

class _AddRoomPageState extends State<AddRoomPage> {
  TextEditingController nameText = TextEditingController();
  String name;
  bool button20 = false;
  bool button30 = false;
  bool button40 = false;
  int capacity;

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Add Room",
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
                  TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    maxLength: 40,
                    controller: nameText,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 3, left: 10),
                        labelText: "  " + "Room Name",
                        labelStyle: TextStyle(color: kPrimaryOrangeColor),
                        //  errorText: "Please enter room name",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryOrangeColor)),
                        // hintText: info,
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                    height: size.height/64,
                  ),
                  Row(children: [
                    Text(
                      "    Capacity",
                      style: TextStyle(color: kPrimaryOrangeColor),
                    )
                  ]),
                  SizedBox(
                    height: size.height/64,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      button20
                          ? RaisedButton(
                              onPressed: () {
                                setState(() {
                                  button20 = false;
                                  if (button20 == true) {
                                    button30 = false;
                                    button40 = false;
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
                                  button20 = true;
                                  if (button20 == true) {
                                    button30 = false;
                                    button40 = false;
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
                      button30
                          ? RaisedButton(
                              onPressed: () {
                                setState(() {
                                  button30 = false;
                                  if (button30 == true) {
                                    button20 = false;
                                    button40 = false;
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
                                  button30 = true;
                                  if (button30 == true) {
                                    button20 = false;
                                    button40 = false;
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
                      button40
                          ? RaisedButton(
                              onPressed: () {
                                setState(() {
                                  button40 = false;
                                  if (button40 == true) {
                                    button20 = false;
                                    button30 = false;
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
                                  button40 = true;
                                  if (button40 == true) {
                                    button20 = false;
                                    button30 = false;
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
                           // Navigator.of(context).pop(false);
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
                                  if (name != null &&
                                      (button20 == true ||
                                          button30 == true ||
                                          button40 == true)) {
                                    print(button20);
                                    print(button30);
                                    print(button40);
                                    print("teen " + name);
                                    print("sl " + capacity.toString());
                                    print(button40);
                                    if (button20) {
                                      capacity = 20;
                                    } else if (button30) {
                                      capacity = 30;
                                    } else if (button40) {
                                      capacity = 40;
                                    }
                                    addRoom(
                                        nameRoom: name,
                                        capacity: capacity,
                                        function: () {
                                          showSuccess();
                                        },
                                        function2: () {
                                          showCancel1();
                                        },
                                        function3: () {
                                          showCancel2();
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
                  )
                ],
              ),
            ),
          )),
    );
  }

  void showCancel1() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "This room already exists",
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

  void showCancel2() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "Add room failed",
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

  Future<bool> onWillPop() async {
    Navigator.pop(context);
    // final shouldPop = await showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: Text('Are you sure?'),
    //     content: Text('Do you want to leave without saving?'),
    //     actions: <Widget>[
    //       FlatButton(
    //         onPressed: () => Navigator.of(context).pop(false),
    //         child: Text('No'),
    //       ),
    //       FlatButton(
    //         onPressed: () => Navigator.of(context).pop(true),
    //         child: Text('Yes'),
    //       ),
    //     ],
    //   ),
    // );
    //
    // return shouldPop ?? false;
  }
  void showSuccess() {
    var alert = new AlertDialog1(
      image: "ok",
      title: "SUCCESS",
      description: "Successfully added room",
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.popAndPushNamed(context,PageRoutes.roomPage);


      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
