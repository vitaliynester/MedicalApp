import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:medical_app/models/user_model.dart';

abstract class UserState extends Equatable {}

class UserInitialState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final UserModel user;

  UserLoadedState({@required this.user});

  @override
  List<Object> get props => [user];
}

class UserErrorState extends UserState {
  final String message;

  UserErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
