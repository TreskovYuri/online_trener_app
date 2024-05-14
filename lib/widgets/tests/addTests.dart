import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ModalAddTest extends StatefulWidget {
  const ModalAddTest({super.key});

  @override
  State<ModalAddTest> createState() => _ModalAddTestState();
}

class _ModalAddTestState extends State<ModalAddTest> {
  int page = 1;
  String type = '';

  void setType(String newType) {
    setState(() {
      type = newType;
    });
  }

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;

    return Container(
      height: 90 * vh,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff1B1C20),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40 * vw),
            child: Container(
              margin: EdgeInsets.only(top: 1 * vh),
              width: 15 * vw,
              height: 4,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(59, 255, 255, 255),
                  borderRadius: BorderRadius.circular(50 * vw)),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/img/x_white.svg',
                        )),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Тесты',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 25),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      page++;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: page == 1
                        ? Text(
                            'Далее',
                            style: TextStyle(
                              color: Color(0xff4D8AEE),
                              fontSize: 3.5 * vw,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Manrope',
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                ),
              )
            ],
          ),
          page == 1
              ? Page1(
                  setType: setType,
                )
              : SizedBox.shrink(),
          page == 2 ? Page2(vh: vh, vw: vw) : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  Page1({super.key, required this.setType});
  Function setType;

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String type = 'На льду';
  List<String> typeList = [
    'На льду',
    'Силовой',
    'Прыжковый',
    'Скоростной',
    'Медицинский'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0xff23252B),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              ...typeList.map((e) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    foregroundColor: Color.fromARGB(112, 1, 110, 179),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          7), // Устанавливаем радиус круглых углов
                    ),
                  ),
                  onPressed: () {
                    widget.setType(e);
                    setState(() {
                      type = e;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Manrope',
                        ),
                      ),
                      type == e
                          ? SvgPicture.asset(
                              'assets/img/ok_white.svg',
                              width: 15,
                            )
                          : SizedBox.shrink(),
                    ],
                  )))
            ],
          ),
        )
      ],
    );
  }
}

class Page2 extends StatefulWidget {
  Page2({super.key, required this.vh, required this.vw});
  double vw;
  double vh;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    double vw = widget.vw;
    double vh = widget.vh;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(3 * vw, 7 * vw, 3 * vw, 1 * vw),
          child: Row(
            children: [
              Text('Введите название',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromARGB(115, 255, 255, 255),
                      fontSize: 3.3 * vw,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope')),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(3 * vw),
          child: TextField(
            cursorColor: Color.fromARGB(255, 112, 112, 112),
            style: TextStyle(color: Colors.white, fontSize: 4 * vw),
            decoration: InputDecoration(
              hintText: 'Название теста',
              filled: true, // Set to true to fill the background
              fillColor: Color(0xff23252B), // Set background color
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope'), // Customize hint text color
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 4 * vw, vertical: 1.5 * vh),
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
        Padding(
          padding: EdgeInsets.fromLTRB(3 * vw, 3 * vw, 3 * vw, 0 * vw),
          child: Row(
            children: [
              Text('Название на английском',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromARGB(115, 255, 255, 255),
                      fontSize: 3.3 * vw,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope')),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(3 * vw),
          child: TextField(
            cursorColor: Color.fromARGB(255, 112, 112, 112),
            style: TextStyle(color: Colors.white, fontSize: 4 * vw),
            decoration: InputDecoration(
              hintText: 'Workout name',
              filled: true, // Set to true to fill the background
              fillColor: Color(0xff23252B), // Set background color
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope'), // Customize hint text color
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 4 * vw, vertical: 1.5 * vh),
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
        Padding(
          padding: EdgeInsets.fromLTRB(3 * vw, 3 * vw, 3 * vw, 0 * vw),
          child: Row(
            children: [
              Text('Введите описание',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromARGB(115, 255, 255, 255),
                      fontSize: 3.3 * vw,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope')),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(3 * vw),
          child: TextField(
            cursorColor: Color.fromARGB(255, 112, 112, 112),
            style: TextStyle(color: Colors.white, fontSize: 4 * vw),
            decoration: InputDecoration(
              hintText: 'Описание теста',
              filled: true, // Set to true to fill the background
              fillColor: Color(0xff23252B), // Set background color
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope'), // Customize hint text color
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 4 * vw, vertical: 1.5 * vh),
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
        Padding(
          padding: EdgeInsets.fromLTRB(3 * vw, 3 * vw, 3 * vw, 0 * vw),
          child: Row(
            children: [
              Text('Введите описание на английском',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromARGB(115, 255, 255, 255),
                      fontSize: 3.3 * vw,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope')),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(3 * vw),
          child: TextField(
            cursorColor: Color.fromARGB(255, 112, 112, 112),
            style: TextStyle(color: Colors.white, fontSize: 4 * vw),
            decoration: InputDecoration(
              hintText: 'Description',
              filled: true, // Set to true to fill the background
              fillColor: Color(0xff23252B), // Set background color
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope'), // Customize hint text color
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 4 * vw, vertical: 1.5 * vh),
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
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Единица измерения',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Color.fromARGB(115, 255, 255, 255),
                              fontSize: 3.3 * vw,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope')),
                    ],
                  ),
                  SizedBox(
                    height: 1 * vh,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(112, 1, 110, 179),
                      backgroundColor: Color(0xff23252B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            3 * vw), // Устанавливаем радиус круглых углов
                      ),
                    ),
                    child: Container(
                      width: 140,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'кг',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color.fromARGB(115, 255, 255, 255),
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Manrope'),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: const Color.fromARGB(155, 255, 255, 255),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Единица измерения',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Color.fromARGB(115, 255, 255, 255),
                              fontSize: 3.3 * vw,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope')),
                    ],
                  ),
                  SizedBox(
                    height: 1 * vh,
                  ),
                  Container(
                    width: 190,
                    child: TextField(
                      cursorColor: Color.fromARGB(255, 112, 112, 112),
                      style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                      decoration: InputDecoration(
                        hintText: '40',
                        filled: true, // Set to true to fill the background
                        fillColor: Color(0xff23252B), // Set background color
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Manrope'), // Customize hint text color
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
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}


