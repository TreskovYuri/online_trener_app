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
  List<Map<String, dynamic>> exercisesList = [];

  final TextEditingController nameRuController = TextEditingController();
  final TextEditingController nameEngController = TextEditingController();

  void setMuscleGroups(Map<String, dynamic> map) {
    setState(() {
      if (exercisesList.where((element) => element['id'] == map['id']).length >
          0) {
        Get.snackbar('Ошибка ввода!', 'Это упражнение уже есть в списке...',
            margin: EdgeInsets.only(top: 50),
            colorText: Color.fromARGB(181, 255, 255, 255));
      } else {
        exercisesList.add(map);
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
          Container(
            height: 5 * vh,
            child: Row(
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
                  child: page == 1
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
                              child: Text(
                                'Далее',
                                style: TextStyle(
                                  color: Color(0xff4D8AEE),
                                  fontSize: 3.3 * vw,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Manrope',
                                ),
                              )),
                        )
                      : GestureDetector(
                          onTap: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (_) => ModalCurrentType());
                          },
                          child: Container(
                              padding: EdgeInsets.only(top: 2 * vh),
                              alignment: Alignment.center,
                              child:
                                  SvgPicture.asset('assets/img/blue_plus.svg')),
                        ),
                )
              ],
            ),
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
    final vh = MediaQuery.of(context).size.height / 100;
    return Container(
      height: 78 * vh,
      width: double.infinity,
      child: Stack(
        children: [
          const Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Center(
              child: Text(
                'Сейчас нет добавленных упражнений',
                style: TextStyle(
                    color: Color.fromARGB(121, 255, 255, 255),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Manrope'),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 20,
              left: 20,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Color(0xff24252B)),
                child: const Text(
                  'Сохранить',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}

class ModalCurrentType extends StatefulWidget {
  const ModalCurrentType({super.key});

  @override
  State<ModalCurrentType> createState() => _ModalCurrentTypeState();
}

class _ModalCurrentTypeState extends State<ModalCurrentType> {
  List<String> categoryList = [
    'Разминка',
    "Заминка",
    "Упражнение",
    "Тест и норматив",
    "Сеты"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.all(13),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xff24252B),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                ...categoryList.map((e) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Устанавливаем радиус круглых углов
                        ),
                        backgroundColor: Colors.transparent,
                        foregroundColor: Color.fromARGB(0, 0, 41, 74),
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: 20)),
                    onPressed: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (_) => ExercisePattarnModal(
                                title: e,
                              ));
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            e,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 2, 13, 14),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Устанавливаем радиус круглых углов
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  backgroundColor: Color(0xff24252B),
                  foregroundColor: Color.fromARGB(0, 0, 41, 74),
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Отмена',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class ExercisePattarnModal extends StatefulWidget {
  const ExercisePattarnModal({super.key, required this.title});
  final String title;

  @override
  State<ExercisePattarnModal> createState() => _ExercisePattarnModalState();
}

class _ExercisePattarnModalState extends State<ExercisePattarnModal> {
  List<Map<String, dynamic>> exercisesList = [
    {
      "id": 1,
      "name": "Махи ногами",
      "img":
          "http://web-hub.pro:5004/assets/9811ef87-a51a-4c53-8e13-85b6539ede97.png",
      'descriptionRu': 'Развивает мышцы плеч, спины и груди, улучшает осанку',
      'descriptionEn': 'Развивает мышцы плеч, спины и груди, улучшает осанку',
      'link': '',
      'video': '',
      'stage': '',
      'equipment': '',
      'musclegroups': '',
      'pocazatel1Name': 'Колличество',
      'pocazatel1Type': 'раз',
      'pocazatel1SPFlag': '',
      'pocazatel2Name': '',
      'pocazatel2Type': '',
      'pocazatel2SPFlag': '',
      'pocazatel3Name': '',
      'pocazatel3Type': '',
      'pocazatel3SPFlag': '',
      'pocazatel4Name': '',
      'pocazatel4Type': '',
      'pocazatel4SPFlag': '',
      'pocazatel5Name': '',
      'pocazatel5Type': '',
      'pocazatel5SPFlag': '',
    },
    {
      "id": 2,
      "name": "Скручивания на пресс",
      "img":
          "http://web-hub.pro:5004/assets/0c50cda7-8543-492c-8d92-840921bf7c4e.jpg",
      'descriptionRu': 'Развивает мышцы плеч, спины и груди, улучшает осанку',
      'descriptionEn': 'Развивает мышцы плеч, спины и груди, улучшает осанку',
      'link': '',
      'video': '',
      'stage': '',
      'equipment': '',
      'musclegroups': '',
      'pocazatel1Name': 'Колличество',
      'pocazatel1Type': 'раз',
      'pocazatel1SPFlag': '',
      'pocazatel2Name': '',
      'pocazatel2Type': '',
      'pocazatel2SPFlag': '',
      'pocazatel3Name': '',
      'pocazatel3Type': '',
      'pocazatel3SPFlag': '',
      'pocazatel4Name': '',
      'pocazatel4Type': '',
      'pocazatel4SPFlag': '',
      'pocazatel5Name': '',
      'pocazatel5Type': '',
      'pocazatel5SPFlag': '',
    },
    {
      "id": 3,
      "name": "Отжимания",
      "img":
          "http://web-hub.pro:5004/assets/6411cec5-9276-490e-8b9a-a718f3dfd97d.jpg",
      'descriptionRu': 'Развивает мышцы плеч, спины и груди, улучшает осанку',
      'descriptionEn': 'Развивает мышцы плеч, спины и груди, улучшает осанку',
      'link': '',
      'video': '',
      'stage': '',
      'equipment': '',
      'musclegroups': '',
      'pocazatel1Name': 'Колличество',
      'pocazatel1Type': 'раз',
      'pocazatel1SPFlag': '',
      'pocazatel2Name': '',
      'pocazatel2Type': '',
      'pocazatel2SPFlag': '',
      'pocazatel3Name': '',
      'pocazatel3Type': '',
      'pocazatel3SPFlag': '',
      'pocazatel4Name': '',
      'pocazatel4Type': '',
      'pocazatel4SPFlag': '',
      'pocazatel5Name': '',
      'pocazatel5Type': '',
      'pocazatel5SPFlag': '',
    },
  ];

  List<Map<String, dynamic>> finalExercisesList = [];
  Map<String, dynamic> currentExercise = {};

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.symmetric(horizontal: 150),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: 15,
              height: 4,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(59, 255, 255, 255),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.title,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    if (currentExercise['id'] != null) {
                      Navigator.pop(context);
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (_) => _AddSets(
                                exercise: currentExercise,
                              ));
                    } else {
                      Get.snackbar('Ошибка ввода!', 'Выберите упражнение...',
                          margin: EdgeInsets.only(top: 50),
                          colorText: Color.fromARGB(181, 255, 255, 255));
                    }
                  },
                  child: Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: const Text(
                        'Добавить',
                        style: TextStyle(
                          color: Color(0xff4D8AEE),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Manrope',
                        ),
                      )),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: TextField(
              cursorColor: const Color.fromARGB(255, 112, 112, 112),
              style: const TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Найти...',
                filled: true, // Set to true to fill the background
                fillColor: Color(0xff23252B), // Set background color
                hintStyle: const TextStyle(
                    color: Colors.grey), // Customize hint text color
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 1.5),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // Remove border
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // Remove border
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        gradient: const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 15),
                        borderRadius: BorderRadius.circular(13)),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: const Color(0xff23252B),
                          borderRadius: BorderRadius.circular(13)),
                      child: const Text('Группа мышц',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        gradient: const RadialGradient(
                            colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                            radius: 15),
                        borderRadius: BorderRadius.circular(13)),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: const Color(0xff23252B),
                          borderRadius: BorderRadius.circular(13)),
                      child: const Text('Категория',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(13),
            child: Column(
              children: [
                ...exercisesList.map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: const Color(0xff24252B),
                            foregroundColor: const Color.fromARGB(0, 0, 41, 74),
                            shadowColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent,
                          ),
                          onPressed: () {
                            setState(() {
                              currentExercise = e;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(13),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        child: Image.network(
                                          e['img'],
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        width: 200,
                                        child: Text(
                                          e['name'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ))
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                          gradient: currentExercise['id'] ==
                                                  e['id']
                                              ? const RadialGradient(colors: [
                                                  Color(0xff4D8AEE),
                                                  Color(0xff2932FF),
                                                ], radius: 5)
                                              : const RadialGradient(colors: [
                                                  Color.fromARGB(
                                                      87, 100, 100, 100),
                                                  Color.fromARGB(
                                                      96, 109, 109, 109)
                                                ]),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Opacity(
                                        opacity:
                                            currentExercise['id'] == e['id']
                                                ? 1
                                                : 0,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              currentExercise = e;
                                            });
                                          },
                                          icon: SvgPicture.asset(
                                            'assets/img/ok_white.svg',
                                            width: 16,
                                            height: 16,
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AddSets extends StatefulWidget {
  _AddSets({super.key, required this.exercise});
  Map<String, dynamic> exercise;

  @override
  State<_AddSets> createState() => __AddSetsState();
}

class __AddSetsState extends State<_AddSets> {
  int sets = 1;
  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height / 100;
    return Stack(
      children: [
        Positioned(
            child: Container(
          height: 90*vh,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color(0xff1B1C20),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 150),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 15,
                    height: 4,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(59, 255, 255, 255),
                        borderRadius: BorderRadius.circular(50)),
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
                            padding: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            child: SvgPicture.asset('assets/img/x_white.svg')),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.exercise['name'],
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            child: const Text(
                              '',
                              style: TextStyle(
                                color: Color(0xff4D8AEE),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Manrope',
                              ),
                            )),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Сет',
                              style:
                                  TextStyle(color: Colors.white38, fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      widget.exercise['pocazatel1Name'] != null
                          ? Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      widget.exercise['pocazatel1Name'],
                                      style: TextStyle(
                                          color: Colors.white38, fontSize: 13),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                Column(
                  children: [
                    ...List.generate(
                      sets,
                      (index) => RowInputWidget(
                        exercise: widget.exercise,
                        set: index,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      gradient: const RadialGradient(
                          colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                          radius: 71),
                      borderRadius: BorderRadius.circular(100)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 0, 84, 122),
                      backgroundColor: const Color(0xff1B1C20),
                      padding:
                          EdgeInsets.zero, // Убираем внутренний отступ кнопки
                      minimumSize: const Size(
                          0, 0), // Устанавливаем минимальный размер кнопки
                      tapTargetSize: MaterialTapTargetSize
                          .shrinkWrap, // Уменьшаем размер области клика
                    ),
                    onPressed: () {
                      setState(() {
                        sets++;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                      child: Row(
                        mainAxisSize:
                            MainAxisSize.min, // Минимальный размер для Row
                        children: [
                          SvgPicture.asset(
                            'assets/img/plus_white.svg',
                            width: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Добавить сет',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        'Время отдыха',
                        style: TextStyle(color: Colors.white38, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: TextField(
                    cursorColor: const Color.fromARGB(255, 112, 112, 112),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    decoration: InputDecoration(
                      hintText: '',
                      filled: true,
                      fillColor: const Color(0xff23252B),
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 1.5),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        )),
        Positioned(
          bottom: 20,
          right: 0,
          left: 0,
          child: ElevatedButton(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const RadialGradient(
                  colors: [
                    Color(0xff4D8AEE),
                    Color(0xff2932FF),
                  ],
                  radius: 5, // Радиус градиента
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: const Text(
                'Сохранить',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
        )
      ],
    );
  }
}

class RowInputWidget extends StatefulWidget {
  RowInputWidget({super.key, required this.set, required this.exercise});
  int set;
  Map<String, dynamic> exercise;

  @override
  State<RowInputWidget> createState() => _RowInputWidgetState();
}

class _RowInputWidgetState extends State<RowInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                  color: const Color(0xff23252B),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                (widget.set + 1).toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          widget.exercise['pocazatel1Name'] != null
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: CustomTextField(
                        label: widget.exercise['pocazatel1Type']),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;

  CustomTextField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          cursorColor: const Color.fromARGB(255, 112, 112, 112),
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            hintText: '',
            filled: true,
            fillColor: const Color(0xff23252B),
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          right: 10, // Adjust as needed
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
