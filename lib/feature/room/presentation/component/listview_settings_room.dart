import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/room/data/models/room_response_model.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/add_room_page.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/search_room_page.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/show_room_page.dart';
import 'package:flutter/material.dart';

class ItemsRoom {
  String title;
  String subtitle;
  String event;
  String img;
  Function function;

  ItemsRoom({this.title, this.subtitle, this.event, this.img, this.function});
}

class ListViewSettingRoom extends StatefulWidget {

  const ListViewSettingRoom({Key key})
      : super(key: key);

  @override
  _ListViewSettingRoomState createState() => _ListViewSettingRoomState();
}

class _ListViewSettingRoomState extends State<ListViewSettingRoom> {
  @override
  Widget build(BuildContext context) {
    ItemsRoom item1 = new ItemsRoom(
        title: "Show Room",
        subtitle: "March, Wednesday",
        event: "${""} Classes",
        img: "assets/icons/showroom.png",
        function: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowRoomPage()));

        });

    ItemsRoom item2 = new ItemsRoom(
      title: "Add Room",
      subtitle: "Bocali, Apple",
      event: "4 Items",
      img: "assets/icons/add.png",function: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddRoomPage()));

    },
    );

    ItemsRoom item3 = new ItemsRoom(
      title: "Search",
      subtitle: "Lucy Mao going to Office",
      event: "",
      img: "assets/icons/search.png",function: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchRoomPage()));

    }
    );

    ItemsRoom item4 = new ItemsRoom(
      title: "Activity",
      subtitle: "Rose favirited your Post",
      event: "",
      img: "assets/logos/ic_launcher.png",
    );

    ItemsRoom item5 = new ItemsRoom(
      title: "To do",
      subtitle: "Homework, Design",
      event: "4 Items",
      img: "assets/logos/ic_launcher.png",
    );

    ItemsRoom item6 = new ItemsRoom(
      title: "Settings",
      subtitle: "",
      event: "2 Items",
      img: "assets/logos/ic_launcher.png",
    );
    List<ItemsRoom> myList = [item1, item2, item3, item4, item5, item6];
Size size= MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5),
          child: GestureDetector(
            onTap: myList[index].function,
            child: Container(
              decoration: BoxDecoration(
                  color: kPrimaryOrange2Color,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    myList[index].img,
                    width: size.width/8.571428571428571,
                  ),
                  SizedBox(
                    height: size.height/128,
                  ),
                  Text(myList[index].title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: size.height/80,
                  ),
                  Text(myList[index].subtitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: size.height/45.71428571428571,
                  ),
                  Text(myList[index].event,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        );
      },
      padding: EdgeInsets.only(top: 20, bottom: 20),
      itemCount: myList.length,
    );
  }
}
