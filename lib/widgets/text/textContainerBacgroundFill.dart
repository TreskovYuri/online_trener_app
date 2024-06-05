

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/widgets/text/description.dart';

class MyTextContainerBacgroundFill extends StatelessWidget {
  MyTextContainerBacgroundFill({
    super.key,
    required this.text,
    this.color = AppColors.blackThemeInputInlineBacground,
    this.textColor = Colors.white,
    this.radius = 10,
    this.aligment = Alignment.center,
    this.padding = 10,
    this.marginHorizontal =2,
    this.marginVertical =5,
    this.flag = false,
    });
  String text;
  Color color;
  double radius;
  Alignment aligment;
  double padding;
  double marginVertical;
  double marginHorizontal;
  Color textColor;
  bool flag;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal,vertical: marginVertical),
      padding: flag?const EdgeInsets.all(1):EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: const RadialGradient(radius: 5, colors: [
            Color.fromARGB(132, 77, 139, 238),
            Color.fromARGB(118, 41, 52, 255),
          ]),
          borderRadius: BorderRadius.circular(radius)
      ),
      child: Container(
        
        alignment: aligment,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius)
        ),
        child: MyDescriptionText(text: text,color: textColor),
      ),
    );
  }
}