import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/bloc/user_bloc/user_event.dart';
import 'package:medical_app/bloc/user_bloc/user_repository.dart';
import 'package:medical_app/bloc/user_bloc/user_state.dart';
import 'package:medical_app/models/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository repository;

  UserBloc({@required this.repository}) : super(UserInitialState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoginUserEvent) {
      yield UserLoadingState();
      try {
        UserModel user = await repository.loginUser(
          event.login,
          event.password,
        );
        yield UserLoadedState(user: user);
      } catch (e) {
        yield UserErrorState(message: e.toString());
      }
    } else if (event is RegisterUserEvent) {
      yield UserLoadingState();
      try {
        UserModel user = await repository.registerUser(event.data);
        yield UserLoadedState(user: user);
      } catch (e) {
        yield UserErrorState(
            message: e.toString().substring(0, min(70, e.toString().length)));
      }
    }
  }
}
