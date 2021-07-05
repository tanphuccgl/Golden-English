import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/feature/home/presentation/component/grid_dashboard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/HomePage';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    Future<bool> onWillPop() async {
      Navigator.pop(context);
      return Future.value(true);
    }
    return Scaffold(
      backgroundColor: kPrimaryOrangeColor,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: size.height/16,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16,bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("GOLDEN ENGLISH",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: size.height/160,
                    ),
                    Text("Home",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ],
                ),

              ],
            ),
          ),
          SizedBox(
            height: size.height/64,
          ),
          GridViewDashboard()
        ],
      ),
    );
  }
}
