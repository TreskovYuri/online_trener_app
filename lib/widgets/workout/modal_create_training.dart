import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class ModalCreateTraining extends StatefulWidget {
  const ModalCreateTraining({super.key});

  @override
  State<ModalCreateTraining> createState() => _ModalCreateTrainingState();
}

class _ModalCreateTrainingState extends State<ModalCreateTraining> {
  int page = 1;
  List muscleGroups = [];
  List<String> listEquipments = [];
  final TextEditingController nameRuController = TextEditingController();
  final TextEditingController nameEngController = TextEditingController();

  void setListEquipments(String equipment) {
    setState(() {
      if (listEquipments.contains(equipment)) {
        print(equipment);
        listEquipments.remove(equipment);
      } else {
        listEquipments.add(equipment);
      }
    });
  }

  void setMuscleGroups(String group) {
    setState(() {
      if (muscleGroups.contains(group)) {
        muscleGroups.remove(group);
      } else {
        muscleGroups.add(group);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;

    return Container(
      height: 90 * vh,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff1B1C20),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40 * vw),
            child: Container(
              margin: EdgeInsets.only(top: 1 * vh),
              width: 15 * vw,
              height: 4,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(59, 255, 255, 255),
                  borderRadius: BorderRadius.circular(50 * vw)),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding: EdgeInsets.only(top: 2 * vh),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/img/x_white.svg',
                        )),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2 * vh,
                        ),
                        page == 1
                            ? Text(
                                'Добавить упражнение',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Manrope',
                                  fontSize: 4 * vw,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : SizedBox.shrink(),
                        page == 2
                            ? Text(
                                'Выбор группы мышц',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Manrope',
                                  fontSize: 4 * vw,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : SizedBox.shrink(),
                        page == 3
                            ? Text(
                                'Выбор оборудования',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Manrope',
                                  fontSize: 4 * vw,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : SizedBox.shrink(),
                        page == 4
                            ? Text(
                                'Добавить упражнение',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Manrope',
                                  fontSize: 4 * vw,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: page < 4
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            if (nameRuController.text.length > 0) {
                              page++;
                            } else {
                              Get.snackbar('Ошибка ввода!',
                                  'Введите название упражнения...',
                                  colorText:
                                      Color.fromARGB(181, 255, 255, 255));
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 2 * vh),
                          alignment: Alignment.center,
                          child: Text(
                            'Далее',
                            style: TextStyle(
                              color: Color(0xff4D8AEE),
                              fontSize: 3.3 * vw,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Manrope',
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            // page++;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 2 * vh),
                          alignment: Alignment.center,
                          child: Text(
                            '',
                            style: TextStyle(
                              color: Color(0xff4D8AEE),
                              fontSize: 3.3 * vw,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Manrope',
                            ),
                          ),
                        ),
                      ),
              )
            ],
          ),
          SizedBox(
            height: 3 * vh,
          ),
          page == 1
              ? Page1(
                  vw: vw,
                  vh: vh,
                  controllerEng: nameEngController,
                  controllerRu: nameRuController,
                )
              : SizedBox.shrink(),
          page == 2
              ? Page2(
                  vw: vw,
                  vh: vh,
                  muscleGroups: muscleGroups,
                  setMuscleGroup: setMuscleGroups)
              : SizedBox.shrink(),
          page == 3
              ? Page3(
                  vw: vw,
                  vh: vh,
                  setListEquipments: setListEquipments,
                  listEquipments: listEquipments,
                )
              : SizedBox.shrink(),
          page == 4
              ? Page4(
                  vw: vw,
                  vh: vh,
                  setListEquipments: setListEquipments,
                  listEquipments: listEquipments,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  Page1(
      {super.key,
      required this.vw,
      required this.vh,
      required this.controllerEng,
      required this.controllerRu});

  final double vw;
  final double vh;
  TextEditingController controllerRu;
  TextEditingController controllerEng;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(5 * vw, 7 * vw, 5 * vw, 2 * vw),
          child: Row(
            children: [
              Text('Введите название',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromARGB(115, 255, 255, 255),
                      fontSize: 3.3 * vw,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Manrope')),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5 * vw),
          child: TextField(
            controller: controllerRu,
            cursorColor: Color.fromRGBO(112, 112, 112, 1),
            style: TextStyle(color: Colors.white, fontSize: 4 * vw),
            decoration: InputDecoration(
              hintText: 'Название упражнения',
              hintStyle: const TextStyle(
                color: Colors.grey, // Цвет текста плейсхолдера
                fontSize: 16, // Размер текста плейсхолдера
                fontWeight: FontWeight.normal, // Начертание текста плейсхолдера
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 4 * vw, vertical: 1.5 * vh),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4 * vw),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4 * vw),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 112, 112, 112),
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5 * vw, 5 * vw, 5 * vw, 2 * vw),
          child: Row(
            children: [
              Text('Название на английском',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromARGB(115, 255, 255, 255),
                      fontSize: 3.3 * vw,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Manrope')),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5 * vw),
          child: TextField(
            controller: controllerEng,
            cursorColor: Color.fromRGBO(112, 112, 112, 1),
            style: TextStyle(color: Colors.white, fontSize: 4 * vw),
            decoration: InputDecoration(
              hintText: 'Workout name',
              hintStyle: const TextStyle(
                color: Colors.grey, // Цвет текста плейсхолдера
                fontSize: 16, // Размер текста плейсхолдера
                fontWeight: FontWeight.normal, // Начертание текста плейсхолдера
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 4 * vw, vertical: 1.5 * vh),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4 * vw),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4 * vw),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 112, 112, 112),
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2(
      {Key? key,
      required this.vw,
      required this.vh,
      required this.setMuscleGroup,
      required this.muscleGroups})
      : super(key: key);

  final double vw;
  final double vh;
  final Function(String)
      setMuscleGroup; // Функция обратного вызова для установки группы мышц
  final List muscleGroups;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 35 * vh,
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/img/frame.svg',
              ),
              muscleGroups.contains('Пресс')
                  ? SvgPicture.asset(
                      'assets/img/frame_press.svg',
                    )
                  : SizedBox.shrink(),
              muscleGroups.contains('Шея')
                  ? SvgPicture.asset(
                      'assets/img/frame_shea.svg',
                    )
                  : SizedBox.shrink(),
              muscleGroups.contains('Ноги')
                  ? SvgPicture.asset(
                      'assets/img/frame_nogi.svg',
                    )
                  : SizedBox.shrink(),
              muscleGroups.contains('Икры')
                  ? SvgPicture.asset(
                      'assets/img/frame_ikri.svg',
                    )
                  : SizedBox.shrink(),
              muscleGroups.contains('Руки')
                  ? SvgPicture.asset(
                      'assets/img/frame_ruki.svg',
                    )
                  : SizedBox.shrink(),
              muscleGroups.contains('Плечи')
                  ? SvgPicture.asset(
                      'assets/img/frame_plechi.svg',
                    )
                  : SizedBox.shrink(),
              muscleGroups.contains('Грудь')
                  ? SvgPicture.asset(
                      'assets/img/frame_grud.svg',
                    )
                  : SizedBox.shrink(),
              muscleGroups.contains('Бицепс')
                  ? SvgPicture.asset(
                      'assets/img/frame_biceps.svg',
                    )
                  : SizedBox.shrink(),
              muscleGroups.contains('Трицепс')
                  ? SvgPicture.asset(
                      'assets/img/frame_tricebs.svg',
                    )
                  : SizedBox.shrink(),
              muscleGroups.contains('Спина')
                  ? SvgPicture.asset(
                      'assets/img/frame_spina.svg',
                    )
                  : SizedBox.shrink(),
              muscleGroups.contains('Бедра')
                  ? SvgPicture.asset(
                      'assets/img/frame_bedra.svg',
                    )
                  : SizedBox.shrink(),
              muscleGroups.contains('Голень')
                  ? SvgPicture.asset(
                      'assets/img/frame_golen.svg',
                    )
                  : SizedBox.shrink(),
              muscleGroups.contains('Предплечье')
                  ? SvgPicture.asset(
                      'assets/img/frame_plechi.svg',
                    )
                  : SizedBox.shrink(),
              muscleGroups.contains('Кисти')
                  ? SvgPicture.asset(
                      'assets/img/frame_kisti.svg',
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        SizedBox(
          height: 3 * vh,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Пресс')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(left: 2 * vw, right: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Пресс');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Пресс')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Пресс',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Шея')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(right: 2 * vw, left: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Шея');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Шея')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Шея',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1 * vh,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Ноги')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(left: 2 * vw, right: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Ноги');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Ноги')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Ноги',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Икры')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(right: 2 * vw, left: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Икры');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Икры')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Икры',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1 * vh,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Руки')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(left: 2 * vw, right: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Руки');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Руки')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Руки',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Плечи')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(right: 2 * vw, left: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Плечи');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Плечи')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Плечи',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1 * vh,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Грудь')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(left: 2 * vw, right: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Грудь');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Грудь')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Грудь',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Бицепс')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(right: 2 * vw, left: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Бицепс');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Бицепс')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Бицепс',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1 * vh,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Трицепс')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(left: 2 * vw, right: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Трицепс');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Трицепс')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Трицепс',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Спина')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(right: 2 * vw, left: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Спина');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Спина')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Спина',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1 * vh,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Бедра')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(left: 2 * vw, right: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Бедра');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Бедра')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Бедра',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Голень')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(right: 2 * vw, left: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Голень');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Голень')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Голень',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1 * vh,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Предплечье')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(left: 2 * vw, right: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Предплечье');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Предплечье')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Предплечье',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: muscleGroups.contains('Кисти')
                        ? const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 8)
                        : const RadialGradient(
                            colors: [Colors.transparent, Colors.transparent]),
                    borderRadius: BorderRadius.circular(3 * vw)),
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(right: 2 * vw, left: 1 * vw),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3 * vw), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    // Вызываем функцию обратного вызова для установки группы мышц
                    setMuscleGroup('Кисти');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2 * vh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !muscleGroups.contains('Кисти')
                            ? Container(
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: 5 * vw,
                                height: 5 * vw,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF),
                                    ], radius: 5),
                                    borderRadius:
                                        BorderRadius.circular(100 * vw)),
                                child: SvgPicture.asset(
                                  'assets/img/ok_white.svg',
                                  width: 3 * vw,
                                ),
                              ),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        Text('Кисти',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 3 * vh,
        ),
      ],
    );
  }
}

class Page3 extends StatefulWidget {
  Page3(
      {super.key,
      required this.vw,
      required this.vh,
      required this.setListEquipments,
      required this.listEquipments});

  final double vw;
  final double vh;
  final Function(String) setListEquipments;
  final List<String> listEquipments;

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final List<String> equipments = [
    'коврик',
    'стул',
    'роллер',
    'гантели',
    'стена',
    'гири',
    'штанги',
    'медболы',
    'фитболы',
    'резиновые эспандеры'
  ];

  void setEquipments(String equipment) {
    setState(() {
      if (equipments.contains(equipment)) {
        equipments.remove(equipment);
      } else {
        equipments.add(equipment);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double vw = widget.vw;
    final double vh = widget.vh;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5 * vh),
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          ...equipments.map(
            (e) => Container(
              margin: EdgeInsets.only(left: 1 * vw),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(112, 1, 110, 179),
                  backgroundColor: !widget.listEquipments.contains(e)
                      ? Color(0xff23252B)
                      : Color.fromARGB(237, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10 * vw), // Устанавливаем радиус круглых углов
                  ),
                ),
                onPressed: () {
                  widget.setListEquipments(e);
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1 * vh),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.listEquipments.contains(e)
                            ? Text("$e",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 37, 37, 37),
                                    fontFamily: 'Manrope',
                                    fontSize: 4 * vw,
                                    fontWeight: FontWeight.w500))
                            : Text("$e",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Manrope',
                                    fontSize: 4 * vw,
                                    fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 2 * vw,
                        ),
                        widget.listEquipments.contains(e)
                            ? SvgPicture.asset(
                                'assets/img/x_white.svg',
                                width: 3 * vw,
                              )
                            : SvgPicture.asset(
                                'assets/img/plus_white.svg',
                                width: 3 * vw,
                              ),
                      ],
                    )),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 1 * vw),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(112, 1, 110, 179),
                backgroundColor: Color(0xff23252B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10 * vw), // Устанавливаем радиус круглых углов
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) => ModalAddEq(
                          setMuscleGroup: setEquipments,
                          vh: vh,
                          vw: vw,
                        ));
                ;
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1 * vh),
                child: Text("+",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Manrope',
                        fontSize: 4 * vw,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Модпльное окно добавления оборудования
class ModalAddEq extends StatefulWidget {
  ModalAddEq(
      {super.key,
      required this.setMuscleGroup,
      required this.vw,
      required this.vh});
  final double vw;
  final double vh;

  final Function(String) setMuscleGroup;

  @override
  State<ModalAddEq> createState() => _ModalAddEqState();
}

class _ModalAddEqState extends State<ModalAddEq> {
  final TextEditingController inputController = TextEditingController();
  String inputText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40 * widget.vh,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff1B1C20),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 2 * widget.vh),
                    alignment: Alignment.center,
                    child: Text(
                      'Закрыть',
                      style: TextStyle(
                        color: Color(0xff4D8AEE),
                        fontSize: 3.3 * widget.vw,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2 * widget.vh,
                        ),
                        Text(
                          'Добавление оборудование',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontSize: 4 * widget.vw,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    if (inputController.text.length > 0) {
                      widget.setMuscleGroup(inputController.text);
                      Navigator.pop(context);
                    } else {
                      Get.snackbar(
                          'Ошибка ввода!', 'Поле ввода не может быть пустым...',
                          colorText: Color.fromARGB(181, 255, 255, 255));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 2 * widget.vh),
                    alignment: Alignment.center,
                    child: Text(
                      'Добавить',
                      style: TextStyle(
                        color: Color(0xff4D8AEE),
                        fontSize: 3.3 * widget.vw,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5 * widget.vh,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5 * widget.vw),
            child: TextField(
              controller: inputController,
              onChanged: (value) {
                setState(() {
                  inputText = value;
                });
              },
              cursorColor: Color.fromRGBO(112, 112, 112, 1),
              style: TextStyle(color: Colors.white, fontSize: 4 * widget.vw),
              decoration: InputDecoration(
                hintText: 'Название оборудования',
                hintStyle: const TextStyle(
                  color: Colors.grey, // Цвет текста плейсхолдера
                  fontSize: 16, // Размер текста плейсхолдера
                  fontWeight:
                      FontWeight.normal, // Начертание текста плейсхолдера
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 4 * widget.vw, vertical: 1.5 * widget.vh),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4 * widget.vw),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4 * widget.vw),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 112, 112, 112),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page4 extends StatefulWidget {
  Page4(
      {super.key,
      required this.vw,
      required this.vh,
      required this.setListEquipments,
      required this.listEquipments});

  final double vw;
  final double vh;
  final Function(String) setListEquipments;
  final List<String> listEquipments;

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  String stage = 'Разминка';
  bool stageModalFlag = false;
  PlatformFile? file;

  void setStage(String newStage) {
    setState(() {
      stage = newStage;
    });
  }

  Future selectFile() async {
    final fileUpload = await FilePicker.platform.pickFiles();
    if (fileUpload == null) return;
    setState(() {
      file = fileUpload.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double vw = widget.vw;
    final double vh = widget.vh;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2 * vh),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(3 * vw, 7 * vw, 3 * vw, 2 * vw),
            child: Row(
              children: [
                Text('Введите название',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(115, 255, 255, 255),
                        fontSize: 3.3 * vw,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope')),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3 * vw),
            child: TextField(
              cursorColor: Color.fromRGBO(112, 112, 112, 1),
              style: TextStyle(color: Colors.white, fontSize: 4 * vw),
              decoration: InputDecoration(
                hintText: 'Описание упражнения',
                hintStyle: const TextStyle(
                  color: Colors.grey, // Цвет текста плейсхолдера
                  fontSize: 16, // Размер текста плейсхолдера
                  fontWeight:
                      FontWeight.normal, // Начертание текста плейсхолдера
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 4 * vw, vertical: 1.5 * vh),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4 * vw),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4 * vw),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 112, 112, 112),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(3 * vw, 7 * vw, 3 * vw, 2 * vw),
            child: Row(
              children: [
                Text('Введите описание на английском',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(115, 255, 255, 255),
                        fontSize: 3.3 * vw,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope')),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3 * vw),
            child: TextField(
              cursorColor: Color.fromRGBO(112, 112, 112, 1),
              style: TextStyle(color: Colors.white, fontSize: 4 * vw),
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: const TextStyle(
                  color: Colors.grey, // Цвет текста плейсхолдера
                  fontSize: 16, // Размер текста плейсхолдера
                  fontWeight:
                      FontWeight.normal, // Начертание текста плейсхолдера
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 4 * vw, vertical: 1.5 * vh),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4 * vw),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4 * vw),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 112, 112, 112),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5 * vw, 7 * vw, 5 * vw, 0 * vw),
            child: Row(
              children: [
                Text('Этап тренировки',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(115, 255, 255, 255),
                        fontSize: 3.3 * vw,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope')),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3 * vw),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(112, 1, 110, 179),
                backgroundColor: Color(0xff23252B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      3 * vw), // Устанавливаем радиус круглых углов
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) => ModalStage(
                          vw: vw,
                          vh: vh,
                          stage: stage,
                          setStage: setStage,
                        ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2 * vh),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      stage,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Manrope',
                          fontSize: 4 * vw,
                          fontWeight: FontWeight.w400),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 4 * vw,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5 * vw, 2 * vw, 5 * vw, 0 * vw),
            child: Row(
              children: [
                Text('Добавьте видео с техникой выполнения',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(115, 255, 255, 255),
                        fontSize: 3.3 * vw,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope')),
              ],
            ),
          ),
          file != null
              ? GestureDetector(
                  onTap: selectFile,
                  child: Container(
                    margin: EdgeInsets.all(3 * vw),
                    width: double.infinity,
                    height: 25 * vh,
                    child: Image.file(
                      File(file!.path!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: selectFile,
                  child: Container(
                    margin: EdgeInsets.all(3 * vw),
                    width: double.infinity,
                    height: 25 * vh,
                    child: SvgPicture.asset(
                      'assets/img/upload_file.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          Padding(
            padding: EdgeInsets.fromLTRB(5 * vw, 0 * vw, 5 * vw, 3 * vw),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('или',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(115, 255, 255, 255),
                        fontSize: 3.3 * vw,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope')),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3 * vw),
            child: TextField(
              cursorColor: Color.fromRGBO(112, 112, 112, 1),
              style: TextStyle(color: Colors.white, fontSize: 4 * vw),
              decoration: InputDecoration(
                hintText: 'Добавьте ссылку YouTube',
                hintStyle: const TextStyle(
                  color: Colors.grey, // Цвет текста плейсхолдера
                  fontSize: 16, // Размер текста плейсхолдера
                  fontWeight:
                      FontWeight.normal, // Начертание текста плейсхолдера
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 4 * vw, vertical: 1.5 * vh),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4 * vw),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4 * vw),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 112, 112, 112),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 3 * vh,
          ),
          ElevatedButton(
            child: Container(
              width: 90 * vw,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10 * vw),
                gradient: const RadialGradient(
                  colors: [
                    Color(0xff4D8AEE),
                    Color(0xff2932FF),
                  ],
                  radius: 5, // Радиус градиента
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 1 * vh),
              child: Text(
                'Добавить',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 4 * vw,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Manrope'),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.transparent, // Чтобы сделать фон прозрачным
              shadowColor: Colors.transparent, // Чтобы убрать тень
            ).copyWith(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              elevation: MaterialStateProperty.all<double>(0),
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              // Радиальный градиент
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            onPressed: () {
              // Вызываем функцию обратного вызова для установки группы мышц
            },
          ),
        ],
      ),
    );
  }
}

class ModalStage extends StatefulWidget {
  ModalStage(
      {super.key,
      required this.vw,
      required this.vh,
      required this.stage,
      required this.setStage});
  final double vw;
  final double vh;
  final String stage;
  final Function setStage;

  @override
  State<ModalStage> createState() => _ModalStageState();
}

class _ModalStageState extends State<ModalStage> {
  String stage = '';
  @override
  void initState() {
    setState(() {
      stage = widget.stage;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 * widget.vh,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff1B1C20),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 2 * widget.vh),
                    alignment: Alignment.center,
                    child: Text(
                      'Закрыть',
                      style: TextStyle(
                        color: Color(0xff4D8AEE),
                        fontSize: 3.3 * widget.vw,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2 * widget.vh,
                        ),
                        Text(
                          'Этап тренировки',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontSize: 4 * widget.vw,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 2 * widget.vh),
                    alignment: Alignment.center,
                    child: Text(
                      'Сохранить',
                      style: TextStyle(
                        color: Color(0xff4D8AEE),
                        fontSize: 3.3 * widget.vw,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5 * widget.vh,
          ),
          Container(
            padding: EdgeInsets.all(3 * widget.vw),
            decoration: BoxDecoration(
                color: Color(0XFF23252B),
                borderRadius: BorderRadius.circular(3 * widget.vw)),
            margin: EdgeInsets.all(3 * widget.vw),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(14, 255, 255, 255),
                            width: 1)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 5 * widget.vw, horizontal: 6 * widget.vw),
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3 * widget.vw),
                        )),
                    onPressed: () {
                      widget.setStage('Разминка');
                      setState(() {
                        stage = 'Разминка';
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Разминка',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 4 * widget.vw,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400),
                        ),
                        stage == 'Разминка'
                            ? SvgPicture.asset(
                                'assets/img/ok_white.svg',
                                width: 4 * widget.vw,
                              )
                            : SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(14, 255, 255, 255),
                            width: 1)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 5 * widget.vw, horizontal: 6 * widget.vw),
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3 * widget.vw),
                        )),
                    onPressed: () {
                      widget.setStage('Заминка');
                      setState(() {
                        stage = 'Заминка';
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Заминка',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 4 * widget.vw,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400),
                        ),
                        stage == 'Заминка'
                            ? SvgPicture.asset(
                                'assets/img/ok_white.svg',
                                width: 4 * widget.vw,
                              )
                            : SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 5 * widget.vw, horizontal: 6 * widget.vw),
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3 * widget.vw),
                        )),
                    onPressed: () {
                      widget.setStage('Упражнение');
                      setState(() {
                        stage = 'Упражнение';
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Упражнение',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 4 * widget.vw,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400),
                        ),
                        stage == 'Упражнение'
                            ? SvgPicture.asset(
                                'assets/img/ok_white.svg',
                                width: 4 * widget.vw,
                              )
                            : SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
