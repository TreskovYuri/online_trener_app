import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/pages/chat/chats.dart';
import 'package:trener_app/pages/trener/lournal/journal.dart';
import 'package:trener_app/pages/profile.dart';
import 'package:trener_app/pages/sportsman/progress.dart';
import 'package:trener_app/pages/service.dart';
import 'package:trener_app/pages/trener/sportsmans/sportsmans.dart';

// Route _createRoute( Widget widget, ) {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => const Journal(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(-1.0, 0.0);
//       const end = Offset(0.0, 0.0);
//       const curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }

Route _createRoute(Widget widget, Offset begin, Offset end) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  MyUserController myUserController = Get.put(MyUserController());

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    final mobx = Provider.of<Mobx>(context);
    return Obx(() {
      if (myUserController.user['post'] == 'Тренер' ||
          myUserController.user['post'] == 'Супер тренер') {
        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 12 * vh,
            padding: EdgeInsets.symmetric(horizontal: 2 * vw),
            decoration: const BoxDecoration(
              color: Color(0xff1B1C20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 10000),
                  opacity: mobx.pageName == 'План' ? 1 : .4,
                  child: Container(
                    width: 18 * vw,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            if (mobx.pageName != 'План') {
                              Navigator.pushReplacementNamed(
                                context,
                                '/journal',
                              );
                              mobx.setPageName('План');
                            }
                          },
                          icon: SvgPicture.asset(
                            'assets/img/journal_trener.svg',
                            width: 2.4 * vh,
                          ),
                        ),
                        Text(
                          "План",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: 2.7 * vw),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Opacity(
                      opacity: mobx.pageName == 'Спортсмены' ? 1 : .4,
                      child: Container(
                        width: 18 * vw,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (mobx.pageName != 'Спортсмены') {
                                  Get.to(const Sportsmans());
                                  mobx.setPageName('Спортсмены');
                                }
                              },
                              icon: SvgPicture.asset(
                                'assets/img/pleers_trener.svg',
                                width: 2.6 * vh,
                              ), // Иконка, которая будет отображаться на кнопке
                            ),
                            Text(
                              "Спортсмены",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                  fontSize: 2.7 * vw),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/img/nav_plus.svg',
                              width: 7 * vh,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Opacity(
                  opacity: mobx.pageName == 'Чат' ? 1 : .4,
                  child: Container(
                    width: 18 * vw,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (mobx.pageName != 'Чат') {
                              Get.to(const Chats());
                              mobx.setPageName('Чат');
                            }
                          },
                          icon: SvgPicture.asset(
                            'assets/img/chats.svg',
                            width: 3 * vh,
                          ), // Иконка, которая будет отображаться на кнопке
                        ),
                        Text(
                          "Чат",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: 2.7 * vw),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Opacity(
                      opacity: mobx.pageName == 'Сервисы' ? 1 : .6,
                      child: Container(
                        width: 18 * vw,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (mobx.pageName != 'Сервисы') {
                                  Get.to(const Service());
                                  mobx.setPageName('Сервисы');
                                }
                              },
                              icon: SvgPicture.asset(
                                'assets/img/services.svg',
                                width: 3 * vh,
                              ), // Иконка, которая будет отображаться на кнопке
                            ),
                            Text(
                              "Сервисы",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                  fontSize: 2.7 * vw),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      } else {
        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 12 * vh,
            padding: EdgeInsets.symmetric(horizontal: 2 * vw),
            decoration: BoxDecoration(
              color: Color(0xff1B1C20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Opacity(
                  opacity: mobx.pageName == 'План' ? 1 : .4,
                  child: Container(
                    width: 18 * vw,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            if (mobx.pageName != 'План') {
                              Navigator.pushReplacementNamed(
                                context,
                                '/planner',
                              );
                              mobx.setPageName('План');
                            }
                            Navigator.pushReplacementNamed(
                              context,
                              '/planner',
                            );
                            mobx.setPageName('План');
                          },
                          icon: SvgPicture.asset(
                            'assets/img/journal.svg',
                            width: 3 * vh,
                          ),
                        ),
                        Text(
                          "План",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: 2.7 * vw),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Opacity(
                      opacity: mobx.pageName == 'Прогресс' ? 1 : .4,
                      child: Container(
                        width: 18 * vw,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (mobx.pageName != 'Прогресс') {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/user_progress',
                                  );
                                  mobx.setPageName('Прогресс');
                                }
                              },
                              icon: SvgPicture.asset(
                                'assets/img/pleers.svg',
                                width: 3.5 * vh,
                              ), // Иконка, которая будет отображаться на кнопке
                            ),
                            Text(
                              "Прогресс",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                  fontSize: 2.7 * vw),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/img/nav_plus.svg',
                              width: 7 * vh,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Opacity(
                  opacity: mobx.pageName == 'Чат' ? 1 : .4,
                  child: Container(
                    width: 18 * vw,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (mobx.pageName != 'Чат') {
                              Navigator.pushReplacementNamed(
                                context,
                                '/chats',
                              );
                              mobx.setPageName('Чат');
                            }
                          },
                          icon: SvgPicture.asset(
                            'assets/img/chats.svg',
                            width: 3 * vh,
                          ), // Иконка, которая будет отображаться на кнопке
                        ),
                        Text(
                          "Чат",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: 2.7 * vw),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Opacity(
                      opacity: mobx.pageName == 'Сервисы' ? 1 : .6,
                      child: Container(
                        width: 18 * vw,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (mobx.pageName != 'Сервисы') {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/service',
                                  );
                                  mobx.setPageName('Сервисы');
                                }
                              },
                              icon: SvgPicture.asset(
                                'assets/img/services.svg',
                                width: 3 * vh,
                              ), // Иконка, которая будет отображаться на кнопке
                            ),
                            Text(
                              "Сервисы",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                  fontSize: 2.7 * vw),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
