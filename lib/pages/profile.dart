import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/widgets/nitification/navbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final mobx = Provider.of<Mobx>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 15 * vw, bottom: 5 * vw),
        color: const Color(0xff1B1C20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: mobx.user['img'].isNotEmpty? Image.network(
                'http://91.222.236.65:5004/assets/${mobx.user['img']}',
                width: 35 * vw,
                height: 35 * vw,
                fit: BoxFit
                    .cover, // Обрезать изображение в соответствии с размерами контейнера
              ):Image(
                image: const AssetImage('assets/img/avatar.png'),
                width: 35 * vw,
                height: 35 * vw,
                fit: BoxFit
                    .cover, // Обрезать изображение в соответствии с размерами контейнера
              )
            ),
            Expanded(
              flex: 1,
              child: Observer(
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(top: 5 * vw),
                    child: Text(
                      mobx.user['name'],
                      style: TextStyle(
                          color: Color.fromARGB(223, 236, 236, 236),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          fontSize: 5 * vw),
                    ),
                  );
                }
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 1 * vw),
                child: Text(
                  mobx.user['date'],
                  style: TextStyle(
                      color: Color.fromARGB(123, 236, 236, 236),
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
                          color: Color.fromARGB(255, 41, 41, 41)),
                      child: Text(
                        mobx.user['post'],
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
                        mobx.user['team'],
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
                                mobx.user['number'],
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
                                mobx.user['email'],
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
                  margin: EdgeInsets.all(3 * vw),
                  padding: EdgeInsets.all(6 * vw),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 24, 9),
                      borderRadius: BorderRadius.circular(10)),
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
                          SizedBox(
                            width: 1 * vw,
                          ),
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
              ],
            )),
          ],
        ),
      ),
bottomNavigationBar:  Navbar(),
    );
  }
}
