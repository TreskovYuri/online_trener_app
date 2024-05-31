import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/models/constants/images.dart';
import 'package:trener_app/widgets/text/description.dart';

class MyInlineFillInput extends StatelessWidget {
  MyInlineFillInput({
    super.key,
    required this.controller,
    this.fontSize = 14,
    this.paddingH = 15,
    this.paddingV = 10,
    this.radius = 7,
    this.hintText = '',
    this.callback = finaldefaultCallback,
    this.labelText = '',
    this.enabled = true,
    this.fixed = false,
  });
  TextEditingController controller;
  double fontSize;
  double paddingH;
  double paddingV;
  double radius;
  String hintText;
  Function callback;
  String labelText;
  bool enabled;
  final bool fixed;

  static finaldefaultCallback() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
