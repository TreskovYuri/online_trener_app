import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trener_app/widgets/nitification/navbar.dart';

class WorkoutShemeOnDay extends StatelessWidget {
  const WorkoutShemeOnDay({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    return Container(
      padding: EdgeInsets.only( right: 5*vw, left: 5*vw, bottom: 5*vw),
      child: Column(
        children: [Padding(
          padding: EdgeInsets.only(top: 10*vw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "1 день",
                    style: TextStyle(
                        color: Color.fromARGB(202, 255, 255, 255),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 5 * vw),
                  ),
                  SizedBox(width:20),
                   Opacity(
                    opacity: .6,
                     child: Image(
                                   image: AssetImage('assets/img/arrow.png'),
                                   height: 3*vw,
                                   fit: BoxFit
                        .cover, // Обрезать изображение в соответствии с размерами контейнера
                                 ),
                   ),
                ],
              ),
             Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
          colors: [
            Color(0xFF4D8AEE),
            Color(0xFF2932FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.circular(20.0), // Скругление углов
            ),
            padding: EdgeInsets.only(
              top: 0.3 * vw,
              bottom: 0.3 * vw,
              left: 6 * vw,
              right: 6 * vw,
            ),
            child: Text(
              "3",
              style: TextStyle(
          color: Color.fromARGB(202, 255, 255, 255),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
          fontSize: 4 * vw,
              ),
            ),
          ),
          
            ],
          ),
        ),
        SizedBox(height: 10*vw,),
        Container(
          padding: EdgeInsets.all(5*vw),
          decoration: BoxDecoration(
            color: Color.fromARGB(78, 48, 48, 48),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Силовая тренировка",
                  style: TextStyle(
                      color: Color.fromARGB(202, 255, 255, 255),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 4 * vw),
                ),
                Image(
                                 image: AssetImage('assets/img/arrow.png'),
                                 height: 3*vw,
                                 fit: BoxFit
                      .cover, // Обрезать изображение в соответствии с размерами контейнера
                               ),
            ],
          ),
        ),
        SizedBox(height: 5*vw,),
        Container(
          padding: EdgeInsets.all(5*vw),
          decoration: BoxDecoration(
            color: Color.fromARGB(78, 48, 48, 48),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Йога",
                  style: TextStyle(
                      color: Color.fromARGB(202, 255, 255, 255),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 4 * vw),
                ),
                Image(
                                 image: AssetImage('assets/img/arrow.png'),
                                 height: 3*vw,
                                 fit: BoxFit
                      .cover, // Обрезать изображение в соответствии с размерами контейнера
                               ),
            ],
          ),
        ),
        SizedBox(height: 5*vw,),
        Container(
          
          padding: EdgeInsets.all(5*vw),
          decoration: BoxDecoration(
            color: Color.fromARGB(78, 48, 48, 48),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                    "Максимальный вес приседания с штангой на спине",
                    style: TextStyle(
                        color: Color.fromARGB(202, 255, 255, 255),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        fontSize: 4 * vw),
                        
                  ),
              ),
                Image(
                                 image: AssetImage('assets/img/arrow.png'),
                                 height: 3*vw,
                                 fit: BoxFit
                      .cover, // Обрезать изображение в соответствии с размерами контейнера
                               ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10*vw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "2 день",
                    style: TextStyle(
                        color: Color.fromARGB(202, 255, 255, 255),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 5 * vw),
                  ),
                  SizedBox(width:20),
                   Opacity(
                    opacity: .6,
                     child: Image(
                                   image: AssetImage('assets/img/arrow.png'),
                                   height: 3*vw,
                                   fit: BoxFit
                        .cover, // Обрезать изображение в соответствии с размерами контейнера
                                 ),
                   ),
                ],
              ),
             Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
          colors: [
            Color(0xFF4D8AEE),
            Color(0xFF2932FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.circular(20.0), // Скругление углов
            ),
            padding: EdgeInsets.only(
              top: 0.3 * vw,
              bottom: 0.3 * vw,
              left: 6 * vw,
              right: 6 * vw,
            ),
            child: Text(
              "2",
              style: TextStyle(
          color: Color.fromARGB(202, 255, 255, 255),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
          fontSize: 4 * vw,
              ),
            ),
          ),
          
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10*vw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "3 день",
                    style: TextStyle(
                        color: Color.fromARGB(202, 255, 255, 255),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 5 * vw),
                  ),
                  SizedBox(width:20),
                   Opacity(
                    opacity: .6,
                     child: Image(
                                   image: AssetImage('assets/img/arrow.png'),
                                   height: 3*vw,
                                   fit: BoxFit
                        .cover, // Обрезать изображение в соответствии с размерами контейнера
                                 ),
                   ),
                ],
              ),
             Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
          colors: [
            Color(0xFF4D8AEE),
            Color(0xFF2932FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.circular(20.0), // Скругление углов
            ),
            padding: EdgeInsets.only(
              top: 0.3 * vw,
              bottom: 0.3 * vw,
              left: 6 * vw,
              right: 6 * vw,
            ),
            child: Text(
              "5",
              style: TextStyle(
          color: Color.fromARGB(202, 255, 255, 255),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
          fontSize: 4 * vw,
              ),
            ),
          ),
          
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10*vw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "4 день",
                    style: TextStyle(
                        color: Color.fromARGB(202, 255, 255, 255),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 5 * vw),
                  ),
                  SizedBox(width:20),
                   Opacity(
                    opacity: .6,
                     child: Image(
                                   image: AssetImage('assets/img/arrow.png'),
                                   height: 3*vw,
                                   fit: BoxFit
                        .cover, // Обрезать изображение в соответствии с размерами контейнера
                                 ),
                   ),
                ],
              ),
             Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
          colors: [
            Color(0xFF4D8AEE),
            Color(0xFF2932FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.circular(20.0), // Скругление углов
            ),
            padding: EdgeInsets.only(
              top: 0.3 * vw,
              bottom: 0.3 * vw,
              left: 6 * vw,
              right: 6 * vw,
            ),
            child: Text(
              "6",
              style: TextStyle(
          color: Color.fromARGB(202, 255, 255, 255),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
          fontSize: 4 * vw,
              ),
            ),
          ),
          
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10*vw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "5 день",
                    style: TextStyle(
                        color: Color.fromARGB(202, 255, 255, 255),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 5 * vw),
                  ),
                  SizedBox(width:20),
                   Opacity(
                    opacity: .6,
                     child: Image(
                                   image: AssetImage('assets/img/arrow.png'),
                                   height: 3*vw,
                                   fit: BoxFit
                        .cover, // Обрезать изображение в соответствии с размерами контейнера
                                 ),
                   ),
                ],
              ),
             Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
          colors: [
            Color(0xFF4D8AEE),
            Color(0xFF2932FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.circular(20.0), // Скругление углов
            ),
            padding: EdgeInsets.only(
              top: 0.3 * vw,
              bottom: 0.3 * vw,
              left: 6 * vw,
              right: 6 * vw,
            ),
            child: Text(
              "2",
              style: TextStyle(
          color: Color.fromARGB(202, 255, 255, 255),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
          fontSize: 4 * vw,
              ),
            ),
          ),
          
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10*vw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "6 день",
                    style: TextStyle(
                        color: Color.fromARGB(202, 255, 255, 255),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 5 * vw),
                  ),
                  SizedBox(width:20),
                   Opacity(
                    opacity: .6,
                     child: Image(
                                   image: AssetImage('assets/img/arrow.png'),
                                   height: 3*vw,
                                   fit: BoxFit
                        .cover, // Обрезать изображение в соответствии с размерами контейнера
                                 ),
                   ),
                ],
              ),
             Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
          colors: [
            Color(0xFF4D8AEE),
            Color(0xFF2932FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.circular(20.0), // Скругление углов
            ),
            padding: EdgeInsets.only(
              top: 0.3 * vw,
              bottom: 0.3 * vw,
              left: 6 * vw,
              right: 6 * vw,
            ),
            child: Text(
              "1",
              style: TextStyle(
          color: Color.fromARGB(202, 255, 255, 255),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
          fontSize: 4 * vw,
              ),
            ),
          ),
          
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10*vw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "7 день",
                    style: TextStyle(
                        color: Color.fromARGB(202, 255, 255, 255),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 5 * vw),
                  ),
                  SizedBox(width:20),
                   Opacity(
                    opacity: .6,
                     child: Image(
                                   image: AssetImage('assets/img/arrow.png'),
                                   height: 3*vw,
                                   fit: BoxFit
                        .cover, // Обрезать изображение в соответствии с размерами контейнера
                                 ),
                   ),
                ],
              ),
             Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
          colors: [
            Color(0xFF4D8AEE),
            Color(0xFF2932FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.circular(20.0), // Скругление углов
            ),
            padding: EdgeInsets.only(
              top: 0.3 * vw,
              bottom: 0.3 * vw,
              left: 6 * vw,
              right: 6 * vw,
            ),
            child: Text(
              "3",
              style: TextStyle(
          color: Color.fromARGB(202, 255, 255, 255),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
          fontSize: 4 * vw,
              ),
            ),
          ),
          
            ],
          ),
        ),
        SizedBox(height: 20*vw,),
        Navbar()
      ]),
    );
  }
}
