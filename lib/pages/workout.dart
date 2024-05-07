import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/widgets/workout/workout_description.dart';
import 'package:trener_app/widgets/workout/wourkout_nuskle_group.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  bool descriptionModalFlag = false;
  bool muscleGroupModalFlag = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    final topMargin = screenHeight * 0.38; // 40% от высоты экрана
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final List<String> list = arguments['stage'];
    final mobx = Provider.of<Mobx>(context);

    return Container(
      color: Color(0xff1B1C20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 50 * vh,
                  child: Image.network(
                    arguments['img'],
                    height: 50 *
                        vh, // Устанавливаем ширину изображения равной ширине экрана
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 7 * vh,
                  left: 5 * vw,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(35, 94, 94, 94),
                        borderRadius: BorderRadius.circular(10 * vw)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                          Icons.arrow_back_ios_new_rounded), // Иконка
                      iconSize: 5 * vw,
                      color: Color.fromARGB(202, 255, 255, 255),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: Container(
                    // Цвет подложки текста
                    padding: EdgeInsets.symmetric(
                        vertical: 8, horizontal: 16), // Отступы текста от краев
                    child: Text(
                      arguments['name'],
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
                      children: list
                          .map(
                            (e) => Row(
                              children: [
                                SizedBox(
                                  width: 2 * vw,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(164, 53, 53, 53),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20.0), // Скругление углов
                                    ),
                                  ),
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                          178, 255, 255, 255),
                                      fontSize: 3 * vw,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList()),
                ),
              ],
            ),
            SizedBox(
              height: 2 * vh,
            ),
            Column(
              children: mobx
                  .exercisesOnTrainingId(arguments['id'])
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: ((context) => ExerciseModal(map: e)));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(3 * vw),
                        child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(
                                  139, 40, 40, 40), // Цвет фона
                              borderRadius: BorderRadius.circular(
                                  10.0), // Скругление углов
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3 * vw),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Container(
                                      width: 15 * vw,
                                      height: 15 * vw,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Image.network(
                                        '${dotenv.env['STATIC_URL']}/${e['img']}',
                                        height: 15 * vw,
                                        fit: BoxFit
                                            .cover, // Обрезать изображение в соответствии с размерами контейнера
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 55 * vw,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e['nameRu'],
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  202, 255, 255, 255),
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.w600,
                                              decoration: TextDecoration.none,
                                              fontSize: 4 * vw),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          e['prevSets'],
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  132, 255, 255, 255),
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
                                      image: const AssetImage(
                                          'assets/img/arrow.png'),
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
                    ),
                  )
                  .toList(),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  descriptionModalFlag = !descriptionModalFlag;
                });
              },
              child: Padding(
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
                          SizedBox(
                            width: 10,
                          ),
                          Opacity(
                            opacity: 0.7,
                            child: Transform.rotate(
                                angle: -90 *
                                    (pi / 180), // Угол поворота в радианах
                                child: descriptionModalFlag
                                    ? Icon(Icons.arrow_forward_ios_rounded,
                                        color: Colors.white, size: 5 * vw)
                                    : Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.white,
                                        size: 5 * vw,
                                      )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1*vw,
                      ),
                      descriptionModalFlag
                          ? Opacity(
                              opacity: 0.7,
                              child: Text(
                                arguments['description'],
                                style: TextStyle(
                                    color: Color.fromARGB(202, 255, 255, 255),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 4 * vw),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  muscleGroupModalFlag = !muscleGroupModalFlag;
                });
              },
              child: Padding(
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
                          SizedBox(
                            width: 10,
                          ),
                          Opacity(
                            opacity: 0.7,
                            child: Transform.rotate(
                                angle: -90 *
                                    (pi / 180), // Угол поворота в радианах
                                child: descriptionModalFlag
                                    ? Icon(Icons.arrow_forward_ios_rounded,
                                        color: Colors.white, size: 5 * vw)
                                    : Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.white,
                                        size: 5 * vw,
                                      )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      muscleGroupModalFlag
                          ?Image.asset('assets/img/workout_muskle_group.png')
                          : Container(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}









// Модальное окно
class ExerciseModal extends StatefulWidget {
  final Map map;

  const ExerciseModal({Key? key, required this.map}) : super(key: key);

  @override
  State<ExerciseModal> createState() => _ExerciseModalState();
}

class _ExerciseModalState extends State<ExerciseModal> {
  late String VIDEO_URL;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    VIDEO_URL = widget.map['link'];
    final VideoID = YoutubePlayer.convertUrlToId(VIDEO_URL);
    _controller = YoutubePlayerController(
        initialVideoId: VideoID!,
        flags: YoutubePlayerFlags(
          controlsVisibleAtStart: true,
          autoPlay: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;

    return Container(
      height: 80 * vh,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xff1B1C20),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight:Radius.circular(10))),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 1 * vh),
            width: 15 * vw,
            height: 4,
            decoration: BoxDecoration(
                color: const Color.fromARGB(59, 255, 255, 255),
                borderRadius: BorderRadius.circular(50 * vw)),
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                              Icons.arrow_back_ios_new_rounded), // Иконка
                          iconSize: 5 * vw,
                          color: Color(0xff4D8AEE),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2 * vh,
                        ),
                        Text(
                          widget.map['nameRu'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontSize: 4 * vw,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1 * vh),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.map['prevSets'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(73, 255, 255, 255),
                                  fontFamily: 'Manrope',
                                  fontSize: 3 * vw,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                ' • ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(73, 255, 255, 255),
                                  fontFamily: 'Manrope',
                                  fontSize: 3 * vw,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                widget.map['prevVes'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(73, 255, 255, 255),
                                  fontFamily: 'Manrope',
                                  fontSize: 3 * vw,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                ' • ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(73, 255, 255, 255),
                                  fontFamily: 'Manrope',
                                  fontSize: 3 * vw,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "${widget.map['prevTime']} сек. отдых",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(73, 255, 255, 255),
                                  fontFamily: 'Manrope',
                                  fontSize: 3 * vw,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(flex: 1, child: Container())
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 4 * vh),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5 * vw),
              child: Container(
                decoration: BoxDecoration(),
                width: 90 * vw,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: (){debugPrint('Готово');},
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(
                      isExpanded: true,
                      colors: const ProgressBarColors(
                        playedColor: Colors.red,
                        handleColor: Colors.red
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5 * vw),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(118, 80, 80, 80),
                      borderRadius: BorderRadius.circular(10 * vw)),
                  margin: EdgeInsets.only(top: 2 * vh),
                  padding: EdgeInsets.symmetric(
                      vertical: 8, horizontal: 16), // Отступы текста от краев
                  child: Text(
                    'Гантели',
                    style: TextStyle(
                      color: const Color.fromARGB(183, 255, 255, 255),
                      decoration: TextDecoration.none,
                      fontSize: 3.5 * vw,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 5*vw,vertical: 2*vh),
            child: Text(
              textAlign: TextAlign.start,
              'Техника выполнения',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                decoration: TextDecoration.none,
                fontSize: 5 * vw,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 5*vw,vertical: 2*vh),
            child: Text(
              widget.map['descriptionRu'],
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                decoration: TextDecoration.none,
                fontSize: 3.5 * vw,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
