import 'package:flutter/cupertino.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/widgets/text/description.dart';

class MyCircleDefaulUserIcon extends StatelessWidget {
  MyCircleDefaulUserIcon({
    super.key,
    required this.name,
    this.width = 35,
    this.height = 35,
    this.radius = 6,
    this.bacground = AppColors.blackThemeBacground
    });
  String name;
  double width;
  double height;
  double radius;
  Color bacground;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bacground,
        borderRadius: BorderRadius.circular(radius)
      ),
      child: MyDescriptionText(text: name.length>0? name.split('')[0]:'?', size: width/2),
    );
  }
}