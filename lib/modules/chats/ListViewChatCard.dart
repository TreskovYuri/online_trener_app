import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/service/helpers/getApponent.dart';
import 'package:trener_app/service/helpers/getFirstSimvolOnString.dart';
import 'package:trener_app/service/voids/ToChat.dart';

class ListViewChatCard extends StatelessWidget {
  ListViewChatCard({
    super.key,
    required this.card,
    required this.vh,
    required this.vw
    });
   Map<String,dynamic> card;
    double vh;
    double vw;

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> users = card['users'];
    return  Container(
                          margin: const EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.transparent,
                                  foregroundColor:
                                      const Color.fromARGB(255, 8, 32, 42),
                                  surfaceTintColor: Colors.transparent,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2 * vh, horizontal: 10),
                                  backgroundColor: const Color(0xff23252B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Указываем радиус скругления углов
                                  ),
                                ),
                                onPressed: () =>ToChat(GetApponent(users)),
                                child: Container(
                                  child: _UserCard(
                                    card: card,
                                    users: users,
                                    vh: vh,
                                    vw: vw,
                                  ),
                                ),
                              ),
                            );
  }
}


class _UserCard extends StatefulWidget {
  _UserCard(
      {super.key, required this.card, required this.vw, required this.vh, required this.users});
  Map<String, dynamic> card;
  List<Map<String,dynamic>> users;
  double vw;
  double vh;

  @override
  State<_UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<_UserCard> {
  MyUserController myUserController = Get.put(MyUserController());

  @override
  Widget build(BuildContext context) {
    final Map user = myUserController.Users.firstWhere(
          (element) => element['id'] == widget.card['user2Id'], orElse: ()=>{});

    return   user != {} ?Container(padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GetApponent(widget.users)['img'] != '' && GetApponent(widget.users)['img'] != null
                  ? Container(
                      width: 30,
                      height: 30,
                      child: Image.network(
                        '${dotenv.env['STATIC_URL']}/${GetApponent(widget.users)['img']}',
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
                          getFirstSimvolOnString(GetApponent(widget.users)['name']??''),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 70 * widget.vw,
            child: Text(
              GetApponent(widget.users)['name'] != '' &&  GetApponent(widget.users)['name'] != null
                  ? GetApponent(widget.users)['name']
                  : 'Не заполнено',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    ):const SizedBox.shrink();
  }
}
