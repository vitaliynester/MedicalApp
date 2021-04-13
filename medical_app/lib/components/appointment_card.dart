import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class AppointmentCard extends StatelessWidget {
  final Color primaryCardColor;
  final String imagePath;
  final String cardTitle;
  final String cardBody;

  AppointmentCard({
    @required this.primaryCardColor,
    @required this.imagePath,
    @required this.cardTitle,
    @required this.cardBody,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 65,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor.withOpacity(.2),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
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
        children: [
          Container(
            width: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: primaryCardColor,
            ),
          ),
          SizedBox(width: 5),
          SvgPicture.asset(
            imagePath,
            color: primaryCardColor,
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * .75,
                child: Text(
                  cardTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16,
                    color: primaryCardColor,
                  ),
                ),
              ),
              Container(
                width: size.width * .75,
                child: Text(
                  cardBody,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
