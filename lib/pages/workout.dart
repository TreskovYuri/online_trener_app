import 'package:flutter/material.dart';
import 'package:trener_app/widgets/workout/workout_description.dart';
import 'package:trener_app/widgets/workout/wourkout_nuskle_group.dart';

class Workout extends StatelessWidget {
  const Workout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width / 100;
    final topMargin = screenHeight * 0.38; // 40% от высоты экрана

    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 23, 23, 23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image(
                  image: AssetImage('assets/img/workout.png'),
                  width: MediaQuery.of(context)
                      .size
                      .width, // Устанавливаем ширину изображения равной ширине экрана
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: Container( // Цвет подложки текста
                    padding: EdgeInsets.symmetric(
                        vertical: 8, horizontal: 16), // Отступы текста от краев
                    child: Text(
                      "Силовой тренинг",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 7 * vw,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                 Positioned(
              bottom: 10,
                  left: 0,
                  right: 0,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(164, 53, 53, 53),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0), // Скругление углов
                      ),
                    ),
                    child: Text(
                      "Стул",
                      style: TextStyle(
                        color: const Color.fromARGB(178, 255, 255, 255),
                        fontSize: 3 * vw,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(164, 53, 53, 53),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0), // Скругление углов
                      ),
                    ),
                    child: Text(
                      "Роллер",
                      style: TextStyle(
                        color: const Color.fromARGB(178, 255, 255, 255),
                        fontSize: 3 * vw,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(164, 53, 53, 53),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0), // Скругление углов
                      ),
                    ),
                    child: Text(
                      "Стена",
                      style: TextStyle(
                        color: const Color.fromARGB(178, 255, 255, 255),
                        fontSize: 3 * vw,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
              ],
            ),
           
            Padding(
              padding: EdgeInsets.all(3 * vw),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(139, 40, 40, 40), // Цвет фона
                    borderRadius:
                        BorderRadius.circular(10.0), // Скругление углов
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3 * vw),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Image(
                              image: const AssetImage('assets/img/card1.png'),
                              width: 15 * vw,
                              height: 15 * vw,
                              fit: BoxFit
                                  .cover, // Обрезать изображение в соответствии с размерами контейнера
                            ),
                          ),
                        ),
                        Container(
                          width: 55 * vw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Махи ногами",
                                style: TextStyle(
                                    color: const Color.fromARGB(202, 255, 255, 255),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 4 * vw),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                "2х10/15",
                                style: TextStyle(
                                    color: const Color.fromARGB(132, 255, 255, 255),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 3 * vw),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5 * vw,
                        ),
                        Opacity(
                          opacity: 0.7,
                          child: Image(
                            image: const AssetImage('assets/img/arrow.png'),
                            width: 5 * vw,
                            height: 5 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(3 * vw),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(139, 40, 40, 40), // Цвет фона
                    borderRadius:
                        BorderRadius.circular(10.0), // Скругление углов
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3 * vw),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Image(
                              image: const AssetImage('assets/img/card2.png'),
                              width: 15 * vw,
                              height: 15 * vw,
                              fit: BoxFit
                                  .cover, // Обрезать изображение в соответствии с размерами контейнера
                            ),
                          ),
                        ),
                        // SizedBox(width: 5*vw,),
                        Container(
                          width: 55 * vw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Жим лежа",
                                style: TextStyle(
                                    color: const Color.fromARGB(202, 255, 255, 255),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 4 * vw),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                "2х15 • 20-25 кг",
                                style: TextStyle(
                                    color: const Color.fromARGB(132, 255, 255, 255),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 3 * vw),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5 * vw,
                        ),
                        Opacity(
                          opacity: 0.7,
                          child: Image(
                            image: const AssetImage('assets/img/arrow.png'),
                            width: 5 * vw,
                            height: 5 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(3 * vw),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(139, 40, 40, 40), // Цвет фона
                    borderRadius:
                        BorderRadius.circular(10.0), // Скругление углов
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3 * vw),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Image(
                              image: const AssetImage('assets/img/card3.png'),
                              width: 15 * vw,
                              height: 15 * vw,
                              fit: BoxFit
                                  .cover, // Обрезать изображение в соответствии с размерами контейнера
                            ),
                          ),
                        ),
                        Container(
                          width: 55 * vw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Скручивание на пресс",
                                style: TextStyle(
                                    color:const Color.fromARGB(202, 255, 255, 255),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 4 * vw),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                "3х00:60",
                                style: TextStyle(
                                    color: const Color.fromARGB(132, 255, 255, 255),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 3 * vw),
                              ),
                            ],
                          ),
                        ),
                        Opacity(
                          opacity: 0.7,
                          child: Image(
                            image: const AssetImage('assets/img/arrow.png'),
                            width: 5 * vw,
                            height: 5 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(3 * vw),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(139, 40, 40, 40), // Цвет фона
                    borderRadius:
                        BorderRadius.circular(10.0), // Скругление углов
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3 * vw),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Image(
                              image: const AssetImage('assets/img/card4.png'),
                              width: 15 * vw,
                              height: 15 * vw,
                              fit: BoxFit
                                  .cover, // Обрезать изображение в соответствии с размерами контейнера
                            ),
                          ),
                        ),
                        Container(
                          width: 55 * vw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Выпады с гантелями",
                                style: TextStyle(
                                    color: const Color.fromARGB(202, 255, 255, 255),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 4 * vw),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                "4х15 • 80+ кг • 2 мин отдых",
                                style: TextStyle(
                                    color: const Color.fromARGB(132, 255, 255, 255),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 3 * vw),
                              ),
                            ],
                          ),
                        ),
                        Opacity(
                          opacity: 0.7,
                          child: Image(
                            image: const AssetImage('assets/img/arrow.png'),
                            width: 5 * vw,
                            height: 5 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            WorkoutDescription(),
            const WorkoutMuskleGroup()
          ],
        ),
      ),
    );
  }
}
