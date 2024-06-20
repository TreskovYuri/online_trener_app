import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/http/chatUtills.dart';
import 'package:trener_app/http/userUtills.dart';
import 'package:trener_app/pages/chat/oneChat.dart';

class ChatUsers extends StatefulWidget {
  const ChatUsers({super.key});

  @override
  State<ChatUsers> createState() => _ChatUsersState();
}

class _ChatUsersState extends State<ChatUsers> {
  MyUserController myUserController = Get.put(MyUserController());
  @override
  void initState() {
    GetUsers();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height / 100;
    final vw = MediaQuery.of(context).size.width / 100;
    return Container(
      height: 80 * vh,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff1B1C20),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Stack(
        children: [
          Column(
            children: [
              const _Header(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  cursorColor: const Color.fromARGB(255, 112, 112, 112),
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  decoration: InputDecoration(
                    hintText: 'Найти...',
                    filled: true, // Set to true to fill the background
                    fillColor: const Color(0xff23252B), // Set background color
                    hintStyle: const TextStyle(
                        color: Colors.grey), // Customize hint text color
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none, // Remove border
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none, // Remove border
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(

                    child: Obx(
                      () => ListView.builder(
                          itemCount: myUserController.Users.length,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      foregroundColor:
                                          Color.fromARGB(255, 8, 32, 42),
                                      surfaceTintColor: Colors.transparent,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2 * vh, horizontal: 10),
                                      backgroundColor: const Color(0xff23252B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // Указываем радиус скругления углов
                                      ),
                                    ),
                                    onPressed: ()=>{},
                                    child: Container(
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: myUserController.Users[index]
                                                        ['img'] !=
                                                    ''
                                                ? Container(
                                                    width: 30,
                                                    height: 30,
                                                    child: Image.network(
                                                      '${dotenv.env['STATIC_URL']}/${myUserController.Users[index]['img']}',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                : Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: const BoxDecoration(
                                                    color: Color.fromARGB(17, 255, 255, 255)
                                                  ),
                                                  child: Center(child: Text(getFirstCharacter(myUserController.Users[index]['name'])
                                                    ,
                                                    style: const TextStyle(color: Colors.white),
                                                    ),
                                                    
                                                    ),
                                                )
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            width: 70*vw,
                                            child: Text(myUserController.Users[index]
                                                        ['name'] !=
                                                    ''
                                                ? myUserController.Users[index]
                                                    ['name']
                                                : 'Не заполнено',style: const TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                                          )
                                        ],
                                      ),
                                    )),
                              )),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}


String getFirstCharacter(String input) {
  if (input.isNotEmpty) {
    return input[0];
  } else {
    return '?'; // Возвращает пустую строку, если входная строка пуста или null
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 400),
          child: Container(
            margin: EdgeInsets.only(top: 10),
            width: 150,
            height: 4,
            decoration: BoxDecoration(
                color: const Color.fromARGB(59, 255, 255, 255),
                borderRadius: BorderRadius.circular(200)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Пользователи',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 25),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: const Text(
                        'Закрыть',
                        style: TextStyle(
                          color: Color(0xff4D8AEE),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Manrope',
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
