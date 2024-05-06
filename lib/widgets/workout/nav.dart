import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  Nav({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(5*vw),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            
            Image(
              image: const AssetImage('assets/img/arrow_blue.png'),
              width: 5 * vw,
              height: 5 * vw,
              fit: BoxFit
                  .cover, // Обрезать изображение в соответствии с размерами контейнера
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                children: [Text(
                  "Схема тренировок",
                  style: TextStyle(
                      color: Color.fromARGB(223, 236, 236, 236),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 5 * vw),
                ),
                Text(
                  "01.03.2024 - 07.03.2024",
                  style: TextStyle(
                      color: Color.fromARGB(148, 255, 255, 255),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 3 * vw),
                ),
          ]),
            ),
          ],
        ),
      ),
    );
  }
}
