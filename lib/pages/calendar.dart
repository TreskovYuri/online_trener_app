import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/getx_controller.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    final mobx = Provider.of<Mobx>(context);
    DateTime now = DateTime.now().subtract(Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute, seconds: DateTime.now().second, milliseconds: DateTime.now().millisecond, microseconds: DateTime.now().microsecond));
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

// Выводим результаты
    // print('Дни следующих трех месяцев:');
    // print('Текущая дата:${now.day}');

    // for (int i = 0; i < 3; i++) {
    //   DateTime nextMonth = DateTime(currentYear, currentMonth + i, 1);

    //   print('Месяц: ${nextMonth.month}');
    //   allDaysOfNextThreeMonths[i].forEach((date) {
    //     print(date);
    //   });
    // }

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
            padding: EdgeInsets.symmetric(horizontal:5 * vw,vertical: 7*vh),
            width: 100 * vw,
            color: Color(0xff1B1C20),
            child: Column(
              children: [
                const Header(),
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
                                          child: date.isAfter(now) // Проверка, что дата меньше текущей даты
                                              ? Container(
                                                  // ignore: unrelated_type_equality_checks
                                                  child:
                                                      date.day == now.day + 1 &&
                                                              date.month ==
                                                                  now.month
                                                          ? InkWell(
                                                              onTap: () {
                                                                myGetxController.setUserExercisesOnDay(DateFormat('dd.MM.yyyy').format(date));
                                                                myGetxController.setCurrentDate(DateFormat('dd.MM.yyyy').format(date));
                                                                mobx.setCurrentDate(
                                                                    DateFormat(
                                                                            'dd.MM.yyyy')
                                                                        .format(
                                                                            date));
                                                                  Navigator.pop(context);
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              50)),
                                                                  gradient:
                                                                      RadialGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFF4D8AEE),
                                                                      Color(
                                                                          0xFF2932FF),
                                                                    ],
                                                                    center: Alignment
                                                                        .center,
                                                                    radius: 1.0,
                                                                  ),
                                                                ),
                                                                width: 6 * vw,
                                                                height: 6 * vw,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  '${date.day}',
                                                                  style:
                                                                      TextStyle(
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        238,
                                                                        255,
                                                                        255,
                                                                        255),
                                                                    fontFamily:
                                                                        'Manrope',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        4 * vw,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : GestureDetector(
                                                              onTap: () {
                                                                myGetxController.setUserExercisesOnDay(DateFormat('dd.MM.yyyy').format(date));
                                                                myGetxController.setCurrentDate(DateFormat('dd.MM.yyyy').format(date));
                                                      if(mobx.user['post'] == 'Тренер' || mobx.user['post'] == 'Супер тренер'){
                                                          Navigator.pop(context);
                                                      }else{
                                                          Navigator.pop(context);
                                                      }
                                                              },
                                                              child: Text(
                                                                '${date.day}',
                                                                style:
                                                                    TextStyle(
                                                                  color: const Color.fromARGB(240,255,255, 255),
                                                                  fontFamily:'Manrope',fontWeight:FontWeight.w600,decoration:
                                                                      TextDecoration.none,
                                                                  fontSize:4 * vw,),
                                                              ),
                                                            ))
                                              : GestureDetector(
                                                  onTap: () {
                                                    mobx.setCurrentDate(DateFormat('dd.MM.yyyy').format(date));
                                                      if(mobx.user['post'] == 'Тренер' || mobx.user['post'] == 'Супер тренер'){
                                                          Navigator.pushReplacementNamed(context, '/journal');
                                                      }else{
                                                          Navigator.pushReplacementNamed(context, '/planner');
                                                      }
                                                  },
                                                  child: Text(
                                                    '${date.day}',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          118, 255, 255, 255),
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
            child: Observer(
              builder: (context) {
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
              }
            ),
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
