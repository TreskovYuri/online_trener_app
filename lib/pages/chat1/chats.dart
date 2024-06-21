import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyChatController.dart';
import 'package:trener_app/http/chatUtills.dart';
import 'package:trener_app/modules/chats/ListViewChatCard.dart';
import 'package:trener_app/modules/chats/users.dart';
import 'package:trener_app/widgets/inputs/search.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final myChatController = Get.put(MyChatController());
  final searchController = TextEditingController ();
  final chatUtills = ChatUtills();

  @override
  void initState() {
    super.initState();
    chatUtills.getChats();
  }



  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    return SizedBox(
      height: 70*vh,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
                  children: [
                    SizedBox(height: 3*vh,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Чаты",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 236, 236, 236),
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
        
                          children: [
                            ...myChatController.chats.map((e) =>ListViewChatCard(card: e,vh: vh,vw: vw,)),
                                const SizedBox(height: 100,)
                          ],
                        )
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}

