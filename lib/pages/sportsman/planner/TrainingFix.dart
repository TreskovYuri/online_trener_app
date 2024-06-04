import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrainingFix extends StatefulWidget {
  TrainingFix({super.key, required this.arguments});
 Map<dynamic, dynamic> arguments;
  @override
  State<TrainingFix> createState() => _TrainingFixState();
}

class _TrainingFixState extends State<TrainingFix> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    List<Map<dynamic, dynamic>> exercises = arguments['exercises'];
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons
              .arrow_back_ios_new_rounded), // Устанавливаем иконку "домой" вместо стрелки "назад"
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 10 * vh,
        title: Text(
          '${arguments['name']}',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w500,
              fontSize: 5 * vw),
        ),
        backgroundColor: Colors.transparent, // Устанавливаем прозрачный фон
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xff4D8AEE),
                Color(0xff2932FF)
              ], // Цвета радиального градиента
              center: Alignment.topLeft, // Центр радиального градиента
              radius: 3.5, // Радиус радиального градиента
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        ...exercises
            .map((e) => ExersicesCard(
                  exercise: e,
                ))
            .toList()
      ])),
      floatingActionButton: SizedBox(
        width: 93 * vw,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent, // Убираем цвет фона кнопки
          elevation: 0, // Убираем тень
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  30.0), // Устанавливаем закругленные углы
              gradient: const RadialGradient(
                colors: [
                  Color(0XFF4D8AEE),
                  Color(0XFF2932FF)
                ], // Цвета радиального градиента
                radius: 2.0, // Радиус радиального градиента
              ),
            ),
            child: Container(
              width: 90*vw,
              height: 6*vh,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  vertical: 1*vh), // Отступы внутри кнопки
              child: Text(
                'Зафиксировать',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 3.5*vw,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ExersicesCard extends StatefulWidget {
  Map<dynamic, dynamic> exercise;
  ExersicesCard({super.key, required this.exercise});

  @override
  State<ExersicesCard> createState() => _ExersicesCardState();
}

class _ExersicesCardState extends State<ExersicesCard> {
  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    List<Map<dynamic, dynamic>> sets = widget.exercise['sets'];
    // debugPrint(widget.exercise['pocazatel1Name']);
    return Container(
      padding: EdgeInsets.all(5 * vw),
      margin: EdgeInsets.only(top: 1 * vh),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.exercise['nameRu'],
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontSize: 5 * vw,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/img/videocamera.svg',
                      width: 3 * vh,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/img/chat.svg',
                        width: 2.7 * vh),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/img/warn.svg',
                        width: 2.7 * vh),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 3 * vh,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Сеты: ',
                  style: TextStyle(
                    color: const Color.fromARGB(84, 255, 255, 255),
                    fontSize: 3 * vw,
                    fontFamily: 'Manrope',
                  ),
                ),
              ),
              ...sets.map((e) => Expanded(
                    child: Text(
                      e['name'],
                      style: TextStyle(
                        color: const Color.fromARGB(84, 255, 255, 255),
                        fontSize: 3 * vw,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 1 * vh,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 1 * vw),
                  child: TextField(
                    cursorColor: Color.fromRGBO(112, 112, 112, 1),
                    style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                    decoration: InputDecoration(
                      hintText: '',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 4 * vw, vertical: 1.5 * vh),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4 * vw),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4 * vw),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 112, 112, 112),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ...sets.map((e) => Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 1 * vw),
                      child: TextField(
                        cursorColor: Color.fromARGB(255, 112, 112, 112),
                        style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                        decoration: InputDecoration(
                          hintText: '',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 4 * vw, vertical: 1.5 * vh),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4 * vw),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4 * vw),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 112, 112, 112),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
