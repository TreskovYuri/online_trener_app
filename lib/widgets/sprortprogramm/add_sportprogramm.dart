import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MySportProgrammController.dart';
import 'package:trener_app/widgets/shanckbar.dart';

class AddSportProgramm extends StatefulWidget {
  const AddSportProgramm({super.key});

  @override
  State<AddSportProgramm> createState() => _AddSportProgrammState();
}

class _AddSportProgrammState extends State<AddSportProgramm> {
  int page = 1;
  List<Map<String, dynamic>> exercisesList = [];
  final MySportProgrammController mySportProgrammController = Get.put(MySportProgrammController());

  final TextEditingController nameRuController = TextEditingController();
  final TextEditingController nameEngController = TextEditingController();
  final TextEditingController descriptionRuController = TextEditingController();
  final TextEditingController descriptionEngController = TextEditingController();

  void setMuscleGroups(Map<String, dynamic> map) {
    setState(() {
      if (exercisesList.where((element) => element['id'] == map['id']).length >
          0) {
        GetMySnackBar(description: 'Это упражнение уже есть в списке...');
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
                                'Добавить программу',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Manrope',
                                  fontSize: 4 * vw,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : const SizedBox.shrink(),
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
                                Navigator.pushReplacementNamed(
                                    context, '/add_sportprogramm_page',
                                    );
                              } else {
                                        GetMySnackBar(description: 'Введите название упражнения...');
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
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.only(top: 2 * vh),
                            alignment: Alignment.center,
                            child:
                                SvgPicture.asset('assets/img/blue_plus.svg')),
                      ),
              )
            ],
          ),
          // page == 2 ? Page2() : SizedBox.shrink(),
          SizedBox(
            height: 3 * vh,
          ),
          Column(
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
                            fontFamily: 'Manrope'))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5 * vw),
                child: TextField(
                  controller: nameRuController,
                  onChanged: (value) => mySportProgrammController.setNameRuAddSportProgramm(value),
                  cursorColor: const Color.fromRGBO(112, 112, 112, 1),
                  style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                  decoration: InputDecoration(
                    hintText: 'Название программы',
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
                padding: EdgeInsets.fromLTRB(5 * vw, 7 * vw, 5 * vw, 2 * vw),
                child: Row(
                  children: [
                    Text('Введите название на английском',
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
                  onChanged: (value) => mySportProgrammController.setNameEngAddSportProgramm(value),
                  cursorColor: const Color.fromRGBO(112, 112, 112, 1),
                  style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                  decoration: InputDecoration(
                    hintText: 'English',
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
                padding: EdgeInsets.fromLTRB(5 * vw, 7 * vw, 5 * vw, 2 * vw),
                child: Row(
                  children: [
                    Text('Описание (опционально)',
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
                  onChanged: (value) => mySportProgrammController.setDescriptionRuAddSportProgramm(value),
                  cursorColor: Color.fromRGBO(112, 112, 112, 1),
                  style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                  decoration: InputDecoration(
                    hintText: 'Описание',
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
                padding: EdgeInsets.fromLTRB(5 * vw, 7 * vw, 5 * vw, 2 * vw),
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
                padding: EdgeInsets.symmetric(horizontal: 5 * vw),
                child: TextField(
                  onChanged: (value) => mySportProgrammController.setDescriptionEngAddSportProgramm(value),
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
            ],
          ),
        ],
      ),
    );
  }
}
