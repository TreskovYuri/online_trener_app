import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyChatController.dart';
import 'package:trener_app/http/chatUtills.dart';
import 'package:trener_app/modules/chats/ListViewChatCard.dart';
import 'package:trener_app/modules/chats/users.dart';
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
  final chatUtills = ChatUtills();
  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    chatUtills.getChats();
    
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
            padding: EdgeInsets.symmetric(horizontal: 2 * vw),
            decoration: const BoxDecoration(
              color: Color(0xFF1B1C20),
            ),
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
                      
                      controller: _scrollController,
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
          _isAtTop ? const Navbar() : const NavbarScroll(),
        ],
      )),
    );
  }
}

