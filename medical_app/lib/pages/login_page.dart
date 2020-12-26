import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/pages/register_page.dart';

import '../constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
                image: Image.memory(bytesMedicalWorker).image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
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
                  height: 370,
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
                          "Вход",
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
                          top: 10,
                        ),
                        child: TextField(
                          cursorColor: mainColor,
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
                          top: 10,
                        ),
                        child: TextField(
                          cursorColor: mainColor,
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
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Flushbar(
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
                                "Неверный логин или пароль",
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
                              "Войти",
                              style: TextStyle(
                                color: bntTextColor,
                                fontSize: 24,
                                fontFamily: "CircularStd-Book",
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Text(
                          "Забыли логин или пароль?",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "Ещё нет аккаунта?",
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Зарегистрируйтесь",
                              style: TextStyle(
                                color: secondaryTextColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
