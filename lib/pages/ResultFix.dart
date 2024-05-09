import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ResultFix extends StatefulWidget {
  final Map<dynamic, dynamic> map;

  const ResultFix({Key? key, required this.map}) : super(key: key);

  @override
  State<ResultFix> createState() => _ResultFixState();
}

class _ResultFixState extends State<ResultFix> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    final currentDate = DateTime.now();
    final formattedDate =
        DateFormat.Hm(Localizations.localeOf(context).languageCode)
            .format(currentDate);

    _controller.text = DateFormat(
            'd ${MonthToRus(DateTime.now().month)} ${DateTime.now().year}г. ${formattedDate}')
        .format(DateTime.now());

    return Container(
      height: 80 * vh,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xff1B1C20),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 1 * vh),
            width: 15 * vw,
            height: 4,
            decoration: BoxDecoration(
                color: const Color.fromARGB(59, 255, 255, 255),
                borderRadius: BorderRadius.circular(50 * vw)),
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        alignment: Alignment.center,
                        child: Text('Закрыть',
                            style: TextStyle(
                                color: Color(0xff4D8AEE),
                                fontSize: 3.3 * vw,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Manrope'))),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2 * vh,
                        ),
                        Text(
                          widget.map['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontSize: 4 * vw,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                        alignment: Alignment.center,
                        child: Text('Сохранить',
                            style: TextStyle(
                                color: Color(0xff4D8AEE),
                                fontSize: 3.3 * vw,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Manrope'))),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5 * vw),
            child: Row(
              children: [
                Text('Дата',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(115, 255, 255, 255),
                        fontSize: 3.3 * vw,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope')),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5 * vw),
            child: TextField(
              controller: _controller,
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
          Padding(
            padding: EdgeInsets.all(5 * vw),
            child: Row(
              children: [
                Text('Вес',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(115, 255, 255, 255),
                        fontSize: 3.3 * vw,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope')),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5 * vw),
            child: TextField(
              cursorColor: Color.fromRGBO(112, 112, 112, 1),
              style: TextStyle(color: Colors.white, fontSize: 4 * vw),
              decoration: InputDecoration(
                hintText: '80.0 кг',
                hintStyle: const TextStyle(
                  color: Colors.grey, // Цвет текста плейсхолдера
                  fontSize: 16, // Размер текста плейсхолдера
                  fontWeight:
                      FontWeight.normal, // Начертание текста плейсхолдера
                ),
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
        ],
      ),
    );
  }
}

String MonthToRus(int num) {
  switch (num) {
    case 1:
      return 'Янв.';
    case 2:
      return 'Фев.';
    case 3:
      return 'Мар.';
    case 4:
      return 'Апр.';
    case 5:
      return 'Мая';
    case 6:
      return 'Июня';
    case 7:
      return 'Июля';
    case 8:
      return 'Авг.';
    case 9:
      return 'Сент.';
    case 10:
      return 'Окт.';
    case 11:
      return 'Нояб.';
    case 12:
      return 'Декаб.';
    default:
      return ''; // Обработка неправильного ввода
  }
}
