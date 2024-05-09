import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
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
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5 * vw, vertical: 7 * vh),
            decoration: BoxDecoration(
              color: Color(0xFF1B1C20),
            ),
            child: ListView(
              controller: _scrollController,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Чаты",
                      style: TextStyle(
                          color: Color.fromARGB(255, 236, 236, 236),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          fontSize: 6 * vw),
                    ),
                    Image(
                      image: const AssetImage('assets/img/add_chat.png'),
                      width: 6 * vw,
                      height: 6 * vw,
                      fit: BoxFit
                          .cover, // Обрезать изображение в соответствии с размерами контейнера
                    ),
                  ],
                ),
                SizedBox(
                  height: 2 * vh,
                ),
                Padding(
                  padding: EdgeInsets.all(0 * vw),
                  child: TextField(
                    cursorColor: Color.fromARGB(255, 112, 112, 112),
                    style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                    decoration: InputDecoration(
                      hintText: 'Найти...',
                      filled: true, // Set to true to fill the background
                      fillColor: Color(0xff23252B), // Set background color
                      hintStyle: TextStyle(
                          color: Colors.grey), // Customize hint text color
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 4 * vw, vertical: 1.5 * vh),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // Remove border
                        borderRadius: BorderRadius.circular(4 * vw),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none, // Remove border
                        borderRadius: BorderRadius.circular(4 * vw),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 10 * vw),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: const AssetImage('assets/img/user1.png'),
                            width: 12 * vw,
                            height: 12 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                          SizedBox(
                            width: 5 * vw,
                          ),
                          Container(
                            width: 60 * vw,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Михаил Вирановский",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 236, 236, 236),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.none,
                                      fontSize: 4 * vw),
                                ),
                                Text(
                                  "Молодец",
                                  style: TextStyle(
                                      color: Color.fromARGB(131, 236, 236, 236),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                      fontSize: 4 * vw),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "10:00",
                                style: TextStyle(
                                    color: Color.fromARGB(131, 236, 236, 236),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    fontSize: 4 * vw),
                              ),
                              SizedBox(height: 2 * vw),
                              Container(
                                width: 7 * vw,
                                height: 7 * vw,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF4D8AEE),
                                      Color(0xFF2932FF),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(131, 236, 236, 236),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w800,
                                        decoration: TextDecoration.none,
                                        fontSize: 4 * vw),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 10 * vw),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: const AssetImage('assets/img/user2.png'),
                            width: 12 * vw,
                            height: 12 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                          SizedBox(
                            width: 5 * vw,
                          ),
                          Container(
                            width: 65 * vw,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Лев Кобяков",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 236, 236, 236),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.none,
                                      fontSize: 4 * vw),
                                ),
                                Text(
                                  "Сегодня тренировки не будет. Переносим на первые числа апреля. О датах сообщу позже",
                                  style: TextStyle(
                                      color: Color.fromARGB(131, 236, 236, 236),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                      fontSize: 4 * vw),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "ВС",
                                style: TextStyle(
                                    color: Color.fromARGB(131, 236, 236, 236),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    fontSize: 4 * vw),
                              ),
                              SizedBox(height: 2 * vw),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 10 * vw),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: const AssetImage('assets/img/user3.png'),
                            width: 12 * vw,
                            height: 12 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                          SizedBox(
                            width: 5 * vw,
                          ),
                          Container(
                            width: 65 * vw,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Филипп Лачков",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 236, 236, 236),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.none,
                                      fontSize: 4 * vw),
                                ),
                                Text(
                                  "Спасибо!",
                                  style: TextStyle(
                                      color: Color.fromARGB(131, 236, 236, 236),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                      fontSize: 4 * vw),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "ВТ",
                                style: TextStyle(
                                    color: Color.fromARGB(131, 236, 236, 236),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    fontSize: 4 * vw),
                              ),
                              SizedBox(height: 2 * vw),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 10 * vw),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: const AssetImage('assets/img/user4.png'),
                            width: 12 * vw,
                            height: 12 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                          SizedBox(
                            width: 5 * vw,
                          ),
                          Container(
                            width: 60 * vw,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Валерий Елизаров",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 236, 236, 236),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.none,
                                      fontSize: 4 * vw),
                                ),
                                Text(
                                  "Да, супер!",
                                  style: TextStyle(
                                      color: Color.fromARGB(131, 236, 236, 236),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                      fontSize: 4 * vw),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "ВТ",
                                style: TextStyle(
                                    color: Color.fromARGB(131, 236, 236, 236),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    fontSize: 4 * vw),
                              ),
                              SizedBox(height: 2 * vw),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _isAtTop ? Navbar() : NavbarScroll(),
        ],
      )),
    );
  }
}
