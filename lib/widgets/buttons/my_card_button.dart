import 'package:flutter/material.dart';

// Конока карточки упражнений,тестов и шаблонов

class MyCardButton extends StatelessWidget {
  MyCardButton({super.key, required this.callback, required this.widget});
  Function callback;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          foregroundColor: const Color.fromARGB(255, 8, 32, 42),
          surfaceTintColor: Colors.transparent,
          backgroundColor: const Color(0xff23252B),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8.0), // Указываем радиус скругления углов
          ),
        ),
        onPressed:()=> callback(),
         child: widget
         ),
    );
  }
}


