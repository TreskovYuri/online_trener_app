import 'package:flutter/material.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/widgets/buttons/gradient_button.dart';
import 'package:trener_app/widgets/buttons/disable_button.dart';
import 'package:trener_app/widgets/headers/header_type1.dart';
import 'package:trener_app/widgets/headers/header_type2.dart';
import 'package:trener_app/widgets/headers/header_type3.dart';

class MyModalWind extends StatelessWidget {
  MyModalWind({
    super.key,
    required this.height,
    required this.widget,
    this.headerType = 1,
    required this.title,
    this.button = false,
    this.ButtonCallback = _defaultButtonCallback,
    this.buttonText = 'Далее',
    this.nextActionText = '',
    this.prevButtonColor = Colors.white,
    this.nextActionColor = Colors.white,
    this.prevActionCallback = _defaultButtonCallback,
    this.nextActionCallback = _defaultButtonCallback,
    this.buttonEnabled = true,
  });

  int height;
  Widget widget;
  int headerType;
  String title;
  bool button;
  final VoidCallback ButtonCallback;
  String buttonText;
  String nextActionText;
  Color prevButtonColor;
  Color nextActionColor;
  VoidCallback prevActionCallback;
  VoidCallback nextActionCallback;
  final bool buttonEnabled;

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
              topStart: Radius.circular(20), topEnd: Radius.circular(20))),
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
                    height: height * .15 * vh,
                  ),
                  widget,
                  if (button)
                    const SizedBox(
                      height: 100,
                    )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _Header(
              prevActionCallback: prevActionCallback,
              title: title,
              type: headerType,
              vh: vh,
              nextActionText: nextActionText,
              prevButtonColor: prevButtonColor,
              nextActionColor: nextActionColor,
              nextActionCallback: nextActionCallback,
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
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          if (button)
            Positioned(
                bottom: 50,
                left: 10,
                right: 10,
                child: buttonEnabled
                    ? MyGradientButton(
                        callback: ButtonCallback, text: buttonText)
                    : MyDisableButton(
                        callback: ButtonCallback, text: buttonText))
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  _Header({
    super.key,
    required this.title,
    required this.type,
    required this.vh,
    required this.nextActionText,
    required this.prevButtonColor,
    required this.nextActionColor,
    required this.prevActionCallback,
    required this.nextActionCallback,
  });
  final String title;
  final int type;
  final double vh;
  final String nextActionText;
  final Color prevButtonColor;
  final Color nextActionColor;
  final VoidCallback prevActionCallback;
  final VoidCallback nextActionCallback;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 1:
        return MyHeaderType1(
          title: title,
          vh: vh,
        );
      case 2:
        return MyHeaderType2(
          title: title,
          vh: vh,
        );
      case 3:
        return MyHeaderType3(
          prevActionCallback: prevActionCallback,
          title: title,
          vh: vh,
          nextActionText: nextActionText,
          closeActionColor: prevButtonColor,
          nextActionColor: nextActionColor,
          nextActionCallback: nextActionCallback,
        );
      default:
        return MyHeaderType1(
          title: title,
          vh: vh,
        );
    }
  }
}
