import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/getx/getx_controller.dart';
import 'package:trener_app/mobx/mobx.dart';

class AddSportProgramm extends StatefulWidget {
  const AddSportProgramm({super.key});

  @override
  State<AddSportProgramm> createState() => _AddSportProgrammState();
}

class _AddSportProgrammState extends State<AddSportProgramm> {
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
                              Navigator.pushReplacementNamed(context, '/add_sportprogramm_page', arguments: {
                                "nameRu":nameRuController.text
                                });
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
          // page == 2 ? Page2() : SizedBox.shrink(),
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
              hintText: 'Название программы',
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
            cursorColor: Color.fromRGBO(112, 112, 112, 1),
            style: TextStyle(color: Colors.white, fontSize: 4 * vw),
            decoration: InputDecoration(
              hintText: 'English',
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
            cursorColor: Color.fromRGBO(112, 112, 112, 1),
            style: TextStyle(color: Colors.white, fontSize: 4 * vw),
            decoration: InputDecoration(
              hintText: 'Описание',
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
            cursorColor: Color.fromRGBO(112, 112, 112, 1),
            style: TextStyle(color: Colors.white, fontSize: 4 * vw),
            decoration: InputDecoration(
              hintText: 'English',
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
      height: 81 * vh,
      width: double.infinity,
      child: Stack(
        children: [
          const Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child:
                  // Center(
                  //   child: Text(
                  //     'Сейчас нет добавленных упражнений',
                  //     style: TextStyle(
                  //         color: Color.fromARGB(121, 255, 255, 255),
                  //         fontSize: 13,
                  //         fontWeight: FontWeight.w400,
                  //         fontFamily: 'Manrope'),
                  //   ),
                  // ),
                  _Calendar()),
          Positioned(
              bottom: 0,
              right: 20,
              left: 20,
              child: Container(
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                    gradient: const RadialGradient(
                      radius: 5,
                      colors: [
                  Color(0xFF4D8AEE),
                  Color(0xFF2932FF),
                  
                ])),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.transparent),
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {},
                ),
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
    "Упражнение",
    "Заминка",
    "Тест и норматив",
    "Серия",
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
                    onPressed: () {Navigator.pushReplacementNamed(context, '/add_sportprogramm_page', arguments: e);},
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

class _Calendar extends StatefulWidget {
  const _Calendar({super.key});

  @override
  State<_Calendar> createState() => __CalendarState();
}

class __CalendarState extends State<_Calendar> {
  String currentDy = '';

  @override
  void initState() {
    setState(() {
      currentDy = DateFormat('dd.MM.yyyy').format(DateTime.now());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    final mobx = Provider.of<Mobx>(context);
    DateTime now = DateTime.now().subtract(Duration(
        hours: DateTime.now().hour,
        minutes: DateTime.now().minute,
        seconds: DateTime.now().second,
        milliseconds: DateTime.now().millisecond,
        microseconds: DateTime.now().microsecond));
    int weekday = now.weekday;
    MyGetxController myGetxController = Get.put(MyGetxController());

    // Находим последний понедельник
    DateTime lastMonday = now.subtract(Duration(days: weekday - 1));
    // Вычисляем дни недели для последних 7 дней
    List<DateTime> lastWeek = [];
    for (int i = 0; i < 7; i++) {
      lastWeek.add(lastMonday.add(Duration(days: i)));
    }
    int currentMonth = now.month;
    int currentYear = now.year;

// Создаем список для хранения всех дней следующих трех месяцев
    List<List<DateTime>> allDaysOfNextThreeMonths = [];

// Для каждого из следующих трех месяцев
    for (int i = 0; i < 3; i++) {
      // Находим следующий месяц после текущего
      DateTime nextMonth = DateTime(currentYear, currentMonth + i, 1);

      // Создаем список для хранения дней текущего месяца
      List<DateTime> daysOfMonth = [];

      // Находим последний день месяца
      DateTime lastDayOfMonth =
          DateTime(nextMonth.year, nextMonth.month + 1, 0);

      // Находим последний день месяца
      int firstWeekday = nextMonth.weekday;

      // Добавляем все дни текущего месяца в список
      for (int j = 0; j < firstWeekday; j++) {
        daysOfMonth.add(DateTime(1978));
      }
      // Добавляем все дни текущего месяца в список
      for (int j = 0; j < lastDayOfMonth.day; j++) {
        daysOfMonth.add(nextMonth.add(Duration(days: j)));
      }

      // Добавляем список дней текущего месяца в список всех дней
      allDaysOfNextThreeMonths.add(daysOfMonth);
    }

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:
            Color(0xff1B1C20), // Цвет фона пространства сверху экрана
        statusBarIconBrightness: Brightness
            .light, // Цвет иконок в пространстве сверху экрана (светлые или темные)
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5 * vw, vertical: 0 * vh),
            width: 100 * vw,
            color: Color(0xff1B1C20),
            child: Column(
              children: [
                // const Header(),
                const WeelDays(),
                Container(
                  alignment: Alignment.center,
                  width: 100 * vw,
                  child: Column(
                    children: [
                      for (int i = 0; i < 3; i++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 3 * vh,
                                bottom: 2 * vh,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 3 * vw),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      MonthToRus(
                                          allDaysOfNextThreeMonths[i][7].month),
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(235, 255, 255, 255),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                        fontSize: 4 * vw,
                                      ),
                                    ),
                                    Text(
                                      '${allDaysOfNextThreeMonths[i][7].year}',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(235, 255, 255, 255),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                        fontSize: 4 * vw,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Wrap(
                              runAlignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.start,
                              children: allDaysOfNextThreeMonths[i].map((date) {
                                return Container(
                                  margin: EdgeInsets.all(0),
                                  width: 12 * vw,
                                  height: 12 * vw,
                                  alignment: Alignment.center,
                                  // padding: EdgeInsets.all(5*vw), // Добавьте необходимый отступ между элементами
                                  child: date.year == 1978
                                      ? const Text('')
                                      : Container(
                                          child: date.isAfter(
                                                  now) // Проверка, что дата меньше текущей даты
                                              ? Container(
                                                  // ignore: unrelated_type_equality_checks
                                                  child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      currentDy = DateFormat(
                                                              'dd.MM.yyyy')
                                                          .format(date);
                                                    });
                                                  },
                                                  child: AnimatedContainer(
                                                    duration: Duration(
                                                        milliseconds: 250),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  50)),
                                                      gradient: RadialGradient(
                                                        colors: date.day ==
                                                                    int.parse(
                                                                        currentDy.split('.')[
                                                                            0]) &&
                                                                date.month ==
                                                                    int.parse(
                                                                        currentDy.split('.')[
                                                                            1])
                                                            ? [
                                                                const Color(
                                                                    0xFF4D8AEE),
                                                                const Color(
                                                                    0xFF2932FF),
                                                              ]
                                                            : [
                                                                Colors
                                                                    .transparent,
                                                                Colors
                                                                    .transparent
                                                              ],
                                                        center:
                                                            Alignment.center,
                                                        radius: 1.0,
                                                      ),
                                                    ),
                                                    width: 8 * vw,
                                                    height: 8 * vw,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      '${date.day}',
                                                      style: TextStyle(
                                                        color: const Color
                                                            .fromARGB(
                                                            238, 255, 255, 255),
                                                        fontFamily: 'Manrope',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 4 * vw,
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                              : GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      currentDy = DateFormat(
                                                              'dd.MM.yyyy')
                                                          .format(date);
                                                    });
                                                  },
                                                  child: Text(
                                                    '${date.day}',
                                                    style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              118,
                                                              255,
                                                              255,
                                                              255),
                                                      fontFamily: 'Manrope',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontSize: 4 * vw,
                                                    ),
                                                  ),
                                                ), // Если дата больше или равна текущей дате, возвращаем пустой виджет
                                        ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String NumToRus(int num) {
  switch (num) {
    case 1:
      return 'ПН';
    case 2:
      return 'ВТ';
    case 3:
      return 'СР';
    case 4:
      return 'ЧТ';
    case 5:
      return 'ПТ';
    case 6:
      return 'СБ';
    case 7:
      return 'ВС';
    default:
      return ''; // Обработка неправильного ввода
  }
}

String MonthToRus(int num) {
  switch (num) {
    case 1:
      return 'Январь';
    case 2:
      return 'Февраль';
    case 3:
      return 'Март';
    case 4:
      return 'Апрель';
    case 5:
      return 'Май';
    case 6:
      return 'Июнь';
    case 7:
      return 'Июль';
    case 8:
      return 'Август';
    case 9:
      return 'Сентябрь';
    case 10:
      return 'Октябрь';
    case 11:
      return 'Ноябрь';
    case 12:
      return 'Декабрь';
    default:
      return ''; // Обработка неправильного ввода
  }
}

// <================= Шапка =================>
class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final mobx = Provider.of<Mobx>(context);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [
                  Color(0xff4D8AEE),
                  Color(0xff2932FF), // Цвета для градиента
                ],
                begin: Alignment.centerLeft, // Начало градиента
                end: Alignment.centerRight, // Конец градиента
              ).createShader(bounds);
            },
            child: Observer(builder: (context) {
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Закрыть",
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    fontSize: 5 * vw,
                  ),
                ),
              );
            }),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "Календарь",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
              fontSize: 5 * vw,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "",
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
              fontSize: 5 * vw,
            ),
          ),
        ),
      ],
    );
  }
}

// <================= Дни недели =================>
class WeelDays extends StatefulWidget {
  const WeelDays({super.key});

  @override
  State<WeelDays> createState() => _WeelDaysState();
}

class _WeelDaysState extends State<WeelDays> {
  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    DateTime now = DateTime.now();
    int weekday = now.weekday;

    // Находим последний понедельник
    DateTime lastMonday = now.subtract(Duration(days: weekday - 1));
    // Вычисляем дни недели для последних 7 дней
    List<DateTime> lastWeek = [];
    for (int i = 0; i < 7; i++) {
      lastWeek.add(lastMonday.add(Duration(days: i)));
    }

    return Padding(
      padding: EdgeInsets.only(top: 5 * vh, bottom: 2 * vh),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: lastWeek.map((date) {
          return Container(
            width: 12 * vw,
            alignment: Alignment.center,
            child: Text(
              NumToRus(date.weekday),
              style: TextStyle(
                  color: const Color.fromARGB(158, 255, 255, 255),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                  fontSize: 3 * vw),
            ),
          );
        }).toList(),
      ),
    );
  }
}
