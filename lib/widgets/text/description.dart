import 'package:flutter/material.dart';

Widget MyDescriptionText(
    {
      required String text, 
      Color color = Colors.white, 
      double size = 16,
      FontWeight weigth = FontWeight.w400
      }) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weigth
    ),
  );
}
