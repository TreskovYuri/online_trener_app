import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width / 100;
    return Container(
      height: height*0.3,
      child: Padding(
        padding: EdgeInsets.only(top:height*0.1, left: 5*vw, right: 5*vw,bottom: 40),
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
                  fontSize: 6 * vw),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                decoration:BoxDecoration(
                    color: const Color.fromARGB(139, 40, 40, 40), // Цвет фона
                    borderRadius:
                        BorderRadius.circular(40.0), // Скругление углов
                  ),
                // color: Color.fromARGB(255, 58, 58, 58),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 11*vw, right: 11*vw),
                      decoration:BoxDecoration(
                    color: Color.fromARGB(138, 71, 71, 71), // Цвет фона
                    borderRadius:
                        BorderRadius.circular(40.0), // Скругление углов
                  ),
                      child: Padding(padding: EdgeInsets.all(10),
                      child: Text('Сервисы',
              style: TextStyle(
                  color: const Color.fromARGB(202, 255, 255, 255),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.none,
                  fontSize: 3.5 * vw),),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only( right: 7*vw),
                      child: Padding(padding: EdgeInsets.all(10),
                      child: Text('Уведомления',
              style: TextStyle(
                  color: const Color.fromARGB(202, 255, 255, 255),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.none,
                  fontSize: 3.5 * vw),),
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
