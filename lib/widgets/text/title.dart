
import 'package:flutter/material.dart';

Widget MyTitleText ({ required String text,Color color = Colors.white, double size = 25}){
  return Text(
    
    maxLines: 150,
    overflow: TextOverflow.clip,
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: size,
    ),
  );
}
