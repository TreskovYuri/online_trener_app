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
  String edIzm = 'кг';
  String geoup = 'скоростной';

  void setType(String newType) {
    setState(() {
      type = newType;
    });
  }

  void setEdIzm(String newEd) {
    setState(() {
      edIzm = newEd;
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
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 10, left: 30),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              'assets/img/x_white.svg',
                            )),
                      ],
                    ),
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
          page == 2
              ? Page2(vh: vh, vw: vw, edIzm: edIzm, setEdIzm: setEdIzm)
              : SizedBox.shrink(),
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
        SizedBox(
          height: 80,
        ),
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
  Page2(
      {super.key,
      required this.vh,
      required this.vw,
      required this.edIzm,
      required this.setEdIzm});
  double vw;
  double vh;
  String edIzm;
  Function setEdIzm;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String type = '';
  String localEdIzm = 'кг';
  String localGroup = 'Мои группы';
  List<String> groupList = [
    'скоростной',
    "силовой",
    "на выносливость",
    "на ловкость"
  ];

  void serLocalEdIzm(newEd) {
    setState(() {
      localEdIzm = newEd;
    });
  }

  void setLocalGroup(group) {
    setState(() {
      localGroup = group;
    });
  }

  void addGroup(newGroup) {
    if (groupList.contains(newGroup)) {
      Get.snackbar('Ошибка воода!', 'Такая группа уже существует!',
          colorText: Colors.white);
    } else {
      setState(() {
        groupList.add(newGroup);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String edIzm = widget.edIzm;
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
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (_) => ModalEdIzm(
                              localEdIzm: localEdIzm,
                              serLocalEdIzm: serLocalEdIzm));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(112, 1, 110, 179),
                      backgroundColor: const Color(0xff23252B),
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
                            localEdIzm,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color.fromARGB(115, 255, 255, 255),
                                fontSize: 4 * vw,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Manrope'),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color.fromARGB(155, 255, 255, 255),
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
                      Text('Значение норматива',
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
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              Text('Значение норматива',
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
          padding: const EdgeInsets.all(12),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (_) => ModalGroup(
                      localEdIzm: localGroup,
                      serLocalEdIzm: setLocalGroup,
                      groupList: groupList));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(112, 1, 110, 179),
              backgroundColor: const Color(0xff23252B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    3 * vw), // Устанавливаем радиус круглых углов
              ),
            ),
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    localGroup,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(115, 255, 255, 255),
                        fontSize: 4 * vw,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Manrope'),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color.fromARGB(155, 255, 255, 255),
                  )
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (_) => ModalAddNewGroup(addGroup: addGroup));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text('Создать новую',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff4D8AEE),
                        fontSize: 3.3 * vw,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Manrope')),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 3 * vh,
        ),
        ElevatedButton(
          child: Container(
            width: 95 * vw,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10 * vw),
              gradient: const RadialGradient(
                colors: [
                  Color(0xff4D8AEE),
                  Color(0xff2932FF),
                ],
                radius: 5, // Радиус градиента
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 1 * vh),
            child: Text(
              'Добавить',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 4 * vw,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Manrope'),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // Чтобы сделать фон прозрачным
            shadowColor: Colors.transparent, // Чтобы убрать тень
          ).copyWith(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            elevation: MaterialStateProperty.all<double>(0),
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            // Радиальный градиент
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
          onPressed: () {
            // Вызываем функцию обратного вызова для установки группы мышц
          },
        ),
        SizedBox(height: 50,)
      ],
    );
  }
}

class ModalAddNewGroup extends StatefulWidget {
  ModalAddNewGroup({super.key, required this.addGroup});
  Function addGroup;

  @override
  State<ModalAddNewGroup> createState() => _ModalAddNewGroupState();
}

class _ModalAddNewGroupState extends State<ModalAddNewGroup> {
  final TextEditingController inputController = TextEditingController();
  String inputText = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff1B1C20),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
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
                    padding: EdgeInsets.only(top: 2),
                    alignment: Alignment.center,
                    child: const Text(
                      'Закрыть',
                      style: TextStyle(
                        color: Color(0xff4D8AEE),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Добавление оборудование',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    if (inputController.text.length > 0) {
                      widget.addGroup(inputController.text);
                      Navigator.pop(context);
                    } else {
                      Get.snackbar(
                          'Ошибка ввода!', 'Поле ввода не может быть пустым...',
                          colorText: Color.fromARGB(181, 255, 255, 255));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 2),
                    alignment: Alignment.center,
                    child: const Text(
                      'Добавить',
                      style: TextStyle(
                        color: Color(0xff4D8AEE),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: inputController,
              onChanged: (value) {
                setState(() {
                  inputText = value;
                });
              },
              cursorColor: Color.fromRGBO(112, 112, 112, 1),
              style: const TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Название оборудования',
                hintStyle: const TextStyle(
                  color: Colors.grey, // Цвет текста плейсхолдера
                  fontSize: 16, // Размер текста плейсхолдера
                  fontWeight:
                      FontWeight.normal, // Начертание текста плейсхолдера
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 112, 112, 112),
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}

class ModalEdIzm extends StatefulWidget {
  ModalEdIzm(
      {super.key, required this.localEdIzm, required this.serLocalEdIzm});
  String localEdIzm;
  Function serLocalEdIzm;
  @override
  State<ModalEdIzm> createState() => _ModalEdIzmState();
}

class _ModalEdIzmState extends State<ModalEdIzm> {
  String widgetModalEdIzm = 'кг';

  @override
  void initState() {
    setState(() {
      widgetModalEdIzm = widget.localEdIzm;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> typeList = ['кг', 'сек', 'раз', 'км', 'мин'];
    return Container(
      height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff1B1C20),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        children: [
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
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: const Text(
                      'Закрыть',
                      style: TextStyle(
                        color: Color(0xff4D8AEE),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Единица измерения',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: const Text(
                      'Добавить',
                      style: TextStyle(
                        color: Color(0xff4D8AEE),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xff23252B),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                ...typeList.map(
                  (e) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      foregroundColor: const Color.fromARGB(112, 1, 110, 179),
                      backgroundColor: const Color(0xff23252B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            7), // Устанавливаем радиус круглых углов
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        widgetModalEdIzm = e;
                      });
                      widget.serLocalEdIzm(e);
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
                        widgetModalEdIzm == e
                            ? SvgPicture.asset(
                                'assets/img/ok_white.svg',
                                width: 15,
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ModalGroup extends StatefulWidget {
  ModalGroup(
      {super.key,
      required this.localEdIzm,
      required this.serLocalEdIzm,
      required this.groupList});
  String localEdIzm;
  Function serLocalEdIzm;
  List<String> groupList;
  @override
  State<ModalGroup> createState() => _ModalGroupState();
}

class _ModalGroupState extends State<ModalGroup> {
  String widgetModalEdIzm = 'кг';
  List<String> typeList = [];

  @override
  void initState() {
    setState(() {
      widgetModalEdIzm = widget.localEdIzm;
      typeList = widget.groupList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff1B1C20),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: ListView(
        children: [
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
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: const Text(
                      'Закрыть',
                      style: TextStyle(
                        color: Color(0xff4D8AEE),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Мои группы',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: const Text(
                      'Сохранить',
                      style: TextStyle(
                        color: Color(0xff4D8AEE),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xff23252B),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                ...typeList.map(
                  (e) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      foregroundColor: const Color.fromARGB(112, 1, 110, 179),
                      backgroundColor: const Color(0xff23252B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            7), // Устанавливаем радиус круглых углов
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        widgetModalEdIzm = e;
                      });
                      widget.serLocalEdIzm(e);
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
                        widgetModalEdIzm == e
                            ? SvgPicture.asset(
                                'assets/img/ok_white.svg',
                                width: 15,
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
