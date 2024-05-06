import 'package:flutter/material.dart';

class CardService extends StatelessWidget {
  const CardService({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.55,
      child: Padding(
        padding: EdgeInsets.all(5 * vw),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image(
                            image: const AssetImage('assets/img/card1_1.png'),
                            width: 15 * vw,
                            height: 15 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Профиль",
                            style: TextStyle(
                                color: Color.fromARGB(234, 255, 255, 255),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                                fontSize: 3 * vw),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image(
                            image: const AssetImage('assets/img/card2_2.png'),
                            width: 15 * vw,
                            height: 15 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Тренировки",
                            style: TextStyle(
                                color: Color.fromARGB(234, 255, 255, 255),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                                fontSize: 3 * vw),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image(
                            image: const AssetImage('assets/img/card3_3.png'),
                            width: 15 * vw,
                            height: 15 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Питание",
                            style: TextStyle(
                                color: Color.fromARGB(234, 255, 255, 255),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                                fontSize: 3 * vw),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image(
                            image: const AssetImage('assets/img/card4_4.png'),
                            width: 15 * vw,
                            height: 15 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Нутриенты",
                            style: TextStyle(
                                color: Color.fromARGB(234, 255, 255, 255),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                                fontSize: 3 * vw),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image(
                            image: const AssetImage('assets/img/card1_1.png'),
                            width: 15 * vw,
                            height: 15 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Профиль",
                            style: TextStyle(
                                color: Color.fromARGB(234, 255, 255, 255),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                                fontSize: 3 * vw),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: 9*vw,),
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image(
                            image: const AssetImage('assets/img/card2_2.png'),
                            width: 15 * vw,
                            height: 15 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Тренировки",
                            style: TextStyle(
                                color: Color.fromARGB(234, 255, 255, 255),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                                fontSize: 3 * vw),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
