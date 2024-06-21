import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trener_app/constants/colors.dart';
import 'package:trener_app/constants/images.dart';
import 'package:trener_app/widgets/text/description.dart';

class MyInlineFillInput extends StatelessWidget {
  MyInlineFillInput({
    super.key,
    required this.controller,
    this.fontSize = 14,
    this.paddingH = 15,
    this.marginH = 10,
    this.paddingV = 10,
    this.radius = 7,
    this.hintText = '',
    this.callback = finaldefaultCallback,
    this.labelText = '',
    this.enabled = true,
    this.fixed = false,
    this.keyWoardType = TextInputType.number,
    this.inputFormatters = 'digits',
  });
  TextEditingController controller;
  double fontSize;
  double paddingH;
  double marginH;
  double paddingV;
  double radius;
  String hintText;
  Function callback;
  String labelText;
  bool enabled;
  final bool fixed;
  TextInputType keyWoardType;
  String inputFormatters;

  static finaldefaultCallback() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.symmetric(horizontal: marginH),
        child: Column(
          children: [
            if (labelText != '') ...[
              Row(
                children: [
                  MyDescriptionText(
                      text: labelText,
                      color: AppColors.blackThemeTextOpacity1,
                      size: 13)
                ],
              ),
              const SizedBox(
                height: 5,
              )
            ],
            TextField(
              enabled: enabled,
              onChanged: (value) => callback(),
              cursorColor: Colors.white,
              keyboardType: keyWoardType,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope'),
              decoration: InputDecoration(
                suffix: fixed
                    ? SvgPicture.asset(
                        AppImages.BlueOk,
                        width: 20,
                        height: 20,
                      )
                    : const SizedBox.shrink(),
                hintText: hintText,
                filled: true, // Set to true to fill the background
                fillColor: AppColors
                    .blackThemeInputInlineBacground, // Set background color
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
              controller: controller,
            ),
          ],
        ));
  }
}
