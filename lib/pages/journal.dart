import 'package:flutter/material.dart';
import 'package:trener_app/getx/getx_controller.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';

class Journal extends StatefulWidget {
  const Journal({super.key});

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  ScrollController _scrollController = ScrollController();
  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _isAtTop = _scrollController.position.pixels == 0;
    });
  }

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

    return Scaffold(

        // extendBody: true,
        body: SafeArea(
            child: Stack(
          fit: StackFit.expand,
          children: [
            ListView(
              controller: _scrollController,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(2 * vw, 3 * vh,2*vw,7*vh),
                  width: 100 * vw,
                  color: Color(0xff1B1C20),
                  child: Column(
                    children: [
                      Header(),
                      Cal(),
                      Padding(
                          padding: EdgeInsets.only(top: 3 * vh, bottom: 4 * vh),
                          child: Column(
                            children: mobx
                                .trenerDataOnDay(mobx.currentDate)
                                .map((e) => Container(
                                        child: UserCard(
                                      array: e,
                                    )))
                                .toList(),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            _isAtTop?Navbar():NavbarScroll()
          ],
        )),
        // bottomNavigationBar: _isAtTop ? Navbar() : NavbarScroll()
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

//<================  Карточка пользователя =================>
class UserCard extends StatefulWidget {
  final Map<String, dynamic> array;

  UserCard({super.key, required this.array});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  bool modalFlag = false;

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    final mobx = Provider.of<Mobx>(context);
    List<Map<String,dynamic>> sets = widget.array['state'];
    MyGetxController myGetxController = Get.put(MyGetxController());

    return Container(
      padding: EdgeInsets.all(1 * vw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    widget.array['username'],
                    style: TextStyle(
                        color: const Color.fromARGB(223, 255, 255, 255),
                        fontSize: 5 * vw,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: modalFlag
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  modalFlag = !modalFlag;
                                });
                              },
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded), // Иконка
                              iconSize: 6 * vw,
                            )
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  modalFlag = !modalFlag;
                                });
                              },
                              icon: const Icon(
                                  Icons.arrow_forward_ios_rounded), // Иконка
                              iconSize: 4 * vw,
                            ))
                ],
              ),
              Container(
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
                      center: Alignment.center, // Центр радиального градиента
                    ),
                    borderRadius: BorderRadius.circular(100)),
                child: Obx(() => Text(
                      myGetxController.getx.userExercisesOnDay.length
                          .toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                          fontSize: 3.5 * vw),
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding:
                    EdgeInsets.symmetric(vertical: 2 * vw, horizontal: 5 * vw),
                decoration: BoxDecoration(
                    color: Color.fromARGB(23, 152, 154, 161),
                    borderRadius: BorderRadius.circular(10 * vw)),
                child: Text(
                  widget.array['post'],
                  style: TextStyle(
                      color: const Color.fromARGB(189, 255, 255, 255),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      fontSize: 3 * vw),
                ),
              ),
              SizedBox(
                width: 1 * vw,
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(vertical: 2 * vw, horizontal: 5 * vw),
                decoration: BoxDecoration(
                    color: Color.fromARGB(23, 152, 154, 161),
                    borderRadius: BorderRadius.circular(10 * vw)),
                child: Text(
                  widget.array['team'],
                  style: TextStyle(
                      color: const Color.fromARGB(189, 255, 255, 255),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      fontSize: 3 * vw),
                ),
              ),
            ],
          ),
          modalFlag
              ? Container(
                  child: Column(
                    children: sets.map((e) => GestureDetector(
                              onTap: () {
                                if(e['type']=='training'){
                                Navigator.pushNamed(
                                    context, '/training_details_trener',
                                    arguments: e);
                                }

                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 1 * vh),
                                  child: Slidable(
                                    key: UniqueKey(),
                                    endActionPane: ActionPane(
                                        motion: const BehindMotion(),
                                        key: UniqueKey(),
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          )
                                        ]),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2 * vw, horizontal: 4 * vw),
                                      decoration: BoxDecoration(
                                          color: Color(0xff23252B),
                                          borderRadius:
                                              BorderRadius.circular(5 * vw)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 60 * vw,
                                            child: Text(
                                              e['name'].toString(),
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      210, 255, 255, 255),
                                                  fontFamily: 'Manrope',
                                                  fontWeight: FontWeight.w600,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 3 * vw),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                debugPrint('dev');
                                              });
                                            },
                                            icon: const Icon(Icons
                                                .arrow_forward_ios_rounded), // Иконка
                                            iconSize: 4 * vw,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ))
                        .toList(),
                  ),
                )
              : Container()
        ],
      ),
    );
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

    return Padding(
      padding: EdgeInsets.all(3 * vw),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Журнал ",
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
      ),
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
  final mobx = Mobx();
  MyGetxController myGetxController = Get.put(MyGetxController());
  DateTime now = DateTime.now();
  @override
  void initState() {
    DateTime now = DateTime.now();
    mobx.setCurrentDate(DateFormat('dd.MM.yyyy').format(now));

    myGetxController.setCurrentDate(DateFormat('dd.MM.yyyy').format(now));
    myGetxController
        .setUserExercisesOnDay(DateFormat('dd.MM.yyyy').format(now));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    // final mobx = Provider.of<Mobx>(context);

    int weekday = now.weekday;

    // Находим последний понедельник
    DateTime lastMonday = now.subtract(Duration(days: weekday - 1));
    // Вычисляем дни недели для последних 7 дней
    List<DateTime> lastWeek = [];
    for (int i = 0; i < 7; i++) {
      lastWeek.add(lastMonday.add(Duration(days: i)));
    }

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 2 * vh),
          padding: EdgeInsets.all(3 * vw),
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
                  Obx(() => Container(
                        child:InkWell(
                                onTap: () {
                                  myGetxController.setCurrentDate(
                                      DateFormat('dd.MM.yyyy').format(date));
                                  myGetxController.setUserExercisesOnDay(
                                      DateFormat('dd.MM.yyyy').format(date));
                                  // Navigator.pushReplacementNamed(context,'/journal');
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 250),
                                  width: 8 * vw,
                                  height: 8 * vw,
                                  alignment: Alignment.center,
                                  // padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      gradient:RadialGradient(
                                        colors: myGetxController.getx.date == DateFormat('dd.MM.yyyy').format(date) ? [
                                          Color(0xff4D8AEE),
                                          Color(0xff2932FF)
                                        ] : [Color.fromARGB(0, 77, 139, 238),Color.fromARGB(0, 41, 52, 255)],
                                        radius: 0.6,
                                        center: Alignment.center,
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
              
                      ))
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
