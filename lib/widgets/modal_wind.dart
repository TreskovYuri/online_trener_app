import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/widgets/buttons/gradient_button.dart';
import 'package:trener_app/widgets/text/title.dart';



class MyModalWind extends StatelessWidget {
  MyModalWind(
      {super.key,
      required this.height,
      required this.widget,
      this.headerType = 1,
      required this.title,
      this.button=false,
      this.ButtonCallback = _defaultButtonCallback,
      this.buttonText ='Далее'
      });
  int height;
  Widget widget;
  int headerType;
  String title;
  bool button;
  final VoidCallback ButtonCallback;
  String buttonText;

  static void _defaultButtonCallback() {}

  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height / 100;
    return Container(
      height: height * vh,
      width: double.infinity,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
          color: AppColors.blackThemeModalBacground,
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(10), topEnd: Radius.circular(10))),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: height * vh,
              child: ListView(
                children: [
                  SizedBox(
                    height: height*.15 * vh,
                  ),
                  widget,
                  if(button)const SizedBox(height: 100,)
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _Header(
              title: title,
              type: headerType,
              vh: vh,
            ),
          ),
          Positioned(
            top: 0,
            right: 160,
            left: 160,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: .5 * vh,
              decoration: BoxDecoration(
                  color: AppColors.blackThemeTextOpacity,
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
          if(button)Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: MyGradientButton(callback: ButtonCallback, text: buttonText))
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  _Header(
      {super.key, required this.title, required this.type, required this.vh});
  final String title;
  final int type;
  final double vh;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 1:
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(228, 27, 28, 32),
          ),
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.only(top: 10),
          height: 9 * vh,
          width: double.infinity,
          alignment: Alignment.center,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: MyTitleText(text: title, size: 22),
          ),
        );
      default:
        return MyTitleText(text: title, size: 22);
    }
  }
}
