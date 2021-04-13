import 'package:flutter/material.dart';

import '../utils/helpers.dart';
import 'appointment_page.dart';
import 'home_page.dart';
import 'messaging_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        fixedColor: Color.fromRGBO(41, 110, 107, 1),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work),
            label: 'Запись',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Сообщения',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Настройки',
          )
        ],
      ),
      body: Stack(
        children: [
          backgroundImage(
            "assets/images/home_page_background.png",
            MediaQuery.of(context).size.height,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 110,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  width: size.width * .7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Здравствуйте,",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Василий Альбертович",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/icon_image.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 240),
            child: borderTop(
              child: pages[currentIndex],
            ),
          ),
        ],
      ),
    );
  }

  final List<Widget> pages = [
    HomePage(),
    AppointmentPage(),
    MessagingPage(),
    ProfilePage(),
  ];
}
