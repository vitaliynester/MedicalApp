import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final String imgPath;
  final String userName;
  final String qualification;
  final String messageContent;
  final bool notReaded;
  final int countNotReadedMessages;

  MessageCard({
    @required this.imgPath,
    @required this.userName,
    @required this.qualification,
    @required this.messageContent,
    @required this.notReaded,
    @required this.countNotReadedMessages,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: notReaded ? Color(0xFF088B81).withOpacity(.2) : Colors.white,
        border: Border.all(
          color: Color(0xFF088B81),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white24.withOpacity(.2),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: notReaded ? size.width * .44 : size.width * .55,
                    child: Text(
                      userName,
                      style: TextStyle(
                        color: Color(0xFF088B81),
                      ),
                    ),
                  ),
                  Text(
                    qualification,
                    style: TextStyle(
                      color: Color(0xFF088B81),
                    ),
                  ),
                ],
              ),
              Container(
                width: notReaded ? size.width * .59 : size.width * .7,
                child: Text(
                  messageContent,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          ),
          SizedBox(width: 5),
          drawNotReadedMessageWidget(),
        ],
      ),
    );
  }

  Widget drawNotReadedMessageWidget() {
    return notReaded
        ? ClipRRect(
            borderRadius: BorderRadius.circular(360),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xFF088B81),
              ),
              child: Center(
                child: Text(
                  countNotReadedMessages.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}
