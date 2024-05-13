import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trener_app/models/constants/images.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';
import 'package:trener_app/widgets/tests/addTests.dart';

class TrenerTests extends StatefulWidget {
  const TrenerTests({super.key});

  @override
  State<TrenerTests> createState() => _TrenerTestsState();
}

class _TrenerTestsState extends State<TrenerTests> {
  ScrollController _scrollController = ScrollController();
  bool _isAtTop = true;
  String type = 'Все';
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

    final List typeList = [
      'на льду',
      "силовой",
      "прыжковый",
      "силовой",
      "скоростной",
      "медицинский"
    ];

    final List<Map<String, dynamic>> array = [
      {
        "name": "Бег 30м",
        "type": "скоростной",
        "description":
            'Что касается бега на 30 м, то это минимальная дистанция среди спринтерских видов лёгкой атлетики,не признанная Международной ассоциацией легкоатлетических федераций.',
        "standard": "30 сек"
      },
      {
        "name": "Максимальный вес приседания с штангой на спине ",
        "type": "силовой",
        "description":
            'Присед со штангой является одним из трех базовых упражнений в пауэрлифтинге. Весовые нагрузки напрямую зависят от правильной техники выполнения и системы тренировок.',
        "standard": "30 сек"
      },
      {
        "name": "Бег на коньках слаломный без шайбы",
        "type": "скоростной",
        "description":
            'Определяет уровень координационных способностей, техники маневренного катания. Испытуемый в высокой стойке становятся к линии старта (рас- положена на расстоянии 10 см от линии ворот по направлении к кругу вбрасывания) так, чтобы коньки и клюшка находились за ней. По сигналу хоккеист стартует и обегает 5 стоек. Четыре стой- ки расположены по периметру круга вбрасывания и одна стойк на расстоянии 17 м 36 см от линии старта, напротив верхней стойки расположенной на круге вбрасывания. Таким образом, три стойки находятся на осевой линии проходящей через точку вбрасывания и по 1-й стойке справа и слева перпендикулярно осевой линии. Прежде чем дать старт, надо убедиться, что испытуемому известен маршрут, по которому он должен пройти. Выполняются две попыт- ки. Учитывается лучшая. ',
        "standard": "30 сек"
      },
      {
        "name": "на льду",
        "type": "скоростной",
        "description":
            'Что касается бега на 30 м, то это минимальная дистанция среди спринтерских видов лёгкой атлетики, не признанная Международной ассоциацией легкоатлетических федераций.',
        "standard": "30 сек"
      },
      {
        "name": "Бег на коньках слаломный без шайбы",
        "type": "на льду",
        "description":
            'Определяет уровень координационных способностей, техники маневренного катания. Испытуемый в высокой стойке становятся к линии старта (рас- положена на расстоянии 10 см от линии ворот по направлении к кругу вбрасывания) так, чтобы коньки и клюшка находились за ней. По сигналу хоккеист стартует и обегает 5 стоек. Четыре стой- ки расположены по периметру круга вбрасывания и одна стойка',
        "standard": "30 сек"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xff4D8AEE)),
        leading: IconButton(
          icon: const Icon(Icons
              .arrow_back_ios_new_rounded), // Устанавливаем иконку "домой" вместо стрелки "назад"
          onPressed: () {
            Navigator.pushReplacementNamed(context,'/faq');

          },
        ),
        surfaceTintColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2 * vw),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context, builder: (_)=>ModalAddTest());
              },
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
              'Тесты',
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
          ListView(
            controller: _scrollController,
            children: [
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1 * vh, horizontal: 1 * vw),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              type = 'Все';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 6, 36, 65),
                            padding: EdgeInsets
                                .zero, // Устанавливаем внутренний отступ нулевым
                          ),
                          child: Container(
                            margin: EdgeInsets.zero,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 3 * vw,
                              // vertical: .1 * vh,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10 * vw),
                            ),
                            child: Text(
                              'Все',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: "Manrope",
                                fontSize: 3 * vw,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ...typeList.map(
                      (e) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1 * vh, horizontal: 1 * vw),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              type = e;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 6, 36, 65),
                            padding: EdgeInsets
                                .zero, // Устанавливаем внутренний отступ нулевым
                          ),
                          child: Container(
                            margin: EdgeInsets.zero,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 3 * vw,
                              // vertical: .1 * vh,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10 * vw),
                            ),
                            child: Text(
                              e,
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: "Manrope",
                                fontSize: 3 * vw,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ...array
                  .where((element) => element['type'] == type || type == 'Все')
                  .map((e) => GroupCard(
                        vh: vh,
                        vw: vw,
                        map: e,
                      )),
              SizedBox(
                height: 12 * vh,
              )
            ],
          ),
          _isAtTop ? Navbar() : NavbarScroll(),
        ],
      ),
    );
  }
}


// Обрезатель строки
String shortenString(String input) {
  if (input.length <= 120) {
    return input;
  } else {
    return input.substring(0, 120) + '...';
  }
}

// Карточкагрупп упражнений
class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
    required this.vw,
    required this.vh,
    required this.map,
  });

  final double vw;
  final double vh;
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3 * vw),
      // padding: EdgeInsets.symmetric(vertical: 7 * vw, horizontal: 4 * vw),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(3 * vw)),
      child: ElevatedButton(
        onPressed: () {},
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
                Container(
                  width: 75 * vw,
                  child: Text(
                    map['name'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 4 * vw,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SvgPicture.asset(
                  'assets/img/favorite_white.svg',
                  width: 2 * vh,
                ),
              ],
            ),
            SizedBox(
              height: 3 * vh,
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
                map['type'],
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    fontSize: 3.5 * vw),
              ),
            ),
            SizedBox(
              height: 3 * vh,
            ),
            Text(
              'Описание',
              style: TextStyle(
                  color: const Color.fromARGB(122, 255, 255, 255),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                  fontSize: 3 * vw),
            ),
            SizedBox(
              height: 1 * vh,
            ),
            Text(
              shortenString(map['description']),
              style: TextStyle(
                  color: Color.fromARGB(233, 255, 255, 255),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                  fontSize: 3.5 * vw),
            )
          ],
        ),
      ),
    );
  }
}
