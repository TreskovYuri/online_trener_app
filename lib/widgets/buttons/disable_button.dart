import 'package:flutter/material.dart';
import 'package:trener_app/widgets/text/title.dart';

class MyDisableButton extends StatelessWidget {
  const MyDisableButton(
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
          color: Colors.transparent
          ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Colors.white30
                ),
                borderRadius: BorderRadius.circular(
                    20), // Устанавливаем радиус круглых углов
              ),
              backgroundColor: Colors.transparent,
              foregroundColor: Color.fromARGB(0, 51, 51, 51),
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: height,horizontal: 50)),
          onPressed: callback,
          child: MyTitleText(text: text,size: fontSize,color: Colors.white30)),
    );
  }
}
