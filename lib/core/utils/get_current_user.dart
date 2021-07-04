
import 'dart:convert';

import 'package:SchoolManagementSystem/core/error/exceptions.dart';
import 'package:SchoolManagementSystem/core/utils/constants.dart';
import 'package:SchoolManagementSystem/feature/sign_in/data/models/login_data.dart';
import 'package:SchoolManagementSystem/main.dart';

LoginData getCurrentUser()  {
  final loginResponse = prefs.getString(SAVE_LOGIN_RESPONSE);
  if (loginResponse != null && loginResponse != '') {
    var response = LoginData.fromJson(json.decode(loginResponse));

    return response;
  } else {
    throw CacheException();
  }
}
// ProfileData getCurrentProfile(){
//   final profileResponse=  prefs.getString(SAVE_PROFILE_RESPONSE);
//   if(profileResponse!=null&& profileResponse!="")
//   {
//     var response1=ProfileData.fromJson(json.decode(profileResponse));
//     return response1;
//   }else {
//     throw CacheException();
//   }
// }