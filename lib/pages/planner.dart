import 'package:flutter/material.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/widgets/nitification/navbar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Planner extends StatefulWidget {
  const Planner({super.key});

  @override
  State<Planner> createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5 * vw),
        width: 100 * vw,
        color: Color(0xff1B1C20),
        child: Column(
          children: [
            const Expanded(flex: 1, child: Header()),
            const Expanded(flex: 2, child: Cal()),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 3 * vh, bottom: 4 * vh),
                  child: const Column(
                    children: [
                      TrainingCard(),
                      TestsCard(),
                      NutritionsCard(),
                      FixResiltsCard(),
                      NutritiosPriemCard(),
                      ConsultationsCard(),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(flex: 1, child: Navbar()),
          ],
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

// <============= Шапка ================>
class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Планировщик ",
          style: TextStyle(
              color: const Color.fromARGB(234, 255, 255, 255),
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
              fontSize: 7 * vw),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/calendar', // Переход на login
            );
          },
          icon: const Icon(
              color: Colors.blue,
              Icons
                  .calendar_today_outlined), // Иконка, которая будет отображаться на кнопке
        ),
      ],
    );
  }
}

// <============= Календарь ================>
class Cal extends StatefulWidget {
  const Cal({super.key});

  @override
  State<Cal> createState() => _CalState();
}

class _CalState extends State<Cal> {
  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    final mobx = Provider.of<Mobx>(context);
    DateTime now = DateTime.now();
    int weekday = now.weekday;

    // Находим последний понедельник
    DateTime lastMonday = now.subtract(Duration(days: weekday - 1));
    // Вычисляем дни недели для последних 7 дней
    List<DateTime> lastWeek = [];
    for (int i = 0; i < 7; i++) {
      lastWeek.add(lastMonday.add(Duration(days: i)));
    }

    return Container(
      margin: EdgeInsets.only(top: 2 * vh),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: lastWeek.map((date) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                NumToRus(date.weekday),
                style: TextStyle(
                    color: const Color.fromARGB(158, 255, 255, 255),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    fontSize: 3 * vw),
              ),
              SizedBox(
                height: 1 * vh,
              ),
              date.day == now.day
                  ? InkWell(
                    onTap: (){mobx.setCurrentDate(DateFormat('dd.MM.yyyy').format(date));},
                    child: Container(
                        width: 8 * vw,
                        height: 8 * vw,
                        alignment: Alignment.center,
                        // padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            gradient: const RadialGradient(
                              colors: [
                                Color(0xff4D8AEE),
                                Color(0xff2932FF)
                              ], // Цвета для радиального градиента
                              radius: 0.6, // Радиус градиента (от 0 до 1)
                              center:
                                  Alignment.center, // Центр радиального градиента
                            ),
                            borderRadius: BorderRadius.circular(100)),
                        child: Text(
                          "${date.day}",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                              fontSize: 4 * vw),
                        ),
                      ),
                  )
                  : InkWell(
                    onTap: (){mobx.setCurrentDate(DateFormat('dd.MM.yyyy').format(date));},
                    child: Container(
                        width: 8 * vw,
                        height: 8 * vw,
                        alignment: Alignment.center,
                        child: Text(
                          "${date.day}",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                              fontSize: 4 * vw),
                        ),
                      ),
                  )
            ],
          );
        }).toList(),
      ),
    );
  }
}

// <=============   Карточка тренировки ====================>
class TrainingCard extends StatefulWidget {
  const TrainingCard({super.key});

  @override
  State<TrainingCard> createState() => _TrainingCardState();
}

class _TrainingCardState extends State<TrainingCard> {
  bool trainingOnOff = false;
  @override
  Widget build(BuildContext context) {
    final mobx = Provider.of<Mobx>(context);
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 90 * vw,
            margin: EdgeInsets.only(top: 0 * vh),
            child: Column(
              children: [
                Observer(
                  builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Тренировки",
                            style: TextStyle(
                                color: const Color.fromARGB(220, 255, 255, 255),
                                fontSize: 5 * vw),
                          ),
                          !trainingOnOff
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      trainingOnOff = !trainingOnOff;
                                    });
                                  },
                                  icon: const Icon(Icons
                                      .arrow_forward_ios_rounded), // Иконка
                                  iconSize: 4 * vw,
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      trainingOnOff = !trainingOnOff;
                                    });
                                  },
                                  icon: const Icon(Icons
                                      .keyboard_arrow_down_rounded), // Иконка
                                  iconSize: 6 * vw,
                                ),
                        ],
                      ),
                      mobx.userExercisesOnDay(mobx.currentDate).length > 0
                          ? Container(
                              width: 11 * vw,
                              height: 6 * vw,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  gradient: const RadialGradient(
                                    colors: [
                                      Color(0xff4D8AEE),
                                      Color(0xff2932FF)
                                    ], // Цвета для радиального градиента
                                    radius: 0.6, // Радиус градиента (от 0 до 1)
                                    center: Alignment
                                        .center, // Центр радиального градиента
                                  ),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Text(
                                mobx
                                    .userExercisesOnDay(mobx.currentDate)
                                    .length
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                    fontSize: 3.5 * vw),
                              ),
                            )
                          : Container(
                              width: 11 * vw,
                              height: 6 * vw,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  gradient: const RadialGradient(
                                    colors: [
                                      Color.fromARGB(83, 235, 238, 247),
                                      Color.fromARGB(69, 235, 238, 247)
                                    ], // Цвета для радиального градиента
                                    radius: 0.6, // Радиус градиента (от 0 до 1)
                                    center: Alignment
                                        .center, // Центр радиального градиента
                                  ),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Text(
                                '0',
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        115, 255, 255, 255),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 3.5 * vw),
                              ),
                            ),
                    ],
                  ),
                ),
                trainingOnOff
                    // ignore: dead_code
                    ? Column(
                        children: mobx
                            .userExercisesOnDay(mobx.currentDate)
                            .map((e) {
                              final uniqueKey = UniqueKey();
                               return Container(
                              margin: EdgeInsets.only(top:1*vh),
                              child: Slidable(
                                    key: uniqueKey,
                                    endActionPane: ActionPane(
                                        motion: const BehindMotion(),
                                        key: uniqueKey,
                                        dismissible: DismissiblePane(
                                          key: UniqueKey(),
                                          onDismissed: () => print('delete'),
                                        ),
                                        children: [
                                          SlidableAction(
                                            onPressed: (context) {},
                                            backgroundColor: Colors.red,
                                            
                                            // icon: Icons.delete,
                                            label: "Отменить",
                                            borderRadius: BorderRadius.circular(20),
                                          )
                                        ]),
                                    child: Container(
                                      padding: EdgeInsets.all(4 * vw),
                                      decoration: BoxDecoration(
                                          color: Color(0xff23252B),
                                          borderRadius:
                                              BorderRadius.circular(5 * vw)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            e['name'].toString(),
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    210, 255, 255, 255),
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w600,
                                                decoration: TextDecoration.none,
                                                fontSize: 4 * vw),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                trainingOnOff = !trainingOnOff;
                                              });
                                            },
                                            icon: const Icon(Icons
                                                .arrow_forward_ios_rounded), // Иконка
                                            iconSize: 6 * vw,
                                          ),
                                        ],
                                      ),
                                    ),
                              ),
                            );}
                            )
                            .toList(), // Преобразуйте список объектов Text в список виджетов
                      )
                    : Container(), // Вернуть пустой контейнер, если trainingOnOff равно false
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// <=============   Карточка Тестов ====================>
class TestsCard extends StatefulWidget {
  const TestsCard({super.key});

  @override
  State<TestsCard> createState() => _TestsCardState();
}

class _TestsCardState extends State<TestsCard> {
  bool trainingOnOff = false;
  @override
  Widget build(BuildContext context) {
    final mobx = Provider.of<Mobx>(context);
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Observer(
              builder: (_) => Container(
                    width: 90 * vw,
                    margin: EdgeInsets.only(top: 3 * vh),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Тесты",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          220, 255, 255, 255),
                                      fontSize: 5 * vw),
                                ),
                                !trainingOnOff
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            trainingOnOff = !trainingOnOff;
                                          });
                                        },
                                        icon: const Icon(Icons
                                            .arrow_forward_ios_rounded), // Иконка
                                        iconSize: 4 * vw,
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            trainingOnOff = !trainingOnOff;
                                          });
                                        },
                                        icon: const Icon(Icons
                                            .keyboard_arrow_down_rounded), // Иконка
                                        iconSize: 6 * vw,
                                      ),
                              ],
                            ),
                            mobx.userTestsOnDay(mobx.currentDate).length > 0
                                ? Container(
                                    width: 11 * vw,
                                    height: 6 * vw,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        gradient: const RadialGradient(
                                          colors: [
                                            Color(0xff4D8AEE),
                                            Color(0xff2932FF)
                                          ], // Цвета для радиального градиента
                                          radius:
                                              0.6, // Радиус градиента (от 0 до 1)
                                          center: Alignment
                                              .center, // Центр радиального градиента
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      mobx
                                          .userTestsOnDay(mobx.currentDate)
                                          .length
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.none,
                                          fontSize: 3.5 * vw),
                                    ),
                                  )
                                : Container(
                                    width: 11 * vw,
                                    height: 6 * vw,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        gradient: const RadialGradient(
                                          colors: [
                                            Color.fromARGB(83, 235, 238, 247),
                                            Color.fromARGB(69, 235, 238, 247)
                                          ], // Цвета для радиального градиента
                                          radius:
                                              0.6, // Радиус градиента (от 0 до 1)
                                          center: Alignment
                                              .center, // Центр радиального градиента
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              115, 255, 255, 255),
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.none,
                                          fontSize: 3.5 * vw),
                                    ),
                                  ),
                          ],
                        ),
                        trainingOnOff
                            // ignore: dead_code
                            ? Column(
                                children: mobx
                                    .userTestsOnDay(mobx.currentDate)
                                    .map((e) => Container(
                                      margin: EdgeInsets.only(top:1*vh),
                                      child: Slidable(
                                      key: UniqueKey(),
                                      endActionPane: ActionPane(
                                          motion: const BehindMotion(),
                                          dismissible: DismissiblePane(
                                            key: UniqueKey(),
                                            onDismissed: () => print('delete'),
                                          ),
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) {},
                                              backgroundColor: Colors.red,
                                              
                                              // icon: Icons.delete,
                                              label: "Отменить",
                                              borderRadius: BorderRadius.circular(20),
                                            )
                                          ]),
                                      child:  Container(
                                              padding: EdgeInsets.all(4 * vw),
                                              decoration: BoxDecoration(
                                                  color: Color(0xff23252B),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5 * vw)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 70 * vw,
                                                    child: Text(
                                                      e['name'].toString(),
                                                      style: TextStyle(
                                                          color: const Color
                                                              .fromARGB(
                                                              210, 255, 255, 255),
                                                          fontFamily: 'Manrope',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          decoration:
                                                              TextDecoration.none,
                                                          fontSize: 4 * vw),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        trainingOnOff =
                                                            !trainingOnOff;
                                                      });
                                                    },
                                                    icon: const Icon(Icons
                                                        .arrow_forward_ios_rounded), // Иконка
                                                    iconSize: 6 * vw,
                                                  ),
                                                ],
                                              ),
                                            ),
                                      ),
                                    ))
                                    .toList(), // Преобразуйте список объектов Text в список виджетов
                              )
                            : Container(), // Вернуть пустой контейнер, если trainingOnOff равно false
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}

// <=============   Карточка Питания ====================>
class NutritionsCard extends StatefulWidget {
  const NutritionsCard({super.key});

  @override
  State<NutritionsCard> createState() => _NutritionsCardState();
}

class _NutritionsCardState extends State<NutritionsCard> {
  bool trainingOnOff = false;
  @override
  Widget build(BuildContext context) {
    final mobx = Provider.of<Mobx>(context);
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    DateTime currentDate = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Observer(
              builder: (_) => Container(
                    width: 90 * vw,
                    margin: EdgeInsets.only(top: 3 * vh),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Питание",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          220, 255, 255, 255),
                                      fontSize: 5 * vw),
                                ),
                                !trainingOnOff
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            trainingOnOff = !trainingOnOff;
                                          });
                                        },
                                        icon: const Icon(Icons
                                            .arrow_forward_ios_rounded), // Иконка
                                        iconSize: 4 * vw,
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            trainingOnOff = !trainingOnOff;
                                          });
                                        },
                                        icon: const Icon(Icons
                                            .keyboard_arrow_down_rounded), // Иконка
                                        iconSize: 6 * vw,
                                      ),
                              ],
                            ),
                            mobx.userNutritionsOnDay(mobx.currentDate).length >
                                    0
                                ? Container(
                                    width: 11 * vw,
                                    height: 6 * vw,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        gradient: const RadialGradient(
                                          colors: [
                                            Color(0xff4D8AEE),
                                            Color(0xff2932FF)
                                          ], // Цвета для радиального градиента
                                          radius:
                                              0.6, // Радиус градиента (от 0 до 1)
                                          center: Alignment
                                              .center, // Центр радиального градиента
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      mobx
                                          .userNutritionsOnDay(mobx.currentDate)
                                          .length
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.none,
                                          fontSize: 3.5 * vw),
                                    ),
                                  )
                                : Container(
                                    width: 11 * vw,
                                    height: 6 * vw,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        gradient: const RadialGradient(
                                          colors: [
                                            Color.fromARGB(83, 235, 238, 247),
                                            Color.fromARGB(69, 235, 238, 247)
                                          ], // Цвета для радиального градиента
                                          radius:
                                              0.6, // Радиус градиента (от 0 до 1)
                                          center: Alignment
                                              .center, // Центр радиального градиента
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              115, 255, 255, 255),
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.none,
                                          fontSize: 3.5 * vw),
                                    ),
                                  ),
                          ],
                        ),
                        trainingOnOff
                            // ignore: dead_code
                            ? Column(
                                children: mobx
                                    .userNutritionsOnDay(mobx.currentDate)
                                    .map((e) => Container(
                                      margin: EdgeInsets.only(top:1*vh),
                                      child: Slidable(
                                      key: UniqueKey(),
                                      endActionPane: ActionPane(
                                          motion: const BehindMotion(),
                                          dismissible: DismissiblePane(
                                            key: UniqueKey(),
                                            onDismissed: () => print('delete'),
                                          ),
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) {},
                                              backgroundColor: Colors.red,
                                              
                                              // icon: Icons.delete,
                                              label: "Отменить",
                                              borderRadius: BorderRadius.circular(20),
                                            )
                                          ]),
                                      child: Container(
                                              padding: EdgeInsets.all(4 * vw),
                                              decoration: BoxDecoration(
                                                  color: Color(0xff23252B),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5 * vw)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    e['name'].toString(),
                                                    style: TextStyle(
                                                        color: const Color.fromARGB(
                                                            210, 255, 255, 255),
                                                        fontFamily: 'Manrope',
                                                        fontWeight: FontWeight.w600,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 4 * vw),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        trainingOnOff =
                                                            !trainingOnOff;
                                                      });
                                                    },
                                                    icon: const Icon(Icons
                                                        .arrow_forward_ios_rounded), // Иконка
                                                    iconSize: 6 * vw,
                                                  ),
                                                ],
                                              ),
                                            ),
                                      ),
                                    ))
                                    .toList(), // Преобразуйте список объектов Text в список виджетов
                              )
                            : Container(), // Вернуть пустой контейнер, если trainingOnOff равно false
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}

// <=============   Карточка Фиксация результатов ====================>
class FixResiltsCard extends StatefulWidget {
  const FixResiltsCard({super.key});

  @override
  State<FixResiltsCard> createState() => _FixResiltsCardState();
}

class _FixResiltsCardState extends State<FixResiltsCard> {
  bool trainingOnOff = false;
  @override
  Widget build(BuildContext context) {
    final mobx = Provider.of<Mobx>(context);
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Observer(
              builder: (_) => Container(
                    width: 90 * vw,
                    margin: EdgeInsets.only(top: 3 * vh),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Фиксация результатов",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          220, 255, 255, 255),
                                      fontSize: 5 * vw),
                                ),
                                !trainingOnOff
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            trainingOnOff = !trainingOnOff;
                                          });
                                        },
                                        icon: const Icon(Icons
                                            .arrow_forward_ios_rounded), // Иконка
                                        iconSize: 4 * vw,
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            trainingOnOff = !trainingOnOff;
                                          });
                                        },
                                        icon: const Icon(Icons
                                            .keyboard_arrow_down_rounded), // Иконка
                                        iconSize: 6 * vw,
                                      ),
                              ],
                            ),
                            mobx.userFixResultsOnDay(mobx.currentDate).length >
                                    0
                                ? Container(
                                    width: 11 * vw,
                                    height: 6 * vw,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        gradient: const RadialGradient(
                                          colors: [
                                            Color(0xff4D8AEE),
                                            Color(0xff2932FF)
                                          ], // Цвета для радиального градиента
                                          radius:
                                              0.6, // Радиус градиента (от 0 до 1)
                                          center: Alignment
                                              .center, // Центр радиального градиента
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      mobx
                                          .userFixResultsOnDay(mobx.currentDate)
                                          .length
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.none,
                                          fontSize: 3.5 * vw),
                                    ),
                                  )
                                : Container(
                                    width: 11 * vw,
                                    height: 6 * vw,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        gradient: const RadialGradient(
                                          colors: [
                                            Color.fromARGB(83, 235, 238, 247),
                                            Color.fromARGB(69, 235, 238, 247)
                                          ], // Цвета для радиального градиента
                                          radius:
                                              0.6, // Радиус градиента (от 0 до 1)
                                          center: Alignment
                                              .center, // Центр радиального градиента
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              115, 255, 255, 255),
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.none,
                                          fontSize: 3.5 * vw),
                                    ),
                                  ),
                          ],
                        ),
                        trainingOnOff
                            // ignore: dead_code
                            ? Column(
                                children: mobx
                                    .userFixResultsOnDay(mobx.currentDate)
                                    .map((e) => Container(
                                      margin: EdgeInsets.only(top:1*vh),
                                      child: Slidable(
                                      key: UniqueKey(),
                                      endActionPane: ActionPane(
                                          motion: const BehindMotion(),
                                          dismissible: DismissiblePane(
                                            key: UniqueKey(),
                                            onDismissed: () => print('delete'),
                                          ),
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) {},
                                              backgroundColor: Colors.red,
                                              
                                              // icon: Icons.delete,
                                              label: "Отменить",
                                              borderRadius: BorderRadius.circular(20),
                                            )
                                          ]),
                                      child: Container(
                                              padding: EdgeInsets.all(4 * vw),
                                              decoration: BoxDecoration(
                                                  color: Color(0xff23252B),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5 * vw)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    e['name'].toString(),
                                                    style: TextStyle(
                                                        color: const Color.fromARGB(
                                                            210, 255, 255, 255),
                                                        fontFamily: 'Manrope',
                                                        fontWeight: FontWeight.w600,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 4 * vw),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        trainingOnOff =
                                                            !trainingOnOff;
                                                      });
                                                    },
                                                    icon: const Icon(Icons
                                                        .arrow_forward_ios_rounded), // Иконка
                                                    iconSize: 6 * vw,
                                                  ),
                                                ],
                                              ),
                                            ),
                                      ),
                                    ))
                                    .toList(), // Преобразуйте список объектов Text в список виджетов
                              )
                            : Container(), // Вернуть пустой контейнер, если trainingOnOff равно false
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}

// <=============   Карточка Прием нутриентов ====================>
class NutritiosPriemCard extends StatefulWidget {
  const NutritiosPriemCard({super.key});

  @override
  State<NutritiosPriemCard> createState() => _NutritiosPriemCardState();
}

class _NutritiosPriemCardState extends State<NutritiosPriemCard> {
  bool trainingOnOff = false;
  @override
  Widget build(BuildContext context) {
    final mobx = Provider.of<Mobx>(context);
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Observer(
              builder: (_) => Container(
                    width: 90 * vw,
                    margin: EdgeInsets.only(top: 3 * vh),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Прием нутриентов",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          220, 255, 255, 255),
                                      fontSize: 5 * vw),
                                ),
                                !trainingOnOff
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            trainingOnOff = !trainingOnOff;
                                          });
                                        },
                                        icon: const Icon(Icons
                                            .arrow_forward_ios_rounded), // Иконка
                                        iconSize: 4 * vw,
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            trainingOnOff = !trainingOnOff;
                                          });
                                        },
                                        icon: const Icon(Icons
                                            .keyboard_arrow_down_rounded), // Иконка
                                        iconSize: 6 * vw,
                                      ),
                              ],
                            ),
                            mobx
                                        .userNutritionsPriemOnDay(
                                            mobx.currentDate)
                                        .length >
                                    0
                                ? Container(
                                    width: 11 * vw,
                                    height: 6 * vw,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        gradient: const RadialGradient(
                                          colors: [
                                            Color(0xff4D8AEE),
                                            Color(0xff2932FF)
                                          ], // Цвета для радиального градиента
                                          radius:
                                              0.6, // Радиус градиента (от 0 до 1)
                                          center: Alignment
                                              .center, // Центр радиального градиента
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      mobx
                                          .userNutritionsPriemOnDay(
                                              mobx.currentDate)
                                          .length
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.none,
                                          fontSize: 3.5 * vw),
                                    ),
                                  )
                                : Container(
                                    width: 11 * vw,
                                    height: 6 * vw,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        gradient: const RadialGradient(
                                          colors: [
                                            Color.fromARGB(83, 235, 238, 247),
                                            Color.fromARGB(69, 235, 238, 247)
                                          ], // Цвета для радиального градиента
                                          radius:
                                              0.6, // Радиус градиента (от 0 до 1)
                                          center: Alignment
                                              .center, // Центр радиального градиента
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              115, 255, 255, 255),
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.none,
                                          fontSize: 3.5 * vw),
                                    ),
                                  ),
                          ],
                        ),
                        trainingOnOff
                            // ignore: dead_code
                            ? Column(
                                children: mobx
                                    .userNutritionsPriemOnDay(mobx.currentDate)
                                    .map((e) => Container(
                                      margin: EdgeInsets.only(top:1*vh),
                                      child: Slidable(
                                      key: UniqueKey(),
                                      endActionPane: ActionPane(
                                          motion: const BehindMotion(),
                                          dismissible: DismissiblePane(
                                            key: UniqueKey(),
                                            onDismissed: () => print('delete'),
                                          ),
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) {},
                                              backgroundColor: Colors.red,
                                              
                                              // icon: Icons.delete,
                                              label: "Отменить",
                                              borderRadius: BorderRadius.circular(20),
                                            )
                                          ]),
                                      child: Container(
                                              padding: EdgeInsets.all(4 * vw),
                                              decoration: BoxDecoration(
                                                  color: Color(0xff23252B),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5 * vw)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    e['name'].toString(),
                                                    style: TextStyle(
                                                        color: const Color.fromARGB(
                                                            210, 255, 255, 255),
                                                        fontFamily: 'Manrope',
                                                        fontWeight: FontWeight.w600,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 4 * vw),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        trainingOnOff =
                                                            !trainingOnOff;
                                                      });
                                                    },
                                                    icon: const Icon(Icons
                                                        .arrow_forward_ios_rounded), // Иконка
                                                    iconSize: 6 * vw,
                                                  ),
                                                ],
                                              ),
                                            ),
                                      ),
                                    ))
                                    .toList(), // Преобразуйте список объектов Text в список виджетов
                              )
                            : Container(), // Вернуть пустой контейнер, если trainingOnOff равно false
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}

// <=============   Карточка Консультации ====================>
class ConsultationsCard extends StatefulWidget {
  const ConsultationsCard({super.key});

  @override
  State<ConsultationsCard> createState() => _ConsultationsCardState();
}

class _ConsultationsCardState extends State<ConsultationsCard> {
  bool trainingOnOff = false;
  @override
  Widget build(BuildContext context) {
    final mobx = Provider.of<Mobx>(context);
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Observer(
              builder: (_) => Container(
                    width: 90 * vw,
                    margin: EdgeInsets.only(top: 3 * vh),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Консультации",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          220, 255, 255, 255),
                                      fontSize: 5 * vw),
                                ),
                                !trainingOnOff
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            trainingOnOff = !trainingOnOff;
                                          });
                                        },
                                        icon: const Icon(Icons
                                            .arrow_forward_ios_rounded), // Иконка
                                        iconSize: 4 * vw,
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            trainingOnOff = !trainingOnOff;
                                          });
                                        },
                                        icon: const Icon(Icons
                                            .keyboard_arrow_down_rounded), // Иконка
                                        iconSize: 6 * vw,
                                      ),
                              ],
                            ),
                            mobx
                                        .userConsultationsOnDay(
                                            mobx.currentDate)
                                        .length >
                                    0
                                ? Container(
                                    width: 11 * vw,
                                    height: 6 * vw,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        gradient: const RadialGradient(
                                          colors: [
                                            Color(0xff4D8AEE),
                                            Color(0xff2932FF)
                                          ], // Цвета для радиального градиента
                                          radius:
                                              0.6, // Радиус градиента (от 0 до 1)
                                          center: Alignment
                                              .center, // Центр радиального градиента
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      mobx
                                          .userConsultationsOnDay(
                                              mobx.currentDate)
                                          .length
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.none,
                                          fontSize: 3.5 * vw),
                                    ),
                                  )
                                : Container(
                                    width: 11 * vw,
                                    height: 6 * vw,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        gradient: const RadialGradient(
                                          colors: [
                                            Color.fromARGB(83, 235, 238, 247),
                                            Color.fromARGB(69, 235, 238, 247)
                                          ], // Цвета для радиального градиента
                                          radius:
                                              0.6, // Радиус градиента (от 0 до 1)
                                          center: Alignment
                                              .center, // Центр радиального градиента
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              115, 255, 255, 255),
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.none,
                                          fontSize: 3.5 * vw),
                                    ),
                                  ),
                          ],
                        ),
                        trainingOnOff
                            // ignore: dead_code
                            ? Column(
                                children: mobx
                                    .userConsultationsOnDay(mobx.currentDate)
                                    .map((e) => Container(
                                      margin: EdgeInsets.only(top:1*vh),
                                      child: Slidable(
                                      key: UniqueKey(),
                                      endActionPane: ActionPane(
                                          motion: const BehindMotion(),
                                          dismissible: DismissiblePane(
                                            key: UniqueKey(),
                                            onDismissed: () => print('delete'),
                                          ),
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) {},
                                              backgroundColor: Colors.red,
                                              
                                              // icon: Icons.delete,
                                              label: "Отменить",
                                              borderRadius: BorderRadius.circular(20),
                                            )
                                          ]),
                                      child: Container(
                                              padding: EdgeInsets.all(4 * vw),
                                              decoration: BoxDecoration(
                                                  color: Color(0xff23252B),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5 * vw)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 70 * vw,
                                                    child: Text(
                                                      e['name'].toString(),
                                                      style: TextStyle(
                                                          color: const Color
                                                              .fromARGB(
                                                              210, 255, 255, 255),
                                                          fontFamily: 'Manrope',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          decoration:
                                                              TextDecoration.none,
                                                          fontSize: 4 * vw),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        trainingOnOff =
                                                            !trainingOnOff;
                                                      });
                                                    },
                                                    icon: const Icon(Icons
                                                        .arrow_forward_ios_rounded), // Иконка
                                                    iconSize: 6 * vw,
                                                  ),
                                                ],
                                              ),
                                            ),
                                      ),
                                    ))
                                    .toList(), // Преобразуйте список объектов Text в список виджетов
                              )
                            : Container(), // Вернуть пустой контейнер, если trainingOnOff равно false
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}
