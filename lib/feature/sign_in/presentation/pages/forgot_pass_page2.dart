import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/feature/sign_in/presentation/pages/sign_in_page.dart';
import 'package:SchoolManagementSystem/feature/sign_in/presentation/widgets/body_forgot_pass2.dart';
import 'package:flutter/material.dart';

class ForgotPassPage2 extends StatefulWidget {
  static const String routeName = '/ForgotPassPage2';
  final String email;

  const ForgotPassPage2({Key key,this.email}) : super(key: key);

  @override
  _ForgotPassPage2State createState() => _ForgotPassPage2State();
}

class _ForgotPassPage2State extends State<ForgotPassPage2> {
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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage()));
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: BodyForgotPass2(email: widget.email,),
    );
  }
}