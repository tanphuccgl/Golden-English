import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/injection_container.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/onboarding_screen/presentation/pages/onboarding_screen.dart';
import 'package:SchoolManagementSystem/feature/sign_in/presentation/manager/login_bloc.dart';
import 'package:SchoolManagementSystem/feature/sign_in/presentation/pages/body_login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = '/SignInPage';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  BlocProvider<LoginBloc> buildBody(BuildContext context) {
    return BlocProvider(create: (_) => sl<LoginBloc>(), child: SingleChildScrollView(child: BodyLoginPage()));
  }
// Future<bool> onWillPop() async {
//   Navigator.pushAndRemoveUntil(
//     context,
//     MaterialPageRoute(builder: (context) => OnBoardingScreen()),
//         (Route<dynamic> route) => false,
//   );
//
//
//   return Future.value(true);
// //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
// }

}
