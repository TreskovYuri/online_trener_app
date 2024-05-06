import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trener_app/pages/chats.dart';

class WorkoutMuskleGroup extends StatelessWidget {
  const WorkoutMuskleGroup({super.key});

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
                  "Группы мышц",
                  style: TextStyle(
                      color: Color.fromARGB(202, 255, 255, 255),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 4 * vw),
                ),
                const SizedBox(
                  width: 10,
                ),
                Opacity(
                  opacity: 0.7,
                  child: Transform.rotate(
                    angle: -90 * (pi / 180), // Угол поворота в радианах
                    child: Image(
                      image: const AssetImage('assets/img/arrow.png'),
                      width: 3 * vw,
                      height: 3 * vw,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Image(
              image: AssetImage('assets/img/workout_muskle_group.png'),
              width: double.infinity,
              fit: BoxFit
                  .cover, // Обрезать изображение в соответствии с размерами контейнера
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Chats()));
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(80 * vw, 10 * vw),
                  padding: EdgeInsets.only(top: 4 * vw, bottom: 4 * vw)),
              child: Text(
                'Заполнить',
                style: TextStyle(
                    color: const Color.fromARGB(202, 255, 255, 255),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    fontSize: 4 * vw),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
