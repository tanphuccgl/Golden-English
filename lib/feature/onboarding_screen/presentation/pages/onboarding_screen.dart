import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/sign_in/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/OnBoardingScreen';

  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  Future<bool> onWillPop() async {
    Navigator.pop(context);
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: size.height / 1.163636363636364, //550
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      pageViewOnboarding(
                          title1: "SAVE TIME",
                          context: context,
                          title2:
                              "Create a quick, easy, no-frills class schedule that saves time but still ensures an optimal class schedule",
                          image: "assets/images/on1.png"),
                      pageViewOnboarding(
                          title1: "SIMPLE, EASY TO USE",
                          context: context,
                          title2:
                              "Easily manage classes(courses, lesson, lectures) by searching  for and adding classes entered by other users",
                          image: "assets/images/on2.png"),
                      pageViewOnboarding(
                          title1: "SECURITY",
                          context: context,
                          title2:
                              "Avoid being attacked by hackers, Thorough account security, Support to find your account when you forget your password",
                          image: "assets/images/on3.png"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1 ? _continuePage() : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? bottomSheetOnboarding(context)
          : Text(''),
    );
  }

  Widget _indicator(bool isActive) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: size.height / 80,
      //8.0,
      width: size.width / 45,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryGrayColor : kPrimaryOrangeColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _continuePage() {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomRight,
        child: FlatButton(
          onPressed: () {
            _pageController.nextPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Next',
                style: TextStyle(
                  color: kPrimaryOrangeColor,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(width: size.width / 36),
              Icon(
                Icons.arrow_forward,
                color: kPrimaryOrangeColor,
                size: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pageViewOnboarding(
      {String title1, String title2, String image, BuildContext context}) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            child: Center(
              child: Text(
                title1,
                style: TextStyle(
                    color: kPrimaryOrangeColor,
                    fontFamily: 'CM Sans Serif',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700

                    // height: 1.5,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            padding: EdgeInsets.only(top: 30),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Center(
              child: Text(
                title2,
                style: TextStyle(
                  color: kPrimaryOrangeColor,
                  fontSize: 11.0,
                  //  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Image.asset(
              image,
              width: size.width / 1.2,
              height: size.height / 2.133333333333333,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheetOnboarding(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 6.4,
      width: double.infinity,
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
         Navigator.pushReplacementNamed(context, PageRoutes.signIn);
        },
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: Text(
              'Get started',
              style: TextStyle(
                color: kPrimaryOrangeColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
