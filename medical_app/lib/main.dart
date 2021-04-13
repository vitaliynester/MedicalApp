import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/bloc/user_bloc/user_bloc.dart';
import 'package:medical_app/bloc/user_bloc/user_event.dart';
import 'package:medical_app/bloc/user_bloc/user_repository.dart';
import 'package:medical_app/bloc/user_bloc/user_state.dart';
import 'package:medical_app/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/login_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
        ),
      ),
      home: BlocProvider(
        create: (context) => UserBloc(
          repository: UserRepositoryImpl(),
        ),
        child: MyApp(),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserBloc userBloc;
  bool showLoginPage = true;
  @override
  void initState() {
    super.initState();
    userBloc = BlocProvider.of<UserBloc>(context);
    _getUserDataLocaly();
  }

  _getUserDataLocaly() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var login = prefs.getString('login');
    var password = prefs.getString('password');
    if (login == null || password == null) {
      setState(() {
        showLoginPage = true;
      });
    } else {
      showLoginPage = false;
      userBloc.add(
        LoginUserEvent(
          login: login,
          password: password,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return showLoginPage
              ? LoginPage()
              : Container(
                  child: widgetFromState(state),
                );
        },
      ),
    );
  }

  Widget widgetFromState(UserState state) {
    if (state is UserInitialState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is UserLoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is UserLoadedState) {
      return MainPage(
        user: state.user,
      );
    } else if (state is UserErrorState) {
      return Center(
        child: Text(state.message),
      );
    }
  }
}
