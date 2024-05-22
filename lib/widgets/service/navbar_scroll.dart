import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/mobx/mobx.dart';

class NavbarScroll extends StatefulWidget {
  const NavbarScroll({super.key});

  @override
  State<NavbarScroll> createState() => _NavbarScrollState();
}

class _NavbarScrollState extends State<NavbarScroll> {
  MyUserController myUserController = Get.put(MyUserController());

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    final mobx = Provider.of<Mobx>(context);
    if (myUserController.user['post'] == 'Тренер' ||
        myUserController.user['post'] == 'Супер тренер') {
      return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 10 * vh,
          width: 90 * vw,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(2 * vw),
          padding: EdgeInsets.symmetric(horizontal: 2 * vw),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5 * vw),
            color: Color.fromARGB(82, 42, 42, 42),

            // color: Color.fromARGB(24, 77, 77, 77),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Observer(builder: (context) {
                  return Opacity(
                    opacity: mobx.pageName == 'План' ? 1 : .4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            Navigator.pushReplacementNamed(
                              context,
                              '/journal',
                            );
                            mobx.setPageName('План');
                          },
                          icon: SvgPicture.asset(
                            'assets/img/journal_trener.svg',
                            width: 2.4 * vh,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                Row(
                  children: [
                    Observer(builder: (context) {
                      return Opacity(
                        opacity: mobx.pageName == 'Спортсмены' ? 1 : .4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                mobx.setPageName('Спортсмены');
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/user_progress',
                                );
                              },
                              icon: SvgPicture.asset(
                                'assets/img/pleers_trener.svg',
                                width: 2.6 * vh,
                              ), // Иконка, которая будет отображаться на кнопке
                            ),
                          ],
                        ),
                      );
                    })
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
                Observer(builder: (context) {
                  return Opacity(
                    opacity: mobx.pageName == 'Чат' ? 1 : .4,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/chats');
                              mobx.setPageName('Чат');
                            },
                            icon: SvgPicture.asset(
                              'assets/img/chats.svg',
                              width: 3 * vh,
                            ), // Иконка, которая будет отображаться на кнопке
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                Row(
                  children: [
                    Observer(builder: (context) {
                      return Opacity(
                        opacity: mobx.pageName == 'Сервисы' ? 1 : .6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/service',
                                );
                                mobx.setPageName('Сервисы');
                              },
                              icon: SvgPicture.asset(
                                'assets/img/services.svg',
                                width: 3 * vh,
                              ), // Иконка, которая будет отображаться на кнопке
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 10 * vh,
          width: 90 * vw,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(2 * vw),
          padding: EdgeInsets.symmetric(horizontal: 2 * vw),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5 * vw),
            color: Color.fromARGB(82, 42, 42, 42),

            // color: Color.fromARGB(24, 77, 77, 77),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Observer(builder: (context) {
                  return Opacity(
                    opacity: mobx.pageName == 'План' ? 1 : .4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
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
                      ],
                    ),
                  );
                }),
                Row(
                  children: [
                    Observer(builder: (context) {
                      return Opacity(
                        opacity: mobx.pageName == 'Прогресс' ? 1 : .4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                mobx.setPageName('Прогресс');
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/user_progress',
                                );
                              },
                              icon: SvgPicture.asset(
                                'assets/img/pleers.svg',
                                width: 3.5 * vh,
                              ), // Иконка, которая будет отображаться на кнопке
                            ),
                          ],
                        ),
                      );
                    })
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
                Observer(builder: (context) {
                  return Opacity(
                    opacity: mobx.pageName == 'Чат' ? 1 : .4,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/chats');
                              mobx.setPageName('Чат');
                            },
                            icon: SvgPicture.asset(
                              'assets/img/chats.svg',
                              width: 3 * vh,
                            ), // Иконка, которая будет отображаться на кнопке
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                Row(
                  children: [
                    Observer(builder: (context) {
                      return Opacity(
                        opacity: mobx.pageName == 'Сервисы' ? 1 : .6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/service',
                                );
                                mobx.setPageName('Сервисы');
                              },
                              icon: SvgPicture.asset(
                                'assets/img/services.svg',
                                width: 3 * vh,
                              ), // Иконка, которая будет отображаться на кнопке
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
