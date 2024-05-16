import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/mobx/mobx.dart';

class AddSportProgrammPage extends StatefulWidget {
  const AddSportProgrammPage({super.key});

  @override
  State<AddSportProgrammPage> createState() => _AddSportProgrammPageState();
}

class _AddSportProgrammPageState extends State<AddSportProgrammPage> {
  int page = 0;

  void setPgae(newPage) {
    setState(() {
      page = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height / 100;
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons
              .arrow_back_ios_new_rounded), // Устанавливаем иконку "домой" вместо стрелки "назад"
          onPressed: () {
            switch (page) {
              case 0:
                Navigator.pushReplacementNamed(context, '/service');
                break;
              default:
              Navigator.pop(context);
              setPgae(0);
            }
            
          },
        ),
        title: Text(arguments['nameRu']),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
        backgroundColor: const Color(0xff1B1C20),
        actions: [
          page ==0 ?
          Container(
              padding: const EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    page = 0;
                  });
                  showCupertinoModalPopup(
                      context: context,
                      builder: (_) => ModalCurrentType(
                            setPage: setPgae,
                          ));
                  // page++;
                },
                icon: SvgPicture.asset(
                  'assets/img/blue_plus.svg',
                ),
              )):SizedBox.shrink(),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 90 * vh,
            width: double.infinity,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: TextField(
                    cursorColor: const Color.fromARGB(255, 112, 112, 112),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    decoration: InputDecoration(
                      hintText: 'Найти...',
                      filled: true, // Set to true to fill the background
                      fillColor: const Color(0xff23252B), // Set background color
                      hintStyle: const TextStyle(
                          color: Colors.grey), // Customize hint text color
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 1.5),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // Remove border
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none, // Remove border
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                page == 1 ? _Calendar() : SizedBox.shrink(),
                Container(
                  alignment: Alignment.center,
                  height: 70*vh,
                  child: const Text(
                    'Здесь пока ничего нет',
                    style: TextStyle(color: Colors.white38),
                  ),
                )
              ],
            ),
          ),
          page ==0 ?
          Positioned(
              bottom: 20,
              right: 15,
              left: 15,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const RadialGradient(radius: 5, colors: [
                      Color(0xFF4D8AEE),
                      Color(0xFF2932FF),
                    ])),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      backgroundColor: Colors.transparent),
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {},
                ),
              )):SizedBox.shrink(),
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

    DateTime now = DateTime.now().subtract(Duration(
        hours: DateTime.now().hour,
        minutes: DateTime.now().minute,
        seconds: DateTime.now().second,
        milliseconds: DateTime.now().millisecond,
        microseconds: DateTime.now().microsecond));
    int weekday = now.weekday;

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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5 * vw, vertical: 0 * vh),
      width: 100 * vw,
      height: 77 * vh,
      color: Color(0xff1B1C20),
      child: Stack(
        children: [
          ListView(
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
                              padding: EdgeInsets.symmetric(horizontal: 3 * vw),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    MonthToRus(
                                        allDaysOfNextThreeMonths[i][7].month),
                                    style: TextStyle(
                                      color: Color.fromARGB(235, 255, 255, 255),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.none,
                                      fontSize: 4 * vw,
                                    ),
                                  ),
                                  Text(
                                    '${allDaysOfNextThreeMonths[i][7].year}',
                                    style: TextStyle(
                                      color: Color.fromARGB(235, 255, 255, 255),
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
                                                    currentDy =
                                                        DateFormat('dd.MM.yyyy')
                                                            .format(date);
                                                  });
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 250),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                50)),
                                                    gradient: RadialGradient(
                                                      colors: date.day ==
                                                                  int.parse(
                                                                      currentDy.split(
                                                                              '.')[
                                                                          0]) &&
                                                              date.month ==
                                                                  int.parse(
                                                                      currentDy.split(
                                                                              '.')[
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
                                                              Colors.transparent
                                                            ],
                                                      center: Alignment.center,
                                                      radius: 1.0,
                                                    ),
                                                  ),
                                                  width: 8 * vw,
                                                  height: 8 * vw,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    '${date.day}',
                                                    style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              238,
                                                              255,
                                                              255,
                                                              255),
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
                                                    currentDy =
                                                        DateFormat('dd.MM.yyyy')
                                                            .format(date);
                                                  });
                                                },
                                                child: Text(
                                                  '${date.day}',
                                                  style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        118, 255, 255, 255),
                                                    fontFamily: 'Manrope',
                                                    fontWeight: FontWeight.w500,
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
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const RadialGradient(radius: 5, colors: [
                      Color(0xFF4D8AEE),
                      Color(0xFF2932FF),
                    ])),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.transparent),
                  child: const Text(
                    'Далее',
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

class ModalCurrentType extends StatefulWidget {
  ModalCurrentType({super.key, required this.setPage});
  Function setPage;

  @override
  State<ModalCurrentType> createState() => _ModalCurrentTypeState();
}

class _ModalCurrentTypeState extends State<ModalCurrentType> {
  List<String> categoryList = [
    'Питание',
    "Тренировки",
    "Тесты",
    "Упражнения",
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
                      widget.setPage(1);
                      Navigator.pop(context);
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
