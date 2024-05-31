import 'package:flutter/material.dart';

Widget MyDescriptionText(
    {
      required String text, 
      Color color = Colors.white, 
      double size = 16,
      FontWeight weigth = FontWeight.w400,
      double opacity = 1
      }) {
  return Opacity(
    opacity: opacity,
    child: Text(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weigth
      ),
    ),
  );
}
