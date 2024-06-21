import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trener_app/widgets/serviseCard/serviseCard.dart';

class CardServiceTrener extends StatelessWidget {
  const CardServiceTrener({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiseCard(
                svg: 'assets/img/card1_1_1.svg',
                callback: () =>
                    {Navigator.pushReplacementNamed(context, '/faq')},
                title: 'Справочник',
              ),
              // ServiseCard(
              //   svg: 'assets/img/card2_2_2.svg',
              //   callback: () => {},
              //   title: 'Консультации',
              // ),
              // ServiseCard(
              //   svg: 'assets/img/card3_3_3.svg',
              //   callback: () => {},
              //   title: 'Блог',
              // ),
              ServiseCard(
                svg: 'assets/img/card2_2.svg',
                callback: () => {
                  Navigator.pushReplacementNamed(
                      context, '/trener_training_pattern')
                },
                title: 'Шаблоны тренировок',
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ServiseCard(
              //   svg: 'assets/img/card3_3.svg',
              //   callback: () => {},
              //   title: 'Шаблоны питания',
              // ),
              ServiseCard(
                svg: 'assets/img/card6_6_6.svg',
                callback: () => { Navigator.pushReplacementNamed(
                            context, '/trener_sportprogramm')},
                title: 'Спортивная программа',
              ),
              // ServiseCard(
              //   svg: 'assets/img/card4_4.svg',
              //   callback: () => { },
              //   title: 'Нутриенты',
              // ),
              // ServiseCard(
              //   svg: 'assets/img/card6_6.svg',
              //   callback: () => { },
              //   title: 'Настройки',
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
