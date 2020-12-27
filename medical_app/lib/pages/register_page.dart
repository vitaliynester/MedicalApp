import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/bloc/user_bloc/user_bloc.dart';
import 'package:medical_app/bloc/user_bloc/user_event.dart';
import 'package:medical_app/bloc/user_bloc/user_repository.dart';
import 'package:medical_app/bloc/user_bloc/user_state.dart';
import 'package:medical_app/pages/login_page.dart';

import '../constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserBloc userBloc;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userBloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Container(
            child: BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserErrorState) {
                  showErrorWidget(state.message);
                } else if (state is UserLoadedState) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<UserBloc>(
                          context,
                        ),
                        child: BlocProvider<UserBloc>(
                          create: (_) => UserBloc(
                            repository: UserRepositoryImpl(),
                          ),
                          child: LoginPage(),
                        ),
                      ),
                    ),
                  );
                }
              },
              child: Stack(
                children: [
                  Container(
                    height: size.height * .7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(65),
                        bottomRight: Radius.circular(65),
                      ),
                      color: Color(0xFF1FC4B8),
                      image: DecorationImage(
                        image: Image.memory(bytesRegisterLogoPng).image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.memory(bytesMainLogoPng),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 270,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: mainColor,
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                )
                              ],
                              border: Border.all(
                                color: borderColor,
                              ),
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Text(
                                    "Регистрация",
                                    style: TextStyle(
                                      color: mainColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: TextField(
                                    cursorColor: mainColor,
                                    controller: firstNameController,
                                    decoration: InputDecoration(
                                      hintText: "Имя",
                                      hintStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "CircularStd-Book",
                                      ),
                                      hoverColor: mainColor,
                                      fillColor: mainColor,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: TextField(
                                    cursorColor: mainColor,
                                    controller: lastNameController,
                                    decoration: InputDecoration(
                                      hintText: "Фамилия",
                                      hintStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "CircularStd-Book",
                                      ),
                                      hoverColor: mainColor,
                                      fillColor: mainColor,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: TextField(
                                    cursorColor: mainColor,
                                    controller: phoneNumberController,
                                    decoration: InputDecoration(
                                      hintText: "Номер телефона",
                                      hintStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "CircularStd-Book",
                                      ),
                                      hoverColor: mainColor,
                                      fillColor: mainColor,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: TextField(
                                    cursorColor: mainColor,
                                    controller: loginController,
                                    decoration: InputDecoration(
                                      hintText: "Логин",
                                      hintStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "CircularStd-Book",
                                      ),
                                      hoverColor: mainColor,
                                      fillColor: mainColor,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: TextField(
                                    cursorColor: mainColor,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintText: "Электронная почта",
                                      hintStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "CircularStd-Book",
                                      ),
                                      hoverColor: mainColor,
                                      fillColor: mainColor,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: TextField(
                                    cursorColor: mainColor,
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "Пароль",
                                      hintStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "CircularStd-Book",
                                      ),
                                      hoverColor: mainColor,
                                      fillColor: mainColor,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: TextField(
                                    cursorColor: mainColor,
                                    controller: repeatPasswordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "Подтвердите пароль",
                                      hintStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "CircularStd-Book",
                                      ),
                                      hoverColor: mainColor,
                                      fillColor: mainColor,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    var data = {
                                      'login': loginController.text,
                                      'password': passwordController.text,
                                      'phone': phoneNumberController.text,
                                      'email': emailController.text,
                                      'first_name': firstNameController.text,
                                      'last_name': lastNameController.text,
                                    };
                                    userBloc.add(
                                      RegisterUserEvent(data: data),
                                    );
                                  },
                                  child: Container(
                                    width: 233,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: btnColor,
                                      border: Border.all(
                                        color: borderColor,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Зарегистрироваться",
                                        style: TextStyle(
                                          color: bntTextColor,
                                          fontSize: 20,
                                          fontFamily: "CircularStd-Book",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 30,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: backButtonColor,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: IconButton(
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: backButtonColor,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget showErrorWidget(String msg) {
    return Flushbar(
      duration: Duration(seconds: 3),
      boxShadows: [
        BoxShadow(
          color: mainColor.withOpacity(.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        )
      ],
      messageText: Padding(
        padding: const EdgeInsets.only(
          top: 2.0,
          bottom: 2.0,
          left: 40,
          right: 40,
        ),
        child: Text(
          msg,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: errorTextColor,
            fontSize: 18,
            fontFamily: 'CircularStd-Book',
          ),
        ),
      ),
      backgroundColor: Colors.white,
      borderRadius: 8,
      borderColor: borderColor.withOpacity(.4),
      padding: EdgeInsets.all(5),
      borderWidth: 2,
      margin: EdgeInsets.all(5),
    )..show(context);
  }
}
