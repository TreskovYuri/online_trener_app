import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trener_app/http/chatUtills.dart';
import 'package:trener_app/models/user.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';
import 'package:trener_app/widgets/circle_default_user_icon.dart';
import 'package:trener_app/widgets/circle_network_Img.dart';
import 'package:trener_app/widgets/text/description.dart';

class ChatUserCard extends StatelessWidget {
  ChatUserCard({super.key, required this.user});
  final chatUtills = ChatUtills();
  User user;

  @override
  Widget build(BuildContext context) {
    return MyCardButton(
        margingH: 10,
        callback: () => chatUtills.CreateChat(user),
        widget: Container(
          child: Row(
            children: [
              user.img.length > 0? 
                  MyCircleNetworkImg(width: 30, height: 30, url: user.img,radius: 100,): 
                  MyCircleDefaulUserIcon(name: user.name,radius: 100,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:MyDescriptionText(text: user.name != '' ? user.name : 'Не заполнено')
              )
            ],
          ),
        ));
  }
}
