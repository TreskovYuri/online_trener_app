import 'package:flutter/material.dart';
import 'package:trener_app/utills/sklonatel.dart';

// Текст с фоном градиентом закругленный
class MyCounter extends StatelessWidget {
  MyCounter({super.key, required this.width,required this.height,required this.size, required this.count});
  double width;
  double height;
  double size;
  int count;

  @override
  Widget build(BuildContext context) {
    return Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: const RadialGradient(
                      colors: [
                        Color.fromARGB(198, 77, 139, 238),
                        Color(0xff2932FF)
                      ], // Цвета для радиального градиента
                      radius: 3, // Радиус градиента (от 0 до 1)
                      center: Alignment.center, // Центр радиального градиента
                    ),
                    borderRadius: BorderRadius.circular(100)),
                child: Text(
                  Sklonatel(number: count, stage1: 'упражнение', stage2: 'упражнения', stage3: 'упражнений'),
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      fontSize: size),
                ));
  }
}