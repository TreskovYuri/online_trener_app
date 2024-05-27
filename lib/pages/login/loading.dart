import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  @override
  void initState() {
    
    super.initState();
    // После инициализации состояния задержка на 3 секунды, затем переход на другую страницу
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        '/login', // Переход на login
      );
    });
  }

  @override
  Widget build(BuildContext context) {
  
    final vw = MediaQuery.of(context).size.width / 100;


    return Hero(
      tag: '1qwq',
      child: Scaffold(
        body: Container(
          width: 100 * vw,
          color: Color(0xff1B1C20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Expanded(
                child: SizedBox(
                  height: 1,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:[ 
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/ska_logo.png',
                          width: 30 * vw,
                        ),
                        SizedBox(
                          width: 5 * vw,
                        ),
                        Image.asset(
                          'assets/img/km_logo.png',
                          width: 30 * vw,
                        ),
                      ],
                    ),
                      Text(
                      textAlign: TextAlign.center,
                      "Онлайн тренер",
                      style: TextStyle(
                          color: const Color.fromARGB(234, 255, 255, 255),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          fontSize: 6 * vw),
                    ),
                    
                    ]
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    margin:  EdgeInsets.all(15*vw),
                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 2500,
                      lineHeight: 10,
                      percent: 1,
                      progressColor: const Color.fromARGB(255, 41, 123, 255),
                      backgroundColor: Colors.transparent,
                    )),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 80 * vw,
                  margin: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      textAlign: TextAlign.center,
                      "Хорошие игроки находятся там, где шайба. Великие – там, где она будет",
                      style: TextStyle(
                          color: const Color.fromARGB(234, 255, 255, 255),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          fontSize: 3.7 * vw),
                    ),
                    SizedBox(
                      height: 4 * vw,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Уэйн Гретцки",
                      style: TextStyle(
                          color: const Color.fromARGB(119, 255, 255, 255),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          fontSize: 3.3 * vw),
                    ),
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





//             Container(
//               width: 80 * vw,
//               child: Column(
//                 children: [
//                   Text(
//                     textAlign: TextAlign.center,
//                     "Хорошие игроки находятся там, где шайба. Великие – там, где она будет",
//                     style: TextStyle(
//                         color: const Color.fromARGB(234, 255, 255, 255),
//                         fontFamily: 'Manrope',
//                         fontWeight: FontWeight.w400,
//                         decoration: TextDecoration.none,
//                         fontSize: 4.5 * vw),
//                   ),
//                   SizedBox(
//                     height: 4 * vw,
//                   ),
//                   Text(
//                     textAlign: TextAlign.center,
//                     "Уэйн Гретцки",
//                     style: TextStyle(
//                         color: const Color.fromARGB(119, 255, 255, 255),
//                         fontFamily: 'Manrope',
//                         fontWeight: FontWeight.w600,
//                         decoration: TextDecoration.none,
//                         fontSize: 3.3 * vw),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }