import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/mobx/mobx.dart';

class CardService extends StatelessWidget {
  const CardService({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height;
    final mobx = Provider.of<Mobx>(context);
    return Container(
      // height: height*0.55,
      child: Padding(
        padding: EdgeInsets.all(5 * vw),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){Navigator.pushNamed(context,'/profile');},
                    child: Container(
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
                                    fontSize: .011 * vh),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){Navigator.pushNamed(context,'/workoutscheme');},
                    child: Container(
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
                                    fontSize: .011 * vh),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
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
                                  fontSize: .011 * vh),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                  fontSize: .011 * vh),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){Navigator.pushReplacementNamed(context,'/profile');},
                    child: Container(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Image(
                                image: const AssetImage('assets/img/card5_5.png'),
                                width: 15 * vw,
                                height: 15 * vw,
                                fit: BoxFit
                                    .cover, // Обрезать изображение в соответствии с размерами контейнера
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Консултации",
                                style: TextStyle(
                                    color: Color.fromARGB(234, 255, 255, 255),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: .011 * vh),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Image(
                              image: const AssetImage('assets/img/card6_6.png'),
                              width: 15 * vw,
                              height: 15 * vw,
                              fit: BoxFit
                                  .cover, // Обрезать изображение в соответствии с размерами контейнера
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Настройки",
                              style: TextStyle(
                                  color: Color.fromARGB(234, 255, 255, 255),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                  fontSize: .011 * vh),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container( ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
