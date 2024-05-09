import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trener_app/widgets/service/navbar.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(5 * vw),
          decoration: BoxDecoration(
            color: Color(0xFF1B1C20),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
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
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 3*vw,
                  padding: EdgeInsets.all(4 * vw),
                  decoration: BoxDecoration(
                      color: Color(0xFF23252B),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Найти...",
                        style: TextStyle(
                            color: Color.fromARGB(131, 236, 236, 236),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 4 * vw),
                      ),
                      Image(
                        image: const AssetImage('assets/img/search.png'),
                        width: 4 * vw,
                        height: 4 * vw,
                        fit: BoxFit
                            .cover, // Обрезать изображение в соответствии с размерами контейнера
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
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
                                  color: Color.fromARGB(131, 236, 236, 236),
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
              )),
              
            ],
          ),
        ),
      ),
            bottomNavigationBar:  Navbar(),
    );
  }
}
