
import 'package:flutter/material.dart';
import 'package:trener_app/models/constants/colors.dart';
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

  static finaldefaultCallback() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            if(labelText !='') ...[Row(children: [MyDescriptionText(text: labelText,color: AppColors.blackThemeTextOpacity1, size: 13)],),const SizedBox(height: 5,)],
            TextField(
              enabled: enabled,
              onChanged: (value) => callback(),
              cursorColor: Colors.white,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope'),
              decoration: InputDecoration(
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
