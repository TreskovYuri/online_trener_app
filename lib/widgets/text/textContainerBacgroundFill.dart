

import 'package:flutter/widgets.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/widgets/text/description.dart';

class MyTextContainerBacgroundFill extends StatelessWidget {
  MyTextContainerBacgroundFill({
    super.key,
    required this.text,
    this.color = AppColors.blackThemeInputInlineBacground,
    this.radius = 10,
    this.aligment = Alignment.center,
    this.padding = 10,
    this.marginHorizontal =2,
    this.marginVertical =5,
    });
  String text;
  Color color;
  double radius;
  Alignment aligment;
  double padding;
  double marginVertical;
  double marginHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal,vertical: marginVertical),
      alignment: aligment,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius)
      ),
      child: MyDescriptionText(text: text),
    );
  }
}