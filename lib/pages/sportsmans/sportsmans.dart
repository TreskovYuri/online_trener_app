
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/http/userUtills.dart';
import 'package:trener_app/widgets/inputs/input_inline_fill.dart';

class Sportsmans extends StatefulWidget {
  const Sportsmans({super.key});

  @override
  State<Sportsmans> createState() => _SportsmansState();
}

class _SportsmansState extends State<Sportsmans> {
  final myUserController = Get.put(MyUserController());
  final searchController = TextEditingController();

  @override
  void initState() {
   GetSportsmans();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;

    return  Obx(() {
      final users = myUserController.sportsmans;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
                  children: [
                    MyInlineFillInput(controller: searchController,hintText: 'Найти...',),
                    ...users.map(
                      (e) => Padding(
                        padding: EdgeInsets.all(3 * vw),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            surfaceTintColor: Colors.transparent,
                            foregroundColor: const Color.fromARGB(255, 0, 71, 115),
                            backgroundColor:
                                const Color(0xff23252B), // Чтобы сделать фон прозрачным
                            // shadowColor: Color(0xff23252B),
                          ).copyWith(
                            // Радиальный градиент
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/profile_one_user',
                                arguments: e);
                          },
                          child: Container(
                            margin: EdgeInsets.all(3 * vw),
                            padding: EdgeInsets.all(3 * vw),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3 * vw)),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 15 * vw,
                                      height: 15 * vw,
                                      child: ClipOval(
                                        child: e['img'] != '' && e['img'] != null
                                            ? Image.network(
                                                'https://mobilecoach.ru:5004/assets/${e['img']}',
                                                width: 15 * vw,
                                                height: 15 * vw,
                                                fit: BoxFit
                                                    .cover, // Ensures the image covers the circular area
                                              )
                                            : Image.asset(
                                                'assets/img/user1.png',
                                                width: 15 * vw,
                                                height: 15 * vw,
                                                fit: BoxFit
                                                    .cover, // Ensures the image covers the circular area
                                              ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3 * vw,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 50 * vw,
                                            child: Text(
                                              e['name'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 4 * vw,
                                                  fontFamily: 'Manrope'),
                                            )),
                                        SizedBox(
                                          height: 1 * vh,
                                        ),
                                        Text("${e['date']}г",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    129, 255, 255, 255),
                                                fontSize: 3 * vw,
                                                fontFamily: 'Manrope'))
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2 * vh,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3 * vw, vertical: .5 * vh),
                                      decoration: BoxDecoration(
                                          color: Color(0xffEBEEF),
                                          borderRadius:
                                              BorderRadius.circular(10 * vw)),
                                      child: Text(e['post'],
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  184, 255, 255, 255),
                                              fontSize: 3 * vw,
                                              fontFamily: 'Manrope')),
                                    ),
                                    SizedBox(
                                      width: 2 * vw,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3 * vw, vertical: .5 * vh),
                                      decoration: BoxDecoration(
                                          color: Color(0xffEBEEF),
                                          borderRadius:
                                              BorderRadius.circular(10 * vw)),
                                      child: Text(e['team'],
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  184, 255, 255, 255),
                                              fontSize: 3 * vw,
                                              fontFamily: 'Manrope')),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12 * vh,
                    )
                  ],
                ),
      );
    },
            );
  }
}
