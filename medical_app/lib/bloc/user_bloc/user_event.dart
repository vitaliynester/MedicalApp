import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class UserEvent extends Equatable {}

class LoginUserEvent extends UserEvent {
  String login;
  String password;

  LoginUserEvent({
    @required this.login,
    @required this.password,
  });

  @override
  List<Object> get props => null;
}

class RegisterUserEvent extends UserEvent {
  Map<String, dynamic> data;

  RegisterUserEvent({@required this.data});

  @override
  List<Object> get props => null;
}
