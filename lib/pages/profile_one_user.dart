import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/getx/getx.dart';
import 'package:trener_app/getx/getx_controller.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/models/user.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';

class ProfileOneUser extends StatefulWidget {
  const ProfileOneUser({super.key});

  @override
  State<ProfileOneUser> createState() => _ProfileOneUserState();
}

class _ProfileOneUserState extends State<ProfileOneUser> {
  ScrollController _scrollController = ScrollController();
  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _isAtTop = _scrollController.position.pixels == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    MyGetxController getx = MyGetxController();
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final vw = MediaQuery.of(context).size.width / 100;
    final mobx = Provider.of<Mobx>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        leading: IconButton(
          icon: const Icon(Icons
              .arrow_back_ios_new_rounded), // Устанавливаем иконку "домой" вместо стрелки "назад"
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/sportsmans');
          },
        ),
        backgroundColor: const Color(0xff1B1C20),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: EdgeInsets.only(top: 5 * vw, bottom: 5 * vw),
            color: const Color(0xff1B1C20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: arguments['img'] != null
                        ? Image.network(
                            'https://mobilecoach.ru:5004/assets/${arguments['img']}',
                            // width: 35 * vw,
                            height: 35 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          )
                        : Image(
                            image: AssetImage('assets/img/user${arguments['id']}.png'),
                            // width: 35 * vw,
                            height: 35 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          )),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 5 * vw),
                    child: Text(
                      arguments['name'],
                      style: TextStyle(
                          color: const Color.fromARGB(223, 236, 236, 236),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          fontSize: 5 * vw),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 1 * vw),
                    child: Text(
                      arguments['date']+'г',
                      style: TextStyle(
                          color: const Color.fromARGB(123, 236, 236, 236),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          fontSize: 4 * vw),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 5 * vw),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: .9 * vw,
                              bottom: .9 * vw,
                              left: 5 * vw,
                              right: 5 * vw),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 41, 41, 41)),
                          child: Text(
                            arguments['post'],
                            style: TextStyle(
                                color: const Color.fromARGB(123, 236, 236, 236),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                fontSize: 4 * vw),
                          ),
                        ),
                        SizedBox(
                          width: 3 * vw,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: .9 * vw,
                              bottom: .9 * vw,
                              left: 5 * vw,
                              right: 5 * vw),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 41, 41, 41)),
                          child: Text(
                            arguments['team'],
                            style: TextStyle(
                                color: const Color.fromARGB(123, 236, 236, 236),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                fontSize: 4 * vw),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5 * vw),
                          margin: EdgeInsets.only(
                            top: 7 * vw,
                            right: 3 * vw,
                            left: 3 * vw,
                          ),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(125, 41, 41, 41),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Номер телефона",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                123, 236, 236, 236),
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.none,
                                            fontSize: 4 * vw),
                                      ),
                                      Text(
                                        arguments['number'],
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 236, 236, 236),
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.none,
                                            fontSize: 4 * vw),
                                      ),
                                    ],
                                  ),
                                  Opacity(
                                      opacity: .7,
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                        size: 4 * vw,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 5 * vw,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Почта",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                123, 236, 236, 236),
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.none,
                                            fontSize: 4 * vw),
                                      ),
                                      Text(
                                        arguments['email'],
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 236, 236, 236),
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.none,
                                            fontSize: 4 * vw),
                                      ),
                                    ],
                                  ),
                                  Opacity(
                                      opacity: .7,
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                        size: 4 * vw,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                       
                      ],
                    )),
              ],
            ),
          ),
          _isAtTop ? const Navbar() : const NavbarScroll(),
        ],
      ),
    );
  }
}
