import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/get_current_user.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/core/utils/spinkit.dart';
import 'package:SchoolManagementSystem/feature/home/presentation/pages/home_page.dart';
import 'package:SchoolManagementSystem/feature/sign_in/presentation/manager/login_bloc.dart';
import 'package:SchoolManagementSystem/feature/sign_in/presentation/manager/login_event.dart';
import 'package:SchoolManagementSystem/feature/sign_in/presentation/manager/login_state.dart';
import 'package:SchoolManagementSystem/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyLoginPage extends StatefulWidget {
  const BodyLoginPage({Key key}) : super(key: key);

  @override
  _BodyLoginPageState createState() => _BodyLoginPageState();
}

class _BodyLoginPageState extends State<BodyLoginPage> {
  String email;
  String pass;
  final emailText = TextEditingController();
  final passText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool _checkBox = true;
    bool _isVisible = true;
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is Empty) {
          isLogin();
        } else if (state is LoginAlready) {
          appUser = getCurrentUser();
          inHome();
        } else if (state is Loaded) {
          appUser = state.data;
          inHome();
        } else if (state is Loading) {
          return SpinkitLoading();
        } else if (state is Error) {
          return Stack(children: [
            Container(
              height: size.height,
              width: size.width,
              padding: EdgeInsets.only(top: 20, right: 15, left: 15),
              child: Column(
                children: [
                  SizedBox(height: size.height/16,),
                  title(title: "Sign In"),
                  _inputEmail(
                      controller: emailText,
                      onChanged: (value) {
                        clear;
                        email = value;
                      },
                      hintText: "Email Address"),
                  _inputPass(
                      controller: passText,
                      onChanged: (value) {
                        clear;
                        pass = value;
                      },
                      hintText: "Password",
                      obscureText: _isVisible),
                  _failed(),
                  _stayAndForgot(
                    value1: _checkBox,
                    onPressed: () {
                      // Navigator.pushReplacementNamed(
                      //     context, PageRoutes.forgotPassPage);
                    },
                  ),
                  _button(
                    onPressed: () {
                      if (email != null && pass != null) {
                        return login();
                      } else {
                        return clear();
                      }
                    },
                  ),
                  SizedBox(
                    height: size.height / 21.33333333333333,
                  ),
                  Container(child: Image.asset("assets/images/sign_in.png"),)
                ],
              ),
            ),
          ]);
        } else if (state is NotLogin) {
          return Stack(children: [
            Container(
              height: size.height,
              width: size.width,
              padding: EdgeInsets.only(top: 20, right: 15, left: 15),
              child: Column(
                children: [
                  SizedBox(height: size.height/16,),
                  title(title: "Sign In"),
                  _inputEmail(
                      controller: emailText,
                      onChanged: (value) {
                        clear;
                        email = value;
                      },
                      hintText: "Email Address"),
                  _inputPass(
                      controller: passText,
                      onChanged: (value) {
                        clear;
                        pass = value;
                      },
                      hintText: "Password",
                      obscureText: _isVisible),
                  _stayAndForgot(
                    value1: _checkBox,
                    onPressed: () {
                      // Navigator.pushReplacementNamed(
                      //     context, PageRoutes.forgotPassPage);
                    },
                  ),
                  _button(
                    onPressed: () {
                      if (email != null && pass != null) {
                        return login();
                      } else {
                        Scaffold.of(context).showSnackBar(new SnackBar(
                          content: Text('Please complete all information'),
                        ));
                        return clear();
                      }
                    },
                  ),
                  SizedBox(
                    height: size.height / 21.33333333333333,
                  ),
                  Container(child: Image.asset("assets/images/sign_in.png"),)

                ],
              ),
            ),
          ]);
        }
        return Container();
      },
    );
  }

  Widget title({String title}) {
    return Container(
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: kPrimaryBlackColor,
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _inputEmail(
      {TextEditingController controller, Function onChanged, String hintText}) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 40, left: 10),
      child: Row(
        children: [
          SizedBox(
            height: size.height / 10.66666666666667,
            width: size.width / 1.161290322580645,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: TextStyle(color: kPrimaryBlackColor),
              maxLines: 1,
              obscureText: false,
              // keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: (hintText),
                hintStyle: TextStyle(
                    color: kPrimaryGrayColor, fontWeight: FontWeight.w500),
                border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25)),
              ),
              textInputAction: TextInputAction.done,
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputPass(
      {TextEditingController controller,
      Function onChanged,
      String hintText,
      bool obscureText}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 20, left: 10),
      child: Row(
        children: [
          SizedBox(
            height: size.height / 10.66666666666667,
            width: size.width / 1.161290322580645,
            child: StatefulBuilder(
              builder: (context, setState) {
                return TextField(
                  controller: controller,
                  onChanged: onChanged,
                  style: TextStyle(color: kPrimaryBlackColor),
                  maxLines: 1,
                  obscureText: obscureText,
                  // keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          child: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kPrimaryOrangeColor,
                          ),
                          onTap: () => {
                            setState(() {
                              obscureText = !obscureText;
                            })
                          },
                        )),
                    contentPadding: EdgeInsets.all(20),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: (hintText),
                    hintStyle: TextStyle(
                        color: kPrimaryGrayColor, fontWeight: FontWeight.w500),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  textInputAction: TextInputAction.done,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _stayAndForgot({bool value1, Function onPressed}) {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                StatefulBuilder(
                  builder: (context, setState) => Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    checkColor: Colors.white,
                    activeColor: kPrimaryOrangeColor,
                    value: value1,
                    onChanged: (value) {
                      setState(() {
                        value1 = value;
                      });
                    },
                  ),
                ),
                Container(
                  child: Text(
                    "Stay Logged In",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                "",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _button({Function onPressed}) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        height: size.height / 12.8,
        width: size.width / 1.161290322580645,
        decoration: BoxDecoration(
            color: kPrimaryOrangeColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(25.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: kPrimaryOrangeColor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(1, 4),
              ),
            ]),
        child: RaisedButton(
          elevation: 0,
          onPressed: onPressed,
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Netflix",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: 0.0,
            ),
          ),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: kPrimaryOrangeColor, width: 2),
              borderRadius: BorderRadius.circular(20)),
          color: kPrimaryOrangeColor,
        ),
      ),
    );
  }

  Widget _failed() {
    return Container(
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Login failed. Email or password does not match!",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ))
        ],
      ),
    );
  }

  void inHome() {
    Future.delayed(Duration.zero, () async {
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomePage()),
      //       (Route<dynamic> route) => false,
      // );
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      //  Navigator.pushReplacementNamed(context,PageRoutes.homePage);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (Route<dynamic> route) => false,
      );
    });
  }

  void login() {
    BlocProvider.of<LoginBloc>(context).add(LoginE(email, pass));
  }

  void isLogin() {
    BlocProvider.of<LoginBloc>(context).add(IsLogin());
  }

  void clear() {
    BlocProvider.of<LoginBloc>(context).add(ClearE());
  }
}
