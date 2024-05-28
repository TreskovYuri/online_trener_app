import 'package:flutter/material.dart';
import 'package:trener_app/widgets/text/title.dart';

class MyGradientButton extends StatelessWidget {
  const MyGradientButton(
      {super.key, required this.callback, required this.text, this.height = 10, this.fontSize =18});
  final VoidCallback callback;
  final String text;
  final double fontSize;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: const RadialGradient(radius: 5, colors: [
            Color(0xFF4D8AEE),
            Color(0xFF2932FF),
          ])),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    20), // Устанавливаем радиус круглых углов
              ),
              backgroundColor: Colors.transparent,
              foregroundColor: const Color.fromARGB(0, 0, 41, 74),
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: height,horizontal: 50)),
          onPressed: callback,
          child: MyTitleText(text: text,size: fontSize)),
    );
  }
}
