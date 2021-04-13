import 'package:flutter/material.dart';

Widget backgroundImage(String imagePath, double height) {
  return Container(
    alignment: AlignmentDirectional.center,
    height: height * .7,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(65),
        bottomRight: Radius.circular(65),
      ),
      color: Color(0xFF1FC4B8),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget borderTop({@required Widget child}) {
  return Container(
    alignment: AlignmentDirectional.bottomCenter,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
      color: Colors.white,
    ),
    child: child,
  );
}
