import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trener_app/constants/colors.dart';

class MySearchInput extends StatelessWidget {
  MySearchInput({
    super.key,
    required this.controller,
    this.textColor = Colors.white,
    this.fontSize = 15,
    this.paddingH = 10,
    this.paddingV = 10,
    this.radius = 10,
    });
  TextEditingController controller;
  Color textColor;
  double fontSize;
  double paddingH;
  double paddingV;
  double radius;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      
                    cursorColor: const Color.fromARGB(255, 112, 112, 112),
                    style: TextStyle(
                        color: textColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Manrope'),
                    decoration: InputDecoration(
                      hintText: 'Найти...',
                      filled: true, // Set to true to fill the background
                      fillColor:
                          AppColors.blackThemeInputInlineBacground, // Set background color
                      hintStyle: const TextStyle(
                          color: Colors.grey), // Customize hint text color
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: paddingH, vertical: paddingV),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // Remove border
                        borderRadius: BorderRadius.circular(radius),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none, // Remove border
                        borderRadius: BorderRadius.circular(radius),
                      ),
                    ),
                  );
  }
}