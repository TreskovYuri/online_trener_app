import 'package:flutter/material.dart';

Widget BlueTextButton({required String text, double size = 20, required Function callback}) {
  return TextButton(
      onPressed: ()=>callback(),
      child: Text(
        text,
        style:  TextStyle(
          color: const Color(0xff4D8AEE),
          fontSize: size
          ),
      ));
}
