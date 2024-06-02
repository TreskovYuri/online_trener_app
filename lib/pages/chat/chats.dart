import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyChatController.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/http/chatUtills.dart';
import 'package:trener_app/http/userUtills.dart';
import 'package:trener_app/pages/chat/oneChat.dart';
import 'package:trener_app/widgets/chats/users.dart';
import 'package:trener_app/widgets/inputs/search.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  ScrollController _scrollController = ScrollController();
  MyChatController myChatController = Get.put(MyChatController());
  TextEditingController searchController = TextEditingController();
  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    GetChats();
    GetUsers();
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

    void toChat (id)async{
    Map chat = await GetChatId(id);
    if(chat['id'] !=null){
      Get.to(const OneChat(),arguments: chat);
    }
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
          Positioned(
            top: 200,
            right: 0,
            left: 0,
            child: Container(
              height: 60 * vh,
              width: double.infinity,
              child: Obx(
                () => ListView.builder(
                  itemCount: myChatController.chats.length,
                  itemBuilder: (context, index) => ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        child: Text(
                            myChatController.chats[index]['id'].toString()),
                      )),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5 * vw),
            decoration: const BoxDecoration(
              color: Color(0xFF1B1C20),
            ),
            child: Column(
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
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => const ChatUsers(),
                            isScrollControlled: true,
                          );
                        },
                        icon: SvgPicture.asset(
                          'assets/img/add_chat.svg',
                          width: 30,
                        ))
                  ],
                ),
                SizedBox(
                  height: 2 * vh,
                ),
                Padding(
                  padding: EdgeInsets.all(0 * vw),
                  child: MySearchInput(controller: searchController)
                ),
                SizedBox(
                  height: 5 * vh,
                ),
                Expanded(
                  child: Obx(
                    () => ListView(
                      controller: _scrollController,
                      children: [
                        ...myChatController.chats.map((e) => Container(
                          margin: EdgeInsets.only(top: 10),
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
                                onPressed: () =>toChat(apponent(e)['id']),
                                child: Container(
                                  child: _UserCard(
                                    card: e,
                                    vh: vh,
                                    vw: vw,
                                  ),
                                ),
                              ),
                            ),),
                            SizedBox(height: 100,)
                      ],
                    )
                  ),
                ),
                // Column(
                //   children: [
                //     Container(
                //       alignment: Alignment.centerLeft,
                //       margin: EdgeInsets.only(top: 10 * vw),
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Image(
                //             image: const AssetImage('assets/img/user1.png'),
                //             width: 12 * vw,
                //             height: 12 * vw,
                //             fit: BoxFit
                //                 .cover, // Обрезать изображение в соответствии с размерами контейнера
                //           ),
                //           SizedBox(
                //             width: 5 * vw,
                //           ),
                //           Container(
                //             width: 60 * vw,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Text(
                //                   "Михаил Вирановский",
                //                   style: TextStyle(
                //                       color: Color.fromARGB(255, 236, 236, 236),
                //                       fontFamily: 'Manrope',
                //                       fontWeight: FontWeight.w600,
                //                       decoration: TextDecoration.none,
                //                       fontSize: 4 * vw),
                //                 ),
                //                 Text(
                //                   "Молодец",
                //                   style: TextStyle(
                //                       color: Color.fromARGB(131, 236, 236, 236),
                //                       fontFamily: 'Manrope',
                //                       fontWeight: FontWeight.w400,
                //                       decoration: TextDecoration.none,
                //                       fontSize: 4 * vw),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Column(
                //             children: [
                //               Text(
                //                 "10:00",
                //                 style: TextStyle(
                //                     color: Color.fromARGB(131, 236, 236, 236),
                //                     fontFamily: 'Manrope',
                //                     fontWeight: FontWeight.w400,
                //                     decoration: TextDecoration.none,
                //                     fontSize: 4 * vw),
                //               ),
                //               SizedBox(height: 2 * vw),
                //               Container(
                //                 width: 7 * vw,
                //                 height: 7 * vw,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(50),
                //                   gradient: LinearGradient(
                //                     colors: [
                //                       Color(0xFF4D8AEE),
                //                       Color(0xFF2932FF),
                //                     ],
                //                   ),
                //                 ),
                //                 child: Center(
                //                   child: Text(
                //                     "2",
                //                     style: TextStyle(
                //                         color:
                //                             Color.fromARGB(131, 236, 236, 236),
                //                         fontFamily: 'Manrope',
                //                         fontWeight: FontWeight.w800,
                //                         decoration: TextDecoration.none,
                //                         fontSize: 4 * vw),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //     Container(
                //       alignment: Alignment.centerLeft,
                //       margin: EdgeInsets.only(top: 10 * vw),
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Image(
                //             image: const AssetImage('assets/img/user2.png'),
                //             width: 12 * vw,
                //             height: 12 * vw,
                //             fit: BoxFit
                //                 .cover, // Обрезать изображение в соответствии с размерами контейнера
                //           ),
                //           SizedBox(
                //             width: 5 * vw,
                //           ),
                //           Container(
                //             width: 65 * vw,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Text(
                //                   "Лев Кобяков",
                //                   style: TextStyle(
                //                       color: Color.fromARGB(255, 236, 236, 236),
                //                       fontFamily: 'Manrope',
                //                       fontWeight: FontWeight.w600,
                //                       decoration: TextDecoration.none,
                //                       fontSize: 4 * vw),
                //                 ),
                //                 Text(
                //                   "Сегодня тренировки не будет. Переносим на первые числа апреля. О датах сообщу позже",
                //                   style: TextStyle(
                //                       color: Color.fromARGB(131, 236, 236, 236),
                //                       fontFamily: 'Manrope',
                //                       fontWeight: FontWeight.w400,
                //                       decoration: TextDecoration.none,
                //                       fontSize: 4 * vw),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Column(
                //             children: [
                //               Text(
                //                 "ВС",
                //                 style: TextStyle(
                //                     color: Color.fromARGB(131, 236, 236, 236),
                //                     fontFamily: 'Manrope',
                //                     fontWeight: FontWeight.w400,
                //                     decoration: TextDecoration.none,
                //                     fontSize: 4 * vw),
                //               ),
                //               SizedBox(height: 2 * vw),
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //     Container(
                //       alignment: Alignment.centerLeft,
                //       margin: EdgeInsets.only(top: 10 * vw),
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Image(
                //             image: const AssetImage('assets/img/user3.png'),
                //             width: 12 * vw,
                //             height: 12 * vw,
                //             fit: BoxFit
                //                 .cover, // Обрезать изображение в соответствии с размерами контейнера
                //           ),
                //           SizedBox(
                //             width: 5 * vw,
                //           ),
                //           Container(
                //             width: 65 * vw,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Text(
                //                   "Филипп Лачков",
                //                   style: TextStyle(
                //                       color: Color.fromARGB(255, 236, 236, 236),
                //                       fontFamily: 'Manrope',
                //                       fontWeight: FontWeight.w600,
                //                       decoration: TextDecoration.none,
                //                       fontSize: 4 * vw),
                //                 ),
                //                 Text(
                //                   "Спасибо!",
                //                   style: TextStyle(
                //                       color: Color.fromARGB(131, 236, 236, 236),
                //                       fontFamily: 'Manrope',
                //                       fontWeight: FontWeight.w400,
                //                       decoration: TextDecoration.none,
                //                       fontSize: 4 * vw),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Column(
                //             children: [
                //               Text(
                //                 "ВТ",
                //                 style: TextStyle(
                //                     color: Color.fromARGB(131, 236, 236, 236),
                //                     fontFamily: 'Manrope',
                //                     fontWeight: FontWeight.w400,
                //                     decoration: TextDecoration.none,
                //                     fontSize: 4 * vw),
                //               ),
                //               SizedBox(height: 2 * vw),
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //     Container(
                //       alignment: Alignment.centerLeft,
                //       margin: EdgeInsets.only(top: 10 * vw),
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Image(
                //             image: const AssetImage('assets/img/user4.png'),
                //             width: 12 * vw,
                //             height: 12 * vw,
                //             fit: BoxFit
                //                 .cover, // Обрезать изображение в соответствии с размерами контейнера
                //           ),
                //           SizedBox(
                //             width: 5 * vw,
                //           ),
                //           Container(
                //             width: 60 * vw,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Text(
                //                   "Валерий Елизаров",
                //                   style: TextStyle(
                //                       color: Color.fromARGB(255, 236, 236, 236),
                //                       fontFamily: 'Manrope',
                //                       fontWeight: FontWeight.w600,
                //                       decoration: TextDecoration.none,
                //                       fontSize: 4 * vw),
                //                 ),
                //                 Text(
                //                   "Да, супер!",
                //                   style: TextStyle(
                //                       color: Color.fromARGB(131, 236, 236, 236),
                //                       fontFamily: 'Manrope',
                //                       fontWeight: FontWeight.w400,
                //                       decoration: TextDecoration.none,
                //                       fontSize: 4 * vw),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Column(
                //             children: [
                //               Text(
                //                 "ВТ",
                //                 style: TextStyle(
                //                     color: Color.fromARGB(131, 236, 236, 236),
                //                     fontFamily: 'Manrope',
                //                     fontWeight: FontWeight.w400,
                //                     decoration: TextDecoration.none,
                //                     fontSize: 4 * vw),
                //               ),
                //               SizedBox(height: 2 * vw),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          _isAtTop ? Navbar() : NavbarScroll(),
        ],
      )),
    );
  }
}

class _UserCard extends StatefulWidget {
  _UserCard(
      {super.key, required this.card, required this.vw, required this.vh});
  Map<String, dynamic> card;
  double vw;
  double vh;

  @override
  State<_UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<_UserCard> {
  MyUserController myUserController = Get.put(MyUserController());

  @override
  Widget build(BuildContext context) {
    if (myUserController.Users.length > 0) {
      final Map user = myUserController.Users.firstWhere(
          (element) => element['id'] == widget.card['user2Id']);
    }

    return Container(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: apponent(widget.card)['img'] != ''
                  ? Container(
                      width: 30,
                      height: 30,
                      child: Image.network(
                        '${dotenv.env['STATIC_URL']}/${apponent(widget.card)['img']}',
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(17, 255, 255, 255)),
                      child: Center(
                        child: Text(
                          getFirstCharacter(apponent(widget.card)['name']),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 70 * widget.vw,
            child: Text(
              apponent(widget.card)['name'] != ''
                  ? apponent(widget.card)['name']
                  : 'Не заполнено',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}

Map<String, dynamic> apponent(Map<String, dynamic> chat) {
  MyUserController myUserController = Get.put(MyUserController());
  if (myUserController.Users.length > 0) {
    if (chat['user1Id'] == myUserController.user['id']) {
      Map<String, dynamic> user = myUserController.Users.firstWhere(
          (element) => element['id'] == chat['user2Id']);
      return user;
    } else {
      Map<String, dynamic> user = myUserController.Users.firstWhere(
          (element) => element['id'] == chat['user1Id']);
      return user;
    }
  } else {
    return {"name": '', 'img': ''};
  }
}

String getFirstCharacter(String input) {
  if (input.isNotEmpty) {
    return input[0];
  } else {
    return '?'; // Возвращает пустую строку, если входная строка пуста или null
  }
}
