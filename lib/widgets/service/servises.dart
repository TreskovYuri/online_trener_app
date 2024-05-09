import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Services extends StatefulWidget {
  bool bl;
  Services({super.key, required this.bl});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            top: height * 0.1, left: 5 * vw, right: 5 * vw, bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Сервисы',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color.fromARGB(237, 255, 255, 255),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 3 * vh),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3 * vh),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(139, 40, 40, 40), // Цвет фона
                  borderRadius: BorderRadius.circular(40.0), // Скругление углов
                ),
                // color: Color.fromARGB(255, 58, 58, 58),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 1 * vh),
                        decoration: BoxDecoration(
                          color: widget.bl
                              ? Color.fromARGB(138, 71, 71, 71)
                              : Colors.transparent, // Цвет фона
                          borderRadius:
                              BorderRadius.circular(40.0), // Скругление углов
                        ),
                        child: Text(
                          'Сервисы',
                          style: TextStyle(
                              color: const Color.fromARGB(202, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.none,
                              fontSize: 1.5 * vh),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 1 * vh),
                        decoration: BoxDecoration(
                          color: !widget.bl
                              ? Color.fromARGB(138, 71, 71, 71)
                              : Colors.transparent, // Цвет фона
                          borderRadius:
                              BorderRadius.circular(40.0), // Скругление углов
                        ),
                        child: Text(
                          'Уведомления',
                          style: TextStyle(
                              color: const Color.fromARGB(202, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.none,
                              fontSize: 1.5 * vh),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
