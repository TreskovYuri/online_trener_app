import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddTrainingPattern extends StatefulWidget {
  const AddTrainingPattern({super.key});

  @override
  State<AddTrainingPattern> createState() => _AddTrainingPatternState();
}

class _AddTrainingPatternState extends State<AddTrainingPattern> {
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
                        padding: EdgeInsets.only(top: 1.7 * vh),
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
                                'Добавить шаблон',
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
                                'Упражнения',
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
                                  margin: EdgeInsets.only(top: 50),
                                  colorText:
                                      Color.fromARGB(181, 255, 255, 255));
                            }
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.only(top: 2 * vh),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                page == 1
                                    ? Text(
                                        'Далее',
                                        style: TextStyle(
                                          color: Color(0xff4D8AEE),
                                          fontSize: 3.3 * vw,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Manrope',
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                page == 2
                                    ? SvgPicture.asset(
                                        'assets/img/blue_plus.svg')
                                    : SizedBox.shrink(),
                              ],
                            )),
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
          page == 2 ? Page2() : SizedBox.shrink(),
          // page == 3
          //     ? Page3(
          //         vw: vw,
          //         vh: vh,
          //         setListEquipments: setListEquipments,
          //         listEquipments: listEquipments,
          //       )
          //     : SizedBox.shrink(),
          // page == 4
          //     ? Page4(
          //         vw: vw,
          //         vh: vh,
          //         setListEquipments: setListEquipments,
          //         listEquipments: listEquipments,
          //       )
          //     : SizedBox.shrink(),
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
      ],
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom:0,
              child: Center(
            child: Text(
              'ddw',
              style: TextStyle(color: Colors.white),
            ),
          ))
        ],
      ),
    );
  }
}
