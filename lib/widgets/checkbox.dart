import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trener_app/constants/colors.dart';
import 'package:trener_app/constants/images.dart';

class MyCheckBox extends StatelessWidget {
  MyCheckBox({
    super.key,
    required this.isChecked,
    this.size = 25,
    this.bacground = AppColors.blackThemeBacground,
    this.radius = 100,
    });
  final bool isChecked;
  final double size;
  final Color bacground;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bacground,
        borderRadius: BorderRadius.circular(radius)
      ),
      child: isChecked?SvgPicture.asset(
        AppImages.BlueOk,
        fit: BoxFit.fill,
        ):const SizedBox.shrink(),
    );
  }
}