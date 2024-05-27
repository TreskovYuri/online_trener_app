
import 'package:flutter/material.dart';

Widget MyTitleText ({ required String text,Color color = Colors.white, double size = 25}){
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
    ),
  );
}
