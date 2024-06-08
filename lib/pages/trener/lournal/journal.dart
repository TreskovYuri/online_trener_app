import 'package:flutter/material.dart';
import 'package:trener_app/getx/MyDateController.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/getx/MyFixController.dart';
import 'package:trener_app/getx/MyJournalConroller.dart';
import 'package:trener_app/getx/MyNutritionsController.dart';
import 'package:trener_app/getx/MySportProgrammController.dart';
import 'package:trener_app/getx/MyTestsController.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/http/exerciseUtills.dart';
import 'package:trener_app/http/fixUtills.dart';
import 'package:trener_app/http/nutritionUtills.dart';
import 'package:trener_app/http/sportpogrammUtills.dart';
import 'package:trener_app/http/testUtills.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/pages/sportsman/planner/nutrition.dart';
import 'package:trener_app/pages/trener/lournal/fix/test.dart';
import 'package:trener_app/widgets/service/navbar.dart';
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
  MyDateController myDateController = Get.put(MyDateController());
  MyJournalConroller myJournalConroller = Get.put(MyJournalConroller());
  @override
  void initState() {
    super.initState();
    GetJournal();
    GetExercise();
    GetTests();
    GetNutritions();
    GetTestFixForTrenr();
    GetSportProgramm();
    GetSportprogrammFixForTrener();
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
                padding: EdgeInsets.fromLTRB(2 * vw, 3 * vh, 2 * vw, 7 * vh),
                width: 100 * vw,
                color: Color(0xff1B1C20),
                child: Column(
                  children: [
                    Header(),
                    Cal(),
                    Padding(
                        padding: EdgeInsets.only(top: 3 * vh, bottom: 4 * vh),
                        child: Obx(
                          () => Column(
                            children:
                                myJournalConroller.Journal.map((e) => Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: UserCard(
                                      array: e,
                                    ))).toList(),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
          _isAtTop ? Navbar() : NavbarScroll()
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
  MyDateController myDateController = Get.put(MyDateController());
  MyExercisesController myExercisesController =
      Get.put(MyExercisesController());
  MyTestsController myTestsController = Get.put(MyTestsController());
  MyNutritionsController myNutritionsController =
      Get.put(MyNutritionsController());
  MySportProgrammController mySportProgrammController =
      Get.put(MySportProgrammController());
  MyFixController myFixController =
      Get.put(MyFixController());
  List<Map<String, dynamic>> exercisesOnDay = [];
  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    return Obx(() {
      List<dynamic> exercises = widget.array['exercises']
          .where((e) => e['date'] == myDateController.date)
          .map((e) => e)
          .toList();
      ;
      List<dynamic> nutritions = widget.array['nutrition']
          .where((e) => e['date'] == myDateController.date)
          .toList();
      List<dynamic> tests = widget.array['tests']
          .where((e) => e['date'] == myDateController.date)
          .toList();

      return (exercises.length + tests.length + nutritions.length) > 0
          ? Container(
              padding: EdgeInsets.all(1 * vw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60 * vw,
                            child: Text(
                              widget.array['name'],
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(223, 255, 255, 255),
                                  fontSize: 4 * vw,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600),
                            ),
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
                                      icon: const Icon(Icons
                                          .keyboard_arrow_down_rounded), // Иконка
                                      iconSize: 6 * vw,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          modalFlag = !modalFlag;
                                        });
                                      },
                                      icon: const Icon(Icons
                                          .arrow_forward_ios_rounded), // Иконка
                                      iconSize: 4 * vw,
                                    ))
                        ],
                      ),
                      Container(
                          width: 11 * vw,
                          height: 6 * vw,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: (exercises.length +
                                          tests.length +
                                          nutritions.length) >
                                      0
                                  ? const RadialGradient(
                                      colors: [
                                        Color(0xff4D8AEE),
                                        Color(0xff2932FF)
                                      ], // Цвета для радиального градиента
                                      radius:
                                          0.6, // Радиус градиента (от 0 до 1)
                                      center: Alignment
                                          .center, // Центр радиального градиента
                                    )
                                  : const RadialGradient(
                                      colors: [
                                        Color.fromARGB(98, 127, 127, 127),
                                        Color.fromARGB(93, 128, 128, 128)
                                      ], // Цвета для радиального градиента
                                      radius:
                                          0.6, // Радиус градиента (от 0 до 1)
                                      center: Alignment
                                          .center, // Центр радиального градиента
                                    ),
                              borderRadius: BorderRadius.circular(100)),
                          child: Text(
                            (exercises.length +
                                    tests.length +
                                    nutritions.length)
                                .toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                                fontSize: 3.5 * vw),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 2 * vw, horizontal: 5 * vw),
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
                        padding: EdgeInsets.symmetric(
                            vertical: 2 * vw, horizontal: 5 * vw),
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
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/training_details_trener',
                                      arguments: {
                                        'exercises':exercises,
                                        'user':widget.array
                                      });
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
                                            vertical: 2 * vw,
                                            horizontal: 4 * vw),
                                        decoration: BoxDecoration(
                                            color: Color(0xff23252B),
                                            borderRadius:
                                                BorderRadius.circular(5 * vw)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            mySportProgrammController.fixList.any((element) => element['date'] == myDateController.date && element['userId'] == widget.array['id'],)?Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.circular(100)
                                              ),
                                              
                                            ):Container(
                                                                 width: 10,
                                              height: 10,
                                                                                            decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.circular(100)
                                              ),
                                            ),
                                            Container(
                                              width: 60 * vw,
                                              child: Text(
                                              
                                                mySportProgrammController
                                                        .sportprogramms
                                                        .any((element) =>
                                                            element['id'] ==
                                                            exercises[0]
                                                                ['programmId'])
                                                    ? mySportProgrammController
                                                        .sportprogramms
                                                        .firstWhere((element) =>
                                                            element['id'] ==
                                                            exercises[0][
                                                                'programmId'])['name']
                                                    : '',
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
                              ),
                              ...tests.map((e) => GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (_) =>
                                              FixTestModalWindTrener(
                                                  sportsmanId:
                                                      widget.array['id'],
                                                  test: myTestsController.tests
                                                      .firstWhere((el) =>
                                                          el['id'] ==
                                                          e['testId']),
                                                  belong: e));
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
                                                onDismissed: () =>
                                                    print('delete'),
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
                                                vertical: 2 * vw,
                                                horizontal: 4 * vw),
                                            decoration: BoxDecoration(
                                                color: Color(0xff23252B),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5 * vw)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                 myFixController.sportsmanTestsFix.any((element) => element['date'] == myDateController.date && element['sportsmanId'] == widget.array['id'],)?Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.circular(100)
                                              ),
                                              
                                            ):Container(
                                                                 width: 10,
                                              height: 10,
                                                                                            decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.circular(100)
                                              ),
                                            ),
                                                Container(
                                                  width: 60 * vw,
                                                  child: Text(
                                                    '${myTestsController.tests.firstWhere((el) => el['id'] == e['testId'])['name']}',
                                                    style: TextStyle(
                                                        color: const Color
                                                            .fromARGB(
                                                            210, 255, 255, 255),
                                                        fontFamily: 'Manrope',
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                  )),
                              ...nutritions.map((e) => GestureDetector(
                                    onTap: () {
                                      // Navigator.pushNamed(
                                      //     context, '/training_details_trener',
                                      //     arguments: {
                                      //       'exercise':myExercisesController.exercises.firstWhere((el) => el['id']==e['exerciseId']),
                                      //       "sets":e['sets']
                                      //     });
                                      Get.to(Nutrition(
                                        nutrition: myNutritionsController
                                            .nutritions
                                            .firstWhere((el) =>
                                                el['id'] == e['nutritionId']),
                                      ));
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
                                                onDismissed: () =>
                                                    print('delete'),
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
                                                vertical: 2 * vw,
                                                horizontal: 4 * vw),
                                            decoration: BoxDecoration(
                                                color: Color(0xff23252B),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5 * vw)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 60 * vw,
                                                  child: Text(
                                                    'Еда на день',
                                                    style: TextStyle(
                                                        color: const Color
                                                            .fromARGB(
                                                            210, 255, 255, 255),
                                                        fontFamily: 'Manrope',
                                                        fontWeight:
                                                            FontWeight.w600,
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
                            ],
                          ),
                        )
                      : Container()
                ],
              ),
            )
          : Container();
    });
  }
}

// <============= Шапка ================>
class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  MyUserController myUserController = Get.put(MyUserController());
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
  MyDateController myDateController = Get.put(MyDateController());
  DateTime now = DateTime.now();
  @override
  void initState() {
    DateTime now = DateTime.now();
    myDateController.setCurrentDate(DateFormat('dd.MM.yyyy').format(now));

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
                          child: InkWell(
                        onTap: () {
                          myDateController.setCurrentDate(
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
                              gradient: RadialGradient(
                                colors: myDateController.date ==
                                        DateFormat('dd.MM.yyyy').format(date)
                                    ? [Color(0xff4D8AEE), Color(0xff2932FF)]
                                    : [
                                        Color.fromARGB(0, 77, 139, 238),
                                        Color.fromARGB(0, 41, 52, 255)
                                      ],
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
                      )))
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
