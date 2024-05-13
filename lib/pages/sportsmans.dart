import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';

class Sportsmans extends StatefulWidget {
  const Sportsmans({super.key});

  @override
  State<Sportsmans> createState() => _SportsmansState();
}

class _SportsmansState extends State<Sportsmans> {
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

    final List<Map<String, dynamic>> sportsmansList = [
      {
        "id": 1,
        "name": "Карпов Яков Дамирович",
        'age': "19",
        'height': "184",
        'weigth': "84",
        "team": "СКА",
        'post': "Центральный нападающий",
      },
      {
        "id": 2,
        "name": "Крюков Александр Миронович",
        'age': "23",
        'height': "179",
        'weigth': "84",
        "team": "Красная машина",
        'post': "Защитник",
      },
      {
        "id": 3,
        "name": "Миронов Максим Александрович",
        'age': "21",
        'height': "173",
        'weigth': "73",
        "team": "СКА",
        'post': "Вратарь",
      },
      {
        "id": 4,
        "name": "Никонов Иван Фёдорович",
        'age': "21",
        'height': "165",
        'weigth': "74 ",
        "team": "СКА",
        'post': "Крайний нападающий",
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
            Navigator.pushReplacementNamed(context, '/faq');
          },
        ),
        surfaceTintColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.zero,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/img/sportsmans_ok.svg',
                width: 2.6 * vh,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 2 * vw),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/img/filter_white.svg',
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
              'Спортсмены',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  fontSize: 5 * vw),
            ),
          ],
        ),
        backgroundColor:
            const Color(0xff1B1C20), // Устанавливаем прозрачный фон
      ),
      body: Stack(
        children: [
          ListView(
            controller: _scrollController,
            children: [
              Padding(
                padding: EdgeInsets.all(3 * vw),
                child: TextField(
                  cursorColor: const Color.fromARGB(255, 112, 112, 112),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 4 * vw,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope'),
                  decoration: InputDecoration(
                    hintText: 'Найти...',
                    filled: true, // Set to true to fill the background
                    fillColor: const Color(0xff23252B), // Set background color
                    hintStyle: const TextStyle(
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
              ...sportsmansList.map(
                (e) => Padding(
                  padding: EdgeInsets.all(3*vw),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      surfaceTintColor: Colors.transparent,
                      foregroundColor: Color.fromARGB(255, 0, 71, 115),
                      backgroundColor: Color(0xff23252B), // Чтобы сделать фон прозрачным
                      // shadowColor: Color(0xff23252B),
                    ).copyWith(

                      // Радиальный градиент
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),

                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                      margin: EdgeInsets.all(3 * vw),
                      padding: EdgeInsets.all(3 * vw),
                      decoration: BoxDecoration(
                  
                          borderRadius: BorderRadius.circular(3 * vw)),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/img/user${e['id']}.png',
                                width: 15 * vw,
                              ),
                              SizedBox(
                                width: 3 * vw,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 50 * vw,
                                      child: Text(
                                        e['name'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 4 * vw,
                                            fontFamily: 'Manrope'),
                                      )),
                                  SizedBox(
                                    height: 1 * vh,
                                  ),
                                  Text(
                                      "${e['age']}г • ${e['height']}см • ${e['weigth']}кг",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              129, 255, 255, 255),
                                          fontSize: 3 * vw,
                                          fontFamily: 'Manrope'))
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2 * vh,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3 * vw, vertical: .5 * vh),
                                decoration: BoxDecoration(
                                    color: Color(0xffEBEEF),
                                    borderRadius: BorderRadius.circular(10 * vw)),
                                child: Text(e['post'],
                                    style: TextStyle(
                                        color: Color.fromARGB(184, 255, 255, 255),
                                        fontSize: 3 * vw,
                                        fontFamily: 'Manrope')),
                              ),
                              SizedBox(
                                width: 2 * vw,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3 * vw, vertical: .5 * vh),
                                decoration: BoxDecoration(
                                    color: Color(0xffEBEEF),
                                    borderRadius: BorderRadius.circular(10 * vw)),
                                child: Text(e['team'],
                                    style: TextStyle(
                                        color: Color.fromARGB(184, 255, 255, 255),
                                        fontSize: 3 * vw,
                                        fontFamily: 'Manrope')),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12 * vh,
              )
            ],
          ),
          _isAtTop ? const Navbar() : const NavbarScroll(),
        ],
      ),
    );
  }
}
