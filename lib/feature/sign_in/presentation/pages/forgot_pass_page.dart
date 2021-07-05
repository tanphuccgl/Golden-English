import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/feature/sign_in/presentation/widgets/body_forgot_pass.dart';
import 'package:flutter/material.dart';

class ForgotPassPage extends StatefulWidget {
  static const String routeName = '/ForgotPassPage';
  const ForgotPassPage({Key key}) : super(key: key);

  @override
  _ForgotPassPageState createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryOrangeColor,
          ),
          onPressed: () {
             Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: BodyForgotPass(),
    );
  }
}
