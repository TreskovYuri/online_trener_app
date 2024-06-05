import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';

class TrenerTrainingsCurrentsType extends StatefulWidget {
  const TrenerTrainingsCurrentsType({super.key});

  @override
  State<TrenerTrainingsCurrentsType> createState() =>
      _TrenerTrainingsCurrentsTypeState();
}

class _TrenerTrainingsCurrentsTypeState
    extends State<TrenerTrainingsCurrentsType> {
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
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;

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
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/img/filter_blue.svg',
              width: 2.6 * vh,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/img/favorite_blue.svg',
              width: 2 * vh,
            ),
          ),
        ],
        toolbarHeight: 13 * vh,
        surfaceTintColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              arguments['type'],
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
                ...arguments['exercises'].map((e) => ExersizeCard(
                      map: e,
                      vh: vh,
                      vw: vw,
                    )),
                SizedBox(
                  height: 12 * vh,
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

class ExersizeCard extends StatelessWidget {
  Map<String, dynamic> map;
  final double vw;
  final double vh;

  ExersizeCard(
      {super.key, required this.map, required this.vw, required this.vh});

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
                Text(
                  map['nameRu'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 4 * vw,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/img/favorite_white.svg',
                    width: 2.2 * vh,
                  ),
                ),
              ],
            ),
            Text(
              map['descriptionRu'],
              style: TextStyle(
                  color: const Color.fromARGB(181, 255, 255, 255),
                  fontSize: 3 * vw,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 2 * vh,
            ),
            Row(
              children: [
                ...map['stage'].map(
                  (e) => Container(
                      width: 20 * vw,
                      height: 6 * vw,
                      margin: EdgeInsets.only(right: 2 * vw),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          gradient: const RadialGradient(
                            colors: [
                              Color(0xff4D8AEE),
                              Color(0xff2932FF)
                            ], // Цвета для радиального градиента
                            radius: 2.6, // Радиус градиента (от 0 до 1)
                            center:
                                Alignment.center, // Центр радиального градиента
                          ),
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        e,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                            fontSize: 2.7 * vw),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 2 * vh,
            ),
            Text(
              'Снаряжение',
              style: TextStyle(
                  color: const Color.fromARGB(181, 255, 255, 255),
                  fontSize: 2.7 * vw,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 2 * vh,
            ),
            map['equipment'].length > 0
                ? Row(
                    children: [
                      ...map['equipment'].map(
                        (e) => Container(
                          height: 6 * vw,
                          padding: EdgeInsets.symmetric(horizontal: 7 * vw),
                          margin: EdgeInsets.only(right: 2 * vw),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(84, 0, 0, 0),
                              borderRadius: BorderRadius.circular(100)),
                          child: Text(
                            e,
                            style: TextStyle(
                                color: const Color.fromARGB(154, 255, 255, 255),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                                fontSize: 2.7 * vw),
                          ),
                        ),
                      )
                    ],
                  )
                : Container(
                    width: 40 * vw,
                    height: 6 * vw,
                    margin: EdgeInsets.only(right: 2 * vw),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(84, 0, 0, 0),
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      'Без снаряжения',
                      style: TextStyle(
                          color: const Color.fromARGB(154, 255, 255, 255),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          fontSize: 2.7 * vw),
                    ),
                  ),
          ],
        ),
      ),
    );
    ;
  }
}
