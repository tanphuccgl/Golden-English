
import 'package:SchoolManagementSystem/feature/sign_in/data/models/login_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends LoginState{}
class Loading  extends LoginState{}
class Loaded extends LoginState{
  final LoginData data;
  Loaded({this.data});

  @override
  // TODO: implement props
  List<Object> get props => [data];
}
class Error extends LoginState{
  final String message;
  Error({this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
class LoginAlready extends LoginState{}
class NotLogin extends LoginState{}
