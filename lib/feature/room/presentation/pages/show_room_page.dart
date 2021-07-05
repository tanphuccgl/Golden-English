import 'package:SchoolManagementSystem/core/api/api_room.dart';
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog1.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog2.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/core/utils/spinkit.dart';
import 'package:SchoolManagementSystem/feature/room/data/data_sources/room_remote_data_source.dart';
import 'package:SchoolManagementSystem/feature/room/data/models/room_response_model.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/detail_room_page.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/room_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowRoomPage extends StatefulWidget {
  static const String routeName = '/ShowRoomPage';

  const ShowRoomPage({
    Key key,
  }) : super(key: key);

  @override
  _ShowRoomPageState createState() => _ShowRoomPageState();
}

class _ShowRoomPageState extends State<ShowRoomPage> {
  RoomResponseModel roomResponseModel;

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

  Future<bool> onWillPop() async {
    Navigator.pop(context);
    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>RoomPage()));
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return roomResponseModel != null
        ? WillPopScope(
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RoomPage()));
                  },
                ),
              ),
              body: Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 25, right: 25),
                  child: Container(
                    height: size.height,
                    width: size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Show Room",
                              style: TextStyle(
                                  color: kPrimaryWhiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height/32,
                        ),
                        Expanded(
                          child: GridView.count(
                              childAspectRatio: 1.0,
                              crossAxisCount: 2,
                              crossAxisSpacing: 18,
                              mainAxisSpacing: 18,
                              children: roomResponseModel.data.map((data) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailRoomPage(
                                                  data: data,
                                                )));
                                  },
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: null,
                                        child: Container(
                                          height: size.height,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              color: kPrimaryOrange2Color,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              // Image.asset(
                                              //   data.img,
                                              //   width: 42,
                                              // ),
                                              SizedBox(
                                                height: size.height/45.71428571428571,
                                              ),
                                              Container(
                                                width: size.width/3.6,
                                                child: Center(
                                                  child: Text(
                                                      data?.nameRoom ?? "",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: true,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height/80,
                                              ),
                                              Text(
                                                  "Capacity: " +
                                                      data.capacity.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              SizedBox(
                                                height: size.height/45.71428571428571,
                                              ),
                                              // Text(data.event,
                                              //     style: TextStyle(
                                              //         color: Colors.white70,
                                              //         fontSize: 11,
                                              //         fontWeight: FontWeight.w600)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      data.lichchan.length != 0 ||
                                          data.lichle.length != 0
                                          ?  Positioned(
                                          right: -10,
                                          top: -10,
                                          child: IconButton(
                                              icon: CircleAvatar(
                                                backgroundColor:
                                                Colors.deepOrangeAccent,
                                                child: Icon(
                                                  Icons.work_outline,
                                                  size: 20,
                                                  color: kPrimaryWhiteColor,
                                                ),
                                              ),
                                            )):  Positioned(
                                          right: -10,
                                          top: -10,
                                          child: IconButton(
                                              icon: CircleAvatar(
                                                backgroundColor:
                                                    Colors.deepOrangeAccent,
                                                child: Icon(
                                                  Icons.work_off_outlined,
                                                  size: 20,
                                                  color: kPrimaryWhiteColor,
                                                ),
                                              ),
                                             )),
                                    ],
                                  ),
                                );
                              }).toList()),
                        ),
                      ],
                    ),
                  )),
            ),
          )
        : Scaffold(
            backgroundColor: kPrimaryOrangeColor,
            body: Center(
              child: SpinkitLoading(),
            ),
          );
  }

  void showSuccess() {
    var alert = new AlertDialog1(
      image: "ok",
      title: "SUCCESS",
      description: "Successfully delete room",
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

  void showError() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "Room deletion failed",
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
}
