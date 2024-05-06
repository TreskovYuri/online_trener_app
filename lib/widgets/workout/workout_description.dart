import 'dart:math';

import 'package:flutter/material.dart';

class WorkoutDescription extends StatelessWidget {
  WorkoutDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    return Padding(
      padding: EdgeInsets.all(3 * vw),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Описание",
                  style: TextStyle(
                      color: Color.fromARGB(202, 255, 255, 255),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 4 * vw),
                ),
                SizedBox(width: 10,),
                Opacity(
                  opacity: 0.7,
                  child: Transform.rotate(
                    angle: -90 * (pi / 180), // Угол поворота в радианах
                    child: Image(
                      image: AssetImage('assets/img/arrow.png'),
                      width: 3 * vw,
                      height: 3 * vw,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Opacity(opacity: 0.7,
            child:             Text(
              "Силовая тренировка — это ряд упражнений с собственным весом или отягощением. Их основной целью является увеличение силы мышц и развитие выносливости тела.",
              style: TextStyle(
                  color: Color.fromARGB(202, 255, 255, 255),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 4 * vw),
            ),
            ),
            SizedBox(height: 10,),
            Opacity(opacity: 0.7,
            child:             Text(
              "Силовая тренировка — это ряд упражнений с собственным весом или отягощением. Их основной целью является увеличение силы мышц и развитие выносливости тела.",
              style: TextStyle(
                  color: Color.fromARGB(202, 255, 255, 255),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 4 * vw),
            ),
            ),
            SizedBox(height: 10,),
            Opacity(opacity: 0.7,
            child:             Text(
              "Основная цель занятий на растяжку - гибкость, эластичность, работа с дыханием, улучшение кровотока и снятие напряжения.",
              style: TextStyle(
                  color: Color.fromARGB(202, 255, 255, 255),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 4 * vw),
            ),
            ),

          ],
        ),
      ),
    );
  }
}
