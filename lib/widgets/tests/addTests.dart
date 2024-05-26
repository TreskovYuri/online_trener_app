import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyTestsController.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/http/testUtills.dart';

class ModalAddTest extends StatefulWidget {
  const ModalAddTest({super.key});

  @override
  State<ModalAddTest> createState() => _ModalAddTestState();
}

class _ModalAddTestState extends State<ModalAddTest> {
  int page = 1;
  String type = '';
  String edIzm = 'кг';
  int group = 0;
  final TextEditingController name = TextEditingController();
  final TextEditingController nameEng = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController descriptionEng = TextEditingController();
  final TextEditingController itemController = TextEditingController();
  MyTestsController myTestsController = Get.put(MyTestsController());
  MyUserController myUserController = Get.put(MyUserController());

  @override
  void initState() {
    GetTestGroups();
    super.initState();
  }

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
      child: Stack(
        children: [
          Column(
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
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
              ),
              Container(
                height: 80 * vh,
                child: ListView(
                  children: [
                    page == 1
                        ? Page1(
                            setType: setType,
                          )
                        : const SizedBox.shrink(),
                    page == 2
                        ? Page2(
                            vh: vh,
                            vw: vw,
                            edIzm: edIzm,
                            setEdIzm: setEdIzm,
                            descriptionController: description,
                            descriptionEngController: descriptionEng,
                            nameController: name,
                            nameEngController: nameEng,
                            itemController: itemController,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              )
            ],
          ),
          page == 2
              ? Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Obx(
                    () {
                      final currentGroup = myTestsController.currentGroup.value;
                      final currentType = myTestsController.currentType.value;
                      return  ElevatedButton(
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
                        backgroundColor:
                            Colors.transparent, // Чтобы сделать фон прозрачным
                        shadowColor: Colors.transparent, // Чтобы убрать тень
                      ).copyWith(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        elevation: MaterialStateProperty.all<double>(0),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        // Радиальный градиент
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (name.text == '' ||
                            currentGroup == 0) {
                          Get.snackbar(
                              'Ошибка воода!', 'Заполните обязательные поля!',
                              colorText: Colors.white);
                          return;
                        }
                        AddTest(formData: {
                          "name": name.text,
                          "nameEng": nameEng.text,
                          "description": description.text,
                          "descriptionEng": descriptionEng.text,
                          'type': currentType.toString(),
                          "item": itemController.text,
                          'groupId': currentGroup.toString(),
                          'userId':myUserController.user['id'].toString()
                        });
                      },
                    );
                    }
                  ))
              : const SizedBox.shrink(),
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
  Page2({
    super.key,
    required this.vh,
    required this.vw,
    required this.edIzm,
    required this.setEdIzm,
    required this.nameController,
    required this.nameEngController,
    required this.descriptionController,
    required this.descriptionEngController,
    required this.itemController,
  });
  TextEditingController nameController;
  TextEditingController nameEngController;
  TextEditingController descriptionController;
  TextEditingController descriptionEngController;
  TextEditingController itemController;
  double vw;
  double vh;
  String edIzm;
  Function setEdIzm;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  MyTestsController myTestsController = Get.put(MyTestsController());
  String type = '';
  String localEdIzm = 'кг';
  String localGroup = 'Мои группы';
  late List<Map<String, dynamic>> groupList;

  @override
  void initState() {
    groupList = myTestsController.groups;
    super.initState();
  }

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
            controller: widget.nameController,
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
            controller: widget.nameEngController,
            cursorColor: Color.fromARGB(255, 112, 112, 112),
            style: TextStyle(color: Colors.white, fontSize: 4 * vw),
            decoration: InputDecoration(
              hintText: 'Test name',
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
            controller: widget.descriptionController,
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
                      color: const Color.fromARGB(115, 255, 255, 255),
                      fontSize: 3.3 * vw,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope')),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(3 * vw),
          child: TextField(
            controller: widget.descriptionEngController,
            cursorColor: const Color.fromARGB(255, 112, 112, 112),
            style: TextStyle(color: Colors.white, fontSize: 4 * vw),
            decoration: InputDecoration(
              hintText: 'Description',
              filled: true, // Set to true to fill the background
              fillColor: const Color(0xff23252B), // Set background color
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
                              color: const Color.fromARGB(115, 255, 255, 255),
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
                      cursorColor: const Color.fromARGB(255, 112, 112, 112),
                      style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                      decoration: InputDecoration(
                        hintText: '40',
                        filled: true, // Set to true to fill the background
                        fillColor:
                            const Color(0xff23252B), // Set background color
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
                      color: const Color.fromARGB(115, 255, 255, 255),
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
                      groupList: myTestsController.groups));
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
                        color: const Color.fromARGB(115, 255, 255, 255),
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
        const SizedBox(
          height: 50,
        )
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
  MyUserController myUserController = Get.put(MyUserController());
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
                    padding: const EdgeInsets.only(top: 20),
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
                          'Добавление группы',
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
                      AddTestGroup(formData: {
                        "name": inputText,
                        "userId": myUserController.user['id'].toString()
                      });
                      Navigator.pop(context);
                    } else {
                      Get.snackbar(
                          'Ошибка ввода!', 'Поле ввода не может быть пустым...',
                          colorText: Color.fromARGB(181, 255, 255, 255));
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
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
  MyTestsController myTestsController = Get.put(MyTestsController());

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
                        myTestsController.setCurrentType(e);
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
  List<Map<String, dynamic>> groupList;
  @override
  State<ModalGroup> createState() => _ModalGroupState();
}

class _ModalGroupState extends State<ModalGroup> {
  MyTestsController myTestsController = Get.put(MyTestsController());
  String widgetModalEdIzm = 'кг';
  List<Map<String, dynamic>> typeList = [];

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
            height: 300,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xff23252B),
                borderRadius: BorderRadius.circular(25)),
            child: ListView(
              shrinkWrap: true,
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
                        widgetModalEdIzm = e['name'];
                        myTestsController.setCurrentGroup(e['id']);
                      });
                      widget.serLocalEdIzm(e['name']);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          e['name'],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Manrope',
                          ),
                        ),
                        widgetModalEdIzm == e['name']
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
