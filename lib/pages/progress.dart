import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/pages/ResultFix.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';

class UserProgress extends StatefulWidget {
  const UserProgress({super.key});

  @override
  State<UserProgress> createState() => _UserProgressState();
}

class _UserProgressState extends State<UserProgress> {
  ScrollController _scrollController = ScrollController();
  bool _isAtTop = true;
  MyUserController myUserController = Get.put(MyUserController());

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

  bool fullTestsModal = false;
  @override
  Widget build(BuildContext context) {
    final mobx = Provider.of<Mobx>(context);
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;

    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          child: ListView(
            controller: _scrollController,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 7 * vh, left: 5 * vw, right: 5 * vw),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: myUserController.user['img'] != null
                            ? Container(
                              width: 13 * vw,
                              height: 13 * vw,
                              child: Image.network(
                                  '${dotenv.env['STATIC_URL']}/${myUserController.user['img']}',
                                  fit: BoxFit.cover,
                                ),
                            )
                            : Image.asset(
                                'assets/img/user1.png',
                                width: 13 * vw,
                              ),
                 
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6 * vw),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myUserController.user['name'] != null &&
                                  myUserController.user['name'].split(' ')[1] != null
                              ? Text(
                                  myUserController.user['name'].split(' ')[1],
                                  style: TextStyle(
                                      color: Color.fromARGB(227, 255, 255, 255),
                                      fontSize: 5 * vw,
                                      fontWeight: FontWeight.w400),
                                )
                              : Text(
                                  'Пользователь',
                                  style: TextStyle(
                                      color: Color.fromARGB(227, 255, 255, 255),
                                      fontSize: 5 * vw,
                                      fontWeight: FontWeight.w400),
                                ),
                          SizedBox(
                            height: 1 * vh,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: .4 * vh, horizontal: 3 * vw),
                            decoration: BoxDecoration(
                                color: Color(0xff303135),
                                borderRadius: BorderRadius.circular(10 * vw)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/img/premium.svg',
                                  width: 2.5 * vw,
                                ),
                                SizedBox(
                                  width: 1 * vw,
                                ),
                                Text(
                                  'Premium',
                                  style: TextStyle(
                                      color: Color.fromARGB(227, 255, 255, 255),
                                      fontSize: 2.5 * vw,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3 * vw),
                child: TextField(
                  cursorColor: Color.fromARGB(255, 112, 112, 112),
                  style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                  decoration: InputDecoration(
                    hintText: 'Найти...',
                    filled: true, // Set to true to fill the background
                    fillColor: Color(0xff23252B), // Set background color
                    hintStyle: TextStyle(
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
              fullTestsModal ? FullTests() : Body(),
              !fullTestsModal
                  ? Container(
                      margin: EdgeInsets.all(4 * vw),
                      padding: EdgeInsets.symmetric(
                          horizontal: 4 * vw, vertical: 6 * vw),
                      decoration: BoxDecoration(
                          color: Color(0xff23252B),
                          borderRadius: BorderRadius.circular(4 * vw)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 4 * vw),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Тесты и нормативы',
                                  style: TextStyle(
                                      color: Color.fromARGB(227, 255, 255, 255),
                                      fontSize: 4 * vw,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Manrope'),
                                ),
                                SvgPicture.asset(
                                  'assets/img/red_ok.svg',
                                  width: 4.5 * vw,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2 * vh,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Посмотреть все',
                                style: TextStyle(
                                    color: Color.fromARGB(191, 255, 255, 255),
                                    fontSize: 3 * vw,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Manrope'),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color:
                                      const Color.fromARGB(221, 255, 255, 255),
                                  size: 4 * vw,
                                ),
                                onPressed: () {
                                  setState(() {
                                    fullTestsModal = !fullTestsModal;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container(),
                SizedBox(height: 12*vh,)
            ],
          ),
        ),
        _isAtTop ? Navbar() : NavbarScroll(),

      ],
    ));
  }
}

// Основная часть
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final mobx = Provider.of<Mobx>(context);
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(3 * vw),
          padding: EdgeInsets.all(4 * vw),
          decoration: BoxDecoration(
              color: Color(0xff23252B),
              borderRadius: BorderRadius.circular(4 * vw)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Тренировки',
                    style: TextStyle(
                        color: Color.fromARGB(227, 255, 255, 255),
                        fontSize: 4 * vw,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Manrope'),
                  ),
                  SvgPicture.asset(
                    'assets/img/red_biceps.svg',
                    width: 4 * vw,
                  ),
                ],
              ),
              SizedBox(
                height: 2 * vh,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1 * vw,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [Color(0xffEF151A), Color(0xffEF151A)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1 * vw,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(154, 235, 238, 247),
                            Color.fromARGB(146, 235, 238, 247)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2 * vh,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1',
                          style: TextStyle(
                              color: Color.fromARGB(238, 255, 255, 255),
                              fontSize: 4 * vw,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope'),
                        ),
                        Text(
                          'Заполнено',
                          style: TextStyle(
                              color: Color.fromARGB(135, 255, 255, 255),
                              fontSize: 3 * vw,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1',
                          style: TextStyle(
                              color: Color.fromARGB(238, 255, 255, 255),
                              fontSize: 4 * vw,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope'),
                        ),
                        Text(
                          'Пропущено',
                          style: TextStyle(
                              color: Color.fromARGB(135, 255, 255, 255),
                              fontSize: 3 * vw,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                              color: Color.fromARGB(238, 255, 255, 255),
                              fontSize: 4 * vw,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope'),
                        ),
                        Text(
                          'Осталось',
                          style: TextStyle(
                              color: Color.fromARGB(135, 255, 255, 255),
                              fontSize: 3 * vw,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 1 * vh,
        ),
        SvgPicture.asset(
          'assets/img/diagramma.svg',
          width: 90 * vw,
        ),
        SizedBox(
          height: 1 * vh,
        ),
      ],
    );
  }
}

// Тесты
class FullTests extends StatefulWidget {
  FullTests({super.key});

  @override
  State<FullTests> createState() => _FullTestsState();
}

class _FullTestsState extends State<FullTests> {
  @override
  Widget build(BuildContext context) {
    const List array = [
      {
        "name": "Максимальный вес приседания с штангой на спине",
      },
      {
        "name": "Максимальный вес жим штанги лежа",
      },
      {
        "name": "Максимальный вес жим штанги лежа",
      },
      {
        "name": "Латеральный прыжок с левой ноги",
      },
      {
        "name": "Старт-стоп все линии",
      },
      {
        "name": "Бег 20 м с высокого старта",
      },
      {
        "name": "Бег на коньках 20 м",
      },
      {
        "name": "Бег на коньках челночный 6х9 м",
      },
      {
        "name": "Упор лежа. Сгибание и разгибание рук",
      },
      {
        "name":
            "Вис хватом сверху на высокой перекладине. Сгибание и разгибание рук",
      },
      {
        "name": "Бег на коньках слаломный без шайбы",
      },
      {
        "name": "Бег на коньках спиной вперед 20 м",
      },
    ];
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    return Container(
      padding: EdgeInsets.all(3 * vw),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Тесты и нормативы',
                style: TextStyle(
                    color: Color.fromARGB(227, 255, 255, 255),
                    fontSize: 5 * vw,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          ...array.map(
            (e) => Container(
              margin: EdgeInsets.only(top: 2 * vh),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => ResultFix(
                            map: e,
                          ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff23252B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Указываем радиус скругления углов
                  ),
                ),
                child: Container(
                  width: 90 * vw,
                  padding: EdgeInsets.symmetric(vertical: 2 * vh),
                  alignment:
                      Alignment.centerLeft, // Выравниваем текст по левому краю
                  child: Text(
                    e['name'],
                    textAlign:
                        TextAlign.left, // Выравниваем текст по левому краю
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
