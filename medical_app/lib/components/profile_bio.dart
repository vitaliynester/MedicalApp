import 'package:flutter/material.dart';

class ProfileBio extends StatelessWidget {
  final String titleBio;
  final String contentBio;

  ProfileBio({
    @required this.titleBio,
    @required this.contentBio,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleBio,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF747474).withOpacity(.5),
          ),
        ),
        Text(
          contentBio,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF088B81),
          ),
        ),
      ],
    );
  }
}
