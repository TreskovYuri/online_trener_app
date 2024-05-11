import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';

class TrenerTrainings extends StatefulWidget {
  const TrenerTrainings({super.key});

  @override
  State<TrenerTrainings> createState() => _TrenerTrainingsState();
}

class _TrenerTrainingsState extends State<TrenerTrainings> {
  bool typeFlag = false;
  static List<Map<dynamic, dynamic>> array = [
    {
      "type": "На выносливость ",
      "exercises": [
        {
          "name": "Круги руками",
          "description": "Развивает мышцы плеч, спины и груди, улучшает осанку",
          "stage": ['Заминка', "Разминка"],
          "equipment": []
        },
        {
          "name": "Бег",
          "description": "Развивает мышцы плеч, спины и груди, улучшает осанку",
          "stage": ["Разминка"],
          "equipment": []
        },
        {
          "name": "Скручивания",
          "description": "Развивает мышцы плеч, спины и груди, улучшает осанку",
          "stage": ['Заминка'],
          "equipment": []
        },
        {
          "name": "Махи ногами",
          "description": "Развивает мышцы плеч, спины и груди, улучшает осанку",
          "stage": ['Заминка', "Разминка"],
          "equipment": []
        },
      ]
    },
    {
      "type": "Силовые",
      "exercises": [
        {
          "name": "Жим лежа",
          "description": "Развивает мышцы плеч, спины и груди, улучшает осанку",
          "stage": ['Упражнение'],
          "equipment": ['штанга']
        },
        {
          "name": "Приседания со штангой",
          "description": "Развивает мышцы плеч, спины и груди, улучшает осанку",
          "stage": ['Упражнение'],
          "equipment": ['штанга']
        },
        {
          "name": "Подтягивания",
          "description": "Развивает мышцы плеч, спины и груди, улучшает осанку",
          "stage": ['Упражнение'],
          "equipment": ['турник']
        },
        {
          "name": "Армейский жим",
          "description": "Развивает мышцы плеч, спины и груди, улучшает осанку",
          "stage": ['Упражнение'],
          "equipment": ['штанга']
        },
      ]
    },
  ];

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

    var count = 0;
    array.forEach((el) {
      el['exercises'].forEach((e) => count++);
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xff4D8AEE)),
        leading: IconButton(
          icon: const Icon(Icons
              .arrow_back_ios_new_rounded), // Устанавливаем иконку "домой" вместо стрелки "назад"
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2 * vw),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/img/blue_plus.svg',
                width: 2.6 * vh,
              ),
            ),
          ),
        ],
        toolbarHeight: 13 * vh,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Упражнения',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  fontSize: 5 * vw),
            ),
          ],
        ),
        backgroundColor: Color(0xff1B1C20), // Устанавливаем прозрачный фон
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: ListView(
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        typeFlag = !typeFlag;
                      });
                    },
                    child: NavType(vw: vw, typeFlag: typeFlag)),
                Padding(
                  padding: EdgeInsets.all(3 * vw),
                  child: TextField(
                    cursorColor: Color.fromARGB(255, 112, 112, 112),
                    style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                    decoration: InputDecoration(
                      hintText: 'Найти...',
                      filled: true, // Set to true to fill the background
                      fillColor: Color(0xff23252B), // Set background color
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey), // Customize hint text color
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 4 * vw, vertical: 1.5 * vh),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // Remove border
                        borderRadius: BorderRadius.circular(4 * vw),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none, // Remove border
                        borderRadius: BorderRadius.circular(4 * vw),
                      ),
                    ),
                  ),
                ),
                    Column(
                        children: [
                          GroupCard(
                              vw: vw,
                              vh: vh,
                              count: count,
                              name: 'Все упражнения',
                              setType: (newType) => setState(() {
                                Navigator.pushNamed(context, '/trener_trainings_current_type',arguments: {
                                  "type":"Все упражнения",
                                  "exercises":[
                                    ...array.expand((e) => e['exercises'])
                                  ]
                                });
                                  })),
                          Padding(
                            padding: EdgeInsets.all(3 * vw),
                            child: Row(
                              children: [
                                Text(
                                  'Типы',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          132, 255, 255, 255),
                                      fontSize: 3.5 * vw,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          ...array.map((e) => GroupCard(
                                vw: vw,
                                vh: vh,
                                count: e['exercises'].length,
                                name: e['type'],
                                setType: (newType) => setState(() {Navigator.pushNamed(context, '/trener_trainings_current_type',arguments: e);
                                }),
                              ))
                        ],
                      )
              ],
            ),
          ),
          _isAtTop ? Navbar() : NavbarScroll(),
        ],
      ),
    );
  }
}

// Карточкагрупп упражнений
class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
    required this.vw,
    required this.vh,
    required this.count,
    required this.name,
    required this.setType,
  });

  final double vw;
  final double vh;
  final int count;
  final String name;
  final Function setType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3 * vw),
      // padding: EdgeInsets.symmetric(vertical: 7 * vw, horizontal: 4 * vw),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(3 * vw)),
      child: ElevatedButton(
        onPressed: () {
          setType(name);
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          foregroundColor: Color.fromARGB(255, 8, 32, 42),
          surfaceTintColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 2 * vh, horizontal: 5 * vw),
          backgroundColor: const Color(0xff23252B),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8.0), // Указываем радиус скругления углов
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 4 * vw,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: const Color.fromARGB(72, 255, 255, 255),
                  size: 4 * vw,
                )
              ],
            ),
            SizedBox(
              height: 2 * vh,
            ),
            Container(
                width: 40 * vw,
                height: 6 * vw,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: const RadialGradient(
                      colors: [
                        Color(0xff4D8AEE),
                        Color(0xff2932FF)
                      ], // Цвета для радиального градиента
                      radius: 2.6, // Радиус градиента (от 0 до 1)
                      center: Alignment.center, // Центр радиального градиента
                    ),
                    borderRadius: BorderRadius.circular(100)),
                child: Text(
                  exerciseWord(count),
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      fontSize: 3.5 * vw),
                )),
          ],
        ),
      ),
    );
  }
}

// <========== Выбор между моими упражнениями и общей базой
class NavType extends StatelessWidget {
  const NavType({
    super.key,
    required this.vw,
    required this.typeFlag,
  });

  final double vw;
  final bool typeFlag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1 * vw),
      margin: EdgeInsets.all(3 * vw),
      decoration: BoxDecoration(
        color: Color(0xff23252B),
        borderRadius: BorderRadius.circular(10 * vw),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(1.5 * vw),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * vw),
                  color: typeFlag
                      ? Color.fromARGB(34, 235, 238, 247)
                      : Colors.transparent),
              child: Text(
                'Мои упражнения',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Manrope',
                    fontSize: 4 * vw,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(1.5 * vw),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * vw),
                  color: !typeFlag
                      ? Color.fromARGB(34, 235, 238, 247)
                      : Colors.transparent),
              child: Text(
                'Общая база',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Manrope',
                    fontSize: 4 * vw,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String exerciseWord(int number) {
  if (number % 10 == 1 && number % 100 != 11) {
    return "$number упражнение";
  } else if ((number % 10 >= 2 && number % 10 <= 4) &&
      !(number % 100 >= 12 && number % 100 <= 14)) {
    return "$number упражнения";
  } else {
    return "$number упражнений";
  }
}
