import 'package:flutter/material.dart';
import 'package:medical_app/components/message_card.dart';

class MessagingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      color: Colors.white,
      height: size.height * .6,
      child: Column(
        children: [
          TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              focusColor: Colors.grey,
              hoverColor: Colors.grey,
              fillColor: Colors.grey,
              suffixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
              hintText: 'Поиск...',
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MessageCard(
                    imgPath: "assets/images/profile_med_user.jpg",
                    userName: "Иванов И.И.",
                    qualification: "Терапевт",
                    messageContent: "Здравствуйте. Следующая запись на 18:30",
                    notReaded: false,
                    countNotReadedMessages: 0,
                  ),
                  SizedBox(height: 15),
                  MessageCard(
                    imgPath: "assets/images/profile_med_user.jpg",
                    userName: "Иванов И.И.",
                    qualification: "Терапевт",
                    messageContent: "Здравствуйте. Следующая запись на 18:30",
                    notReaded: true,
                    countNotReadedMessages: 13,
                  ),
                  SizedBox(height: 15),
                  MessageCard(
                    imgPath: "assets/images/profile_med_user.jpg",
                    userName: "Иванов И.И.",
                    qualification: "Терапевт",
                    messageContent: "Здравствуйте. Следующая запись на 18:30",
                    notReaded: true,
                    countNotReadedMessages: 2,
                  ),
                  SizedBox(height: 15),
                  MessageCard(
                    imgPath: "assets/images/profile_med_user.jpg",
                    userName: "Иванов И.И.",
                    qualification: "Терапевт",
                    messageContent: "Здравствуйте. Следующая запись на 18:30",
                    notReaded: false,
                    countNotReadedMessages: 0,
                  ),
                  SizedBox(height: 15),
                  MessageCard(
                    imgPath: "assets/images/profile_med_user.jpg",
                    userName: "Иванов И.И.",
                    qualification: "Терапевт",
                    messageContent: "Здравствуйте. Следующая запись на 18:30",
                    notReaded: false,
                    countNotReadedMessages: 0,
                  ),
                  SizedBox(height: 15),
                  MessageCard(
                    imgPath: "assets/images/profile_med_user.jpg",
                    userName: "Иванов И.И.",
                    qualification: "Терапевт",
                    messageContent: "Здравствуйте. Следующая запись на 18:30",
                    notReaded: false,
                    countNotReadedMessages: 0,
                  ),
                  SizedBox(height: 15),
                  MessageCard(
                    imgPath: "assets/images/profile_med_user.jpg",
                    userName: "Иванов И.И.",
                    qualification: "Терапевт",
                    messageContent: "Здравствуйте. Следующая запись на 18:30",
                    notReaded: false,
                    countNotReadedMessages: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
