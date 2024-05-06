import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trener_app/widgets/nitification/navbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 15 * vw, bottom: 5 * vw),
          color: const Color.fromARGB(255, 23, 23, 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: const AssetImage('assets/img/avatar.png'),
                width: 35 * vw,
                height: 35 * vw,
                fit: BoxFit
                    .cover, // Обрезать изображение в соответствии с размерами контейнера
              ),
              Padding(
                padding: EdgeInsets.only(top: 5 * vw),
                child: Text(
                  "Иванов Иван Иванович",
                  style: TextStyle(
                      color: Color.fromARGB(223, 236, 236, 236),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 5 * vw),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1 * vw),
                child: Text(
                  "21 г • 173 см • 73 кг ",
                  style: TextStyle(
                      color: Color.fromARGB(123, 236, 236, 236),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 4 * vw),
                ),
              ),
              Container(
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
                          color: Color.fromARGB(255, 41, 41, 41)),
                      child: Text(
                        "Вратарь",
                        style: TextStyle(
                            color: Color.fromARGB(123, 236, 236, 236),
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
                          color: Color.fromARGB(255, 41, 41, 41)),
                      child: Text(
                        "CКА",
                        style: TextStyle(
                            color: Color.fromARGB(123, 236, 236, 236),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 4 * vw),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5 * vw),
                margin: EdgeInsets.only(
                  top: 7 * vw,
                  right: 3 * vw,
                  left: 3 * vw,
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(125, 41, 41, 41),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Номер телефона",
                              style: TextStyle(
                                  color: Color.fromARGB(123, 236, 236, 236),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                  fontSize: 4 * vw),
                            ),
                            Text(
                              "+7 (900) 000 - 00 - 00",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 236, 236, 236),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                  fontSize: 4 * vw),
                            ),
                          ],
                        ),
                        Opacity(
                          opacity: .7,
                          child: Image(
                            image: const AssetImage('assets/img/arrow.png'),
                            width: 4 * vw,
                            height: 4 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5 * vw,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Почта",
                              style: TextStyle(
                                  color: Color.fromARGB(123, 236, 236, 236),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                  fontSize: 4 * vw),
                            ),
                            Text(
                              "ivan@email.ru",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 236, 236, 236),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                  fontSize: 4 * vw),
                            ),
                          ],
                        ),
                        Opacity(
                          opacity: .7,
                          child: Image(
                            image: const AssetImage('assets/img/arrow.png'),
                            width: 4 * vw,
                            height: 4 * vw,
                            fit: BoxFit
                                .cover, // Обрезать изображение в соответствии с размерами контейнера
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(3*vw),
                padding: EdgeInsets.all(6*vw),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 24, 9),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image(
                      image: const AssetImage('assets/img/exit.png'),
                      width: 5 * vw,
                      height: 5 * vw,
                      fit: BoxFit
                          .cover, // Обрезать изображение в соответствии с размерами контейнера
                    ),
                    SizedBox(width: 1*vw,),
                    Text(
                              "Выйти",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 236, 236, 236),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                  fontSize: 4 * vw),
                            ),
                      ],
                    ),
                    Image(
                      image: const AssetImage('assets/img/arrow.png'),
                      width: 3.5 * vw,
                      height: 3.5 * vw,
                      fit: BoxFit
                          .cover, // Обрезать изображение в соответствии с размерами контейнера
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30 * vw,
              ),
              Navbar()
            ],
          ),
        ),
      ),
    );
  }
}
