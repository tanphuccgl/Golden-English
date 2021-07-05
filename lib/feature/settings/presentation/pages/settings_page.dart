import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog2.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/home/presentation/pages/home_page.dart';
import 'package:SchoolManagementSystem/feature/room/presentation/pages/room_page.dart';
import 'package:SchoolManagementSystem/feature/settings/presentation/pages/change_pw_page.dart';
import 'package:SchoolManagementSystem/main.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = '/SettingsPage';

  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<bool> onWillPop() async {
      Navigator.pop(context);
      //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      return Future.value(true);
    }

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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ),
        body: Column(children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  "Settings",
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
          Expanded(child: Column(
            children: [
              _buildMenu(
                title: "Change The Password",
                onPress: () => {
                Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChangePwPage()))
                },
              ),
              _buildMenu(
                title: "Log Out",
                onPress: () =>{
                AlertDialog2.yesAbortDialog(
                context: context,
                title: "EXIT",
                body: "Do you want to sign out?",onPressed: (){
                logout();
                Navigator.pushNamedAndRemoveUntil(context, PageRoutes.signIn,(Route<dynamic> route) => false);
                })
                },
              ),
            ],
          ))
        ],),

      ),
    );
  }
  void logout() {
    prefs.setString(SAVE_LOGIN_RESPONSE, '');
  }
  Widget _buildMenu({String title, String icon, Function onPress}) {
    Size size= MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: kPrimaryOrange2Color,
        onPressed: onPress,
        child: Row(
          children: [
            // Image.asset(
            //   icon,
            //   width: size.width/16.36363636363636,
            // ),
            SizedBox(width: size.width/18),
            Expanded(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black),
                )),
            Icon(
              Icons.arrow_forward_ios,
              color:  Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
