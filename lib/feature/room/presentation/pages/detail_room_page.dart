import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog1.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog2.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/core/utils/spinkit.dart';
import 'package:SchoolManagementSystem/feature/room/data/data_sources/room_remote_data_source.dart';
import 'package:SchoolManagementSystem/feature/room/data/models/room_data.dart';
import 'package:SchoolManagementSystem/feature/room/data/models/room_response_model.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/change_capacity_page.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/change_name_room_page.dart';
import 'package:flutter/material.dart';

class DetailRoomPage extends StatefulWidget {
  final RoomData data;
  static const String routeName = '/DetailRoomPage';

  const DetailRoomPage({Key key, this.data}) : super(key: key);

  @override
  _DetailRoomPageState createState() => _DetailRoomPageState();
}

class _DetailRoomPageState extends State<DetailRoomPage> {
  String name;
  bool button20 = false;
  bool button30 = false;
  bool button40 = false;
  int capacity;
  TextEditingController nameText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameText = TextEditingController(text: "${widget.data.nameRoom}");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
        body: widget.data!=null?Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: SingleChildScrollView(
            child: Container(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Detail Room",
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
                  Row(children: [
                    Text(
                      "    Room Name: ${widget.data.nameRoom}",
                      style: TextStyle(color: kPrimaryOrangeColor),
                    )
                  ]),
                  SizedBox(
                    height: size.height/64,
                  ),
                  Row(children: [
                    Text(
                      "    Capacity: ${widget.data.capacity.toString()}",
                      style: TextStyle(color: kPrimaryOrangeColor),
                    )
                  ]),
                  SizedBox(
                    height: size.height/32,
                  ),
                  Row(
                    children: [
                      Text(
                        "Edit Room",
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
                  Expanded(
                    child: Column(
                      children: [
                        _buildMenu(
                          title: "Change Room Name",
                          icon: "assets/icons/ic_launcher.png",
                          onPress: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChangeNameRoomPage(
                                          data: widget.data,
                                        )))
                            // Navigator.pushReplacementNamed(
                            //     context, PageRoutes.changeCourseNamePage)
                          },
                        ),
                        _buildMenu(
                          title: "Change Capacity",
                          icon: "assets/icons/ic_launcher.png",
                          onPress: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChangeCapacityPage(
                                          data: widget.data,
                                        )))
                            // Navigator.pushReplacementNamed(
                            //     context, PageRoutes.changeCourseNamePage)
                          },
                        ),
                        _buildMenu(
                          title: "Delete Room",
                          icon: "assets/icons/ic_launcher.png",
                          onPress: () {
                            AlertDialog2.yesAbortDialog(
                                context: context,
                                title: "Delete",
                                body:
                                    "Do you want to delete the Room ${widget.data?.nameRoom}?",
                                onPressed: () {
                                  deleteRoom(
                                      id: widget.data.sId,
                                      function: () {
                                        showSuccessDelete();
                                      },
                                      function2: () {
                                        showErrorDelete();
                                      });
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ):Center(child: SpinkitLoading(),));
  }

  Widget _buildMenu({String title, String icon, Function onPress}) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: kPrimaryOrangeColor,
        onPressed: onPress,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: size.width / 16.36363636363636,
            ),
            SizedBox(width: size.width / 18),
            Expanded(
                child: Text(
              title,
              style: TextStyle(color: Colors.white),
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: kPrimaryWhiteColor,
            ),
          ],
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
      description: "Successful room editing",
      onPressed: () {
        Navigator.pushReplacementNamed(context, PageRoutes.showRoomPage);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void showSuccessDelete() {
    var alert = new AlertDialog1(
      image: "ok",
      title: "SUCCESS",
      description: "Successfully delete Room",
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

  void showErrorDelete() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "Room deletion failed",
      onPressed: () {
        Navigator.pushReplacementNamed(context, PageRoutes.showCoursePage);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
