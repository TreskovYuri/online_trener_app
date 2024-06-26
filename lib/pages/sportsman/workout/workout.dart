import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/widgets/workout/workout_description.dart';
import 'package:trener_app/widgets/workout/wourkout_nuskle_group.dart';
import 'package:trener_app/widgets/youtube.dart';
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
    final List<String> list = [];

    return Container(
      color: const Color(0xff1B1C20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 50 * vh,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          2 * vw), // Радиус закругления нижнего левого угла
                      bottomRight: Radius.circular(
                          2 * vw), // Радиус закругления нижнего правого угла
                    ),
                    child: Image.network(
                      '${dotenv.env['STATIC_URL']}/${arguments['exercise']['img']}',
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Container(
                          width: double.infinity,
                          color: Colors
                              .grey, // You can set any color or image as a placeholder
                          child: const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 50.0, // Adjust the size as needed
                          ),
                        );
                      },
                    ),
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
                      arguments['exercise']['nameRu'] ?? '',
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
            GestureDetector(
              onTap: () {
                setState(() {
                  descriptionModalFlag = !descriptionModalFlag;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(3 * vw),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Описание",
                            style: TextStyle(
                                color: const Color.fromARGB(202, 255, 255, 255),
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
                        height: 1 * vw,
                      ),
                      descriptionModalFlag
                          ? Opacity(
                              opacity: 0.7,
                              child: Text(
                                arguments['exercise']['descriptionRu'],
                                style: TextStyle(
                                    color: Color.fromARGB(202, 255, 255, 255),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 4 * vw),
                              ),
                            )
                          : Container(),
                      const SizedBox(
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
                          const SizedBox(
                            width: 10,
                          ),
                          Opacity(
                            opacity: 0.7,
                            child: Transform.rotate(
                                angle: -90 *
                                    (pi / 180), // Угол поворота в радианах
                                child: muscleGroupModalFlag
                                    ? Icon(Icons.arrow_forward_ios_rounded,
                                        color: Colors.white, size: 3 * vw)
                                    : Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.white,
                                        size: 5 * vw,
                                      )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      muscleGroupModalFlag
                          ? Image.asset('assets/img/workout_muskle_group.png')
                          : Container(),
                      const SizedBox(
                        height: 20,
                      ),
                      arguments['exercise']['link'] != null
                          ? Youtube(url: arguments['exercise']['link'])
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                // Устанавливаем фоновый градиент
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.transparent;
                }),
                overlayColor: MaterialStateProperty.resolveWith((states) {
                  return null;
                }),
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  return null;
                }),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/training_fix',
                    arguments: arguments);
              },
              child: Ink(
                padding: EdgeInsets.symmetric(
                    vertical: 1.5 * vh, horizontal: 9 * vw),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * vw),
                  gradient: const RadialGradient(
                      colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                      radius: 5),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Заполнить',
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 3.5 * vw,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 4 * vh,
            )
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
  // ignore: non_constant_identifier_names
  late String VIDEO_URL;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    VIDEO_URL = widget.map['link'];
    final VideoID = YoutubePlayer.convertUrlToId(VIDEO_URL);
    _controller = YoutubePlayerController(
        initialVideoId: VideoID!,
        flags: const YoutubePlayerFlags(
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
      decoration: const BoxDecoration(
          color: Color(0xff1B1C20),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
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
              child: SizedBox(
                width: 90 * vw,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                  },
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(
                      isExpanded: true,
                      colors: const ProgressBarColors(
                          playedColor: Colors.red, handleColor: Colors.red),
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
                  padding: const EdgeInsets.symmetric(
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
            padding: EdgeInsets.symmetric(horizontal: 5 * vw, vertical: 2 * vh),
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
            padding: EdgeInsets.symmetric(horizontal: 5 * vw, vertical: 2 * vh),
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
