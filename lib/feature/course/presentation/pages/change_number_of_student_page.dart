import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/core/utils/custom_dialog/alert_dialog1.dart';
import 'package:SchoolManagementSystem/core/utils/page_router.dart';
import 'package:SchoolManagementSystem/feature/course/data/data_sources/course_remote_data_source.dart';
import 'package:SchoolManagementSystem/feature/course/data/models/course_data.dart';
import 'package:flutter/material.dart';

class ChangeNumberOfStudentPage extends StatefulWidget {
  final CourseData data;

  static const String routeName = '/ChangeNumberOfStudentPage';

  const ChangeNumberOfStudentPage({Key key, this.data}) : super(key: key);

  @override
  _ChangeNumberOfStudentPageState createState() =>
      _ChangeNumberOfStudentPageState();
}

class _ChangeNumberOfStudentPageState extends State<ChangeNumberOfStudentPage> {
  TextEditingController numberText;

  int number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numberText = TextEditingController(text: "${widget.data.amount}");
    number = widget.data.amount;
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryOrangeColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Change Number of Student",
                  style: TextStyle(
                      color: kPrimaryOrangeColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: size.height/32,
            ),
            TextField(
              onChanged: (value) {
                number = int.parse(value);
              },
              textAlign: TextAlign.start,
              maxLines: 1,
              maxLength: 2,
              controller: numberText,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3, left: 10),
                  labelText: "  " + "Number of Student",     hintText: "From 15 to 40 students",
                  labelStyle: TextStyle(color: kPrimaryOrangeColor),
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.red)),
                  //  errorText: "Please enter Course name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryOrangeColor)),
                  // hintText: info,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  )),
            ),
            SizedBox(
              height: size.height/64,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: kPrimaryOrangeColor,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                  ),
                ),
                Builder(
                    builder: (ctx) => RaisedButton(
                          onPressed: () {
                            if (number != null&& number<=40&& number>=15) {
                              putNumberofStudent(
                                  id: widget.data.sId,
                                  amount: number,
                                  function: () {
                                    showSuccess();
                                  },
                                  function2: () {
                                    showCancel();
                                  });
                            }else if(number>40||number<15)
                              {
                                Scaffold.of(ctx).showSnackBar(new SnackBar(
                                  content:
                                  Text( 'The number of registered students is only from 15 to 40'),
                                ));
                              }


                            else {
                              Scaffold.of(ctx).showSnackBar(new SnackBar(
                                content:
                                    Text('Please complete all information'),
                              ));
                            }
                          },
                          color: kPrimaryOrangeColor,
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Accept",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        ))
              ],
            )
          ],
        ),
      ),
    );
  }

  void showCancel() {
    var alert = new AlertDialog1(
      image: "cancel",
      title: "FAILED",
      description: "Change the number of failed students",
      onPressed: () {
        Navigator.pop(context);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void showSuccess() {
    var alert = new AlertDialog1(
      image: "ok",
      title: "SUCCESS",
      description: "Edit the number of successful students",
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, PageRoutes.showCoursePage);
      },
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
