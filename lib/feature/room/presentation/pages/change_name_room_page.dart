import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog1.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/room/data/data_sources/room_remote_data_source.dart';
import 'package:SchoolManagementSystem/feature/room/data/models/room_data.dart';
import 'package:flutter/material.dart';

class ChangeNameRoomPage extends StatefulWidget {
  final RoomData data;
  static const String routeName = '/ChangeNameRoomPage';

  const ChangeNameRoomPage({Key key, this.data}) : super(key: key);

  @override
  _ChangeNameRoomPageState createState() => _ChangeNameRoomPageState();
}

class _ChangeNameRoomPageState extends State<ChangeNameRoomPage> {
  String name;

  TextEditingController nameText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameText = TextEditingController(text: "${widget.data.nameRoom}");
    name = widget.data.nameRoom;
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Change Name Room",
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
                              if (name != null) {
                                putNameRoom(
                                    idRoom: widget.data.sId,
                                    nameRoom: name,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void showCancel() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "Same room name",
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
      description: "Successful room name change",
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
