import 'package:flutter/material.dart';

Widget MyDescriptionText(
    {
      required String text, 
      Color color = Colors.white, 
      double size = 16
      }) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
    ),
  );
}
