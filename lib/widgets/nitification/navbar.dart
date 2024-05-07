import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/pages/profile.dart';


class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    final mobx = Provider.of<Mobx>(context);
    return Container(
      height: 12*vh,

      padding: EdgeInsets.symmetric(horizontal: 2*vw),
      decoration: BoxDecoration(
              color: Color(0xff1B1C20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Observer(
            builder: (context) {
              return Opacity(
                opacity: mobx.pageName == 'План'? 1 : .6,
                child: Column(
                  children: [IconButton(
                        onPressed: () async {
                          if(mobx.user['post'] == 'Супер тренер' || mobx.user['post'] == 'Тренер'){
                            Navigator.pushReplacementNamed(context,'/journal',);
                          }else{
                            Navigator.pushReplacementNamed(context,'/planner',);
                          }
                          mobx.setPageName('План');
                              
                        },
                        icon: Icon(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            size: 3 * vh,
                            Icons
                                .grading_sharp), // Иконка, которая будет отображаться на кнопке
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
              );
            }
          ),
          Row(
            children: [
              Observer(

                builder: (context) {
                  return Opacity(
                    opacity: mobx.pageName == 'Прогресс'? 1 : .6,
                    child: Column(
                      children: [
                        IconButton(
                          
                          onPressed: () {
                            mobx.setPageName('Прогресс');
                          },
                          icon: Icon(
                              color: Colors.white30,
                              size: 3 * vh,
                              Icons
                                  .add_task_sharp), // Иконка, которая будет отображаться на кнопке
                        ),
                          
                        Text(
                          "Прогресс",
                          style: TextStyle(
                              color: Colors.white54,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: 2.7 * vw),
                        ),
                      ],
                    ),
                  );
                }
              )
            ],
          ),
          Container(
            child: Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      child: Image(
                        image: const AssetImage('assets/img/nav_plus.png'),
                        width: 15 * vw,
                        height: 15 * vw,
                        fit: BoxFit
                            .cover, // Обрезать изображение в соответствии с размерами контейнера
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Observer(
            builder: (context) {
              return Opacity(
                opacity: mobx.pageName == 'Чат'? 1: .5,
                child: Container(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context,'/chats');
                          mobx.setPageName('Чат');
                        },
                        icon: Icon(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            size: 3 * vh,
                            Icons
                                .chat), // Иконка, которая будет отображаться на кнопке
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
              );
            }
          ),
          Row(
            children: [
              Observer(
                builder: (context) {
                  return Opacity(
                    opacity: mobx.pageName == 'Сервисы'?1:.6,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                              Navigator.pushReplacementNamed(context,'/service',);
                              mobx.setPageName('Сервисы');
                          },
                          icon: Icon(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 3 * vh,
                              Icons
                                  .medical_services_outlined), // Иконка, которая будет отображаться на кнопке
                        ),
                        Text(
                          "Сервисы",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: 2.7 * vw),
                        ),
                    
                      ],
                    ),
                  );
                }
              )
            ],
          ),
        ],
      ),
    );
  }
}
