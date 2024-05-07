import 'package:flutter/material.dart';
import 'package:trener_app/pages/profile.dart';


class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    // final mobx = Provider.of<Mobx>(context);
    // final vh = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2*vw),
      decoration: BoxDecoration(
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [IconButton(
                  onPressed: () async {
                    // GetExerciseBelongForSportsmans(mobx);// Set userExercises after GetExercise() completes
                  },
                  icon: Icon(
                      color: Colors.white30,
                      size: 7 * vw,
                      Icons
                          .grading_sharp), // Иконка, которая будет отображаться на кнопке
                ),
              SizedBox(
                height: 1*vw,
              ),
              Text(
                "План",
                style: TextStyle(
                    color: Colors.white54,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    fontSize: 2.7 * vw),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  IconButton(
                    
                    onPressed: () {
                      // Ваш обработчик нажатия кнопки
                    },
                    icon: Icon(
                        color: Colors.white30,
                        size: 7 * vw,
                        Icons
                            .add_task_sharp), // Иконка, которая будет отображаться на кнопке
                  ),
                  SizedBox(
                    height: 1*vw,
                  ),
      
                  Text(
                    "Прогресс",
                    style: TextStyle(
                        color: Colors.white54,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 2.7 * vw),
                  ),
                ],
              )
            ],
          ),
          Container(
            child: Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      child: Image(
                        image: const AssetImage('assets/img/nav_plus.png'),
                        width: 15 * vw,
                        height: 15 * vw,
                        fit: BoxFit
                            .cover, // Обрезать изображение в соответствии с размерами контейнера
                      ),
                    ),
                    SizedBox(
                      height: 1*vw,
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
                    IconButton(
                      onPressed: () {
                        // Ваш обработчик нажатия кнопки
                      },
                      icon: Icon(
                          color: Colors.white30,
                          size: 7 * vw,
                          Icons
                              .chat), // Иконка, которая будет отображаться на кнопке
                    ),
                    SizedBox(
                      height: 1*vw,
                    ),
      
                    Text(
                      "Чат",
                      style: TextStyle(
                          color: Colors.white54,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          fontSize: 2.7 * vw),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      // Ваш обработчик нажатия кнопки
                    },
                    icon: Icon(
                        color: Colors.white30,
                        size: 7 * vw,
                        Icons
                            .medical_services_outlined), // Иконка, которая будет отображаться на кнопке
                  ),
                  SizedBox(
                    height: 1*vw,
                  ),
                  Text(
                    "Сервисы",
                    style: TextStyle(
                        color: Colors.white54,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 2.7 * vw),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
