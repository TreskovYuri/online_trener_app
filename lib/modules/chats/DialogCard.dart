import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/models/chat.dart';
import 'package:trener_app/models/user.dart';
import 'package:trener_app/modules/chats/ChatIcon.dart';
import 'package:trener_app/service/helpers/getApponent.dart';
import 'package:trener_app/service/helpers/getFirstSimvolOnString.dart';
import 'package:trener_app/service/helpers/getChatName.dart';
import 'package:trener_app/widgets/text/description.dart';

class DialogCard extends StatefulWidget {
  DialogCard({super.key, required this.chat, required this.users});
  Chat chat;
  List<User> users;

  @override
  State<DialogCard> createState() => _UserCardState();
}

class _UserCardState extends State<DialogCard> {
  MyUserController myUserController = Get.put(MyUserController());
  String chatName = '';
  User? apponent;
  var isGroup = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      chatName = GetCHatName(widget.chat);
      isGroup = widget.chat.users.length > 2;
    });

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          ChatIcon(chat: widget.chat),
          Expanded(child: Padding(padding: const EdgeInsets.all(8),child:  MyDescriptionText(text: chatName),))
        ],
      ),
    );
  }
}
