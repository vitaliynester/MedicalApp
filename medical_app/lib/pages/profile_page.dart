import 'package:flutter/material.dart';
import 'package:medical_app/components/profile_bio.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      color: Colors.white,
      height: size.height * .6,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/profile_pacient_user.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ProfileBio(
              titleBio: "ФИО:",
              contentBio: "Васильков Василий Альбертович",
            ),
            SizedBox(height: 20),
            ProfileBio(
              titleBio: "Номер телефона:",
              contentBio: "+7 (123) 456 78 90",
            ),
            SizedBox(height: 20),
            ProfileBio(
              titleBio: "Электронная почта:",
              contentBio: "pacient@example.com",
            ),
            SizedBox(height: 20),
            ProfileBio(
              titleBio: "Пароль:",
              contentBio: "********",
            ),
            SizedBox(height: 20),
            ProfileBio(
              titleBio: "Флюорография:",
              contentBio: "Действительна до 16.10.2021",
            ),
            SizedBox(height: 20),
            Text(
              "Филиал по умолчанию",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF747474).withOpacity(.5),
              ),
            ),
            DropdownButton(
              value: _value,
              items: [
                DropdownMenuItem(
                  child: Text(
                    "Семейный доктор",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF088B81),
                    ),
                  ),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text(
                    "Панацея",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF088B81),
                    ),
                  ),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text(
                    "INVITRO",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF088B81),
                    ),
                  ),
                  value: 3,
                ),
                DropdownMenuItem(
                  child: Text(
                    "Азбука здоровья",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF088B81),
                    ),
                  ),
                  value: 4,
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
