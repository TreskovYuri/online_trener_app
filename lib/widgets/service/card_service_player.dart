import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trener_app/widgets/serviseCard/serviseCard.dart';

class CardServicePlayer extends StatelessWidget {
  const CardServicePlayer({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServiseCard(
                  svg: 'assets/img/card1_1.svg',
                  callback: () => {Navigator.pushNamed(context, '/profile')},
                  title: 'Профиль',
                ),
                // ServiseCard(
                //   svg: 'assets/img/card2_2.svg',
                //   callback: () =>
                //       {Navigator.pushNamed(context, '/workoutscheme')},
                //   title: 'Тренировки',
                // ),
                // ServiseCard(
                //   svg: 'assets/img/card3_3.svg',
                //   callback: () => {},
                //   title: 'Питание',
                // ),
                // ServiseCard(
                //   svg: 'assets/img/card4_4.svg',
                //   callback: () => {},
                //   title: 'Нутриенты',
                // ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ServiseCard(
                //   svg: 'assets/img/card5_5.svg',
                //   callback: () => {},
                //   title: 'Консультации',
                // ),
                // ServiseCard(
                //   svg: 'assets/img/card6_6.svg',
                //   callback: () => {},
                //   title: 'Настройки',
                // ),
                const Expanded(
                  flex: 1,
                  child: SizedBox.shrink(),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox.shrink(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
