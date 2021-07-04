import 'package:SchoolManagementSystem/core/api/api_room.dart';
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/home/presentation/pages/home_page.dart';
import 'package:SchoolManagementSystem/feature/room/data/models/room_response_model.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/component/listview_settings_room.dart';
import 'package:flutter/material.dart';

class RoomPage extends StatefulWidget {

  static const String routeName = '/RoomPage';


  const RoomPage({Key key}) : super(key: key);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {

  Future<bool> onWillPop() async {
   Navigator.pop(context);
 //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    return Future.value(true);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(onWillPop: onWillPop,

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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

            },
          ),
        ),
        body: Padding(padding: EdgeInsets.only(left: 25,right: 25),child:
          Column(children: [
            Row(
              children: [
                Text(
                  "Room",
                  style: TextStyle(
                      color: kPrimaryWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: size.height/64,
            ),
            Expanded(child: ListViewSettingRoom()),
          ],),),

      ),
    );
  }
}
