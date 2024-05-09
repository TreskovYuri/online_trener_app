import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/mobx/mobx.dart';

class CardServiceTrener extends StatelessWidget {
  const CardServiceTrener({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height;
    final mobx = Provider.of<Mobx>(context);
    return Container(
      // height: height*0.55,
      child: Padding(
        padding: EdgeInsets.all(5 * vw),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/img/card1_1_1.svg',
                          width: 15 * vw,
                        ),
                        onPressed: () {Navigator.pushNamed(context, '/faq');},
                      ),
                      Container(
                        width: 20 * vw,
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Справочник",
                          style: TextStyle(
                              color: Color.fromARGB(234, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: .011 * vh),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/img/card2_2_2.svg',
                          width: 15 * vw,
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        width: 20 * vw,
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Консультации",
                          style: TextStyle(
                              color: Color.fromARGB(234, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: .011 * vh),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/img/card3_3_3.svg',
                          width: 15 * vw,
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        width: 20 * vw,
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Блог",
                          style: TextStyle(
                              color: Color.fromARGB(234, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: .011 * vh),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/img/card2_2.svg',
                          width: 15 * vw,
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        width: 20 * vw,
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Шаблоны тренировок",
                          style: TextStyle(
                              color: Color.fromARGB(234, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: .011 * vh),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/img/card3_3.svg',
                          width: 15 * vw,
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        width: 20 * vw,
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Шаблоны питания",
                          style: TextStyle(
                              color: Color.fromARGB(234, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: .011 * vh),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/img/card6_6_6.svg',
                          width: 15 * vw,
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        width: 20 * vw,
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Спортивная программа",
                          style: TextStyle(
                              color: Color.fromARGB(234, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: .011 * vh),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/img/card4_4.svg',
                          width: 15 * vw,
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        width: 20 * vw,
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Нутриенты",
                          style: TextStyle(
                              color: Color.fromARGB(234, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: .011 * vh),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/img/card6_6.svg',
                          width: 15 * vw,
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        width: 20 * vw,
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Настройки",
                          style: TextStyle(
                              color: Color.fromARGB(234, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: .011 * vh),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
