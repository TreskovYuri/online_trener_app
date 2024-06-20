import 'package:flutter/widgets.dart';
import 'package:trener_app/models/chat.dart';
import 'package:trener_app/models/user.dart';
import 'package:trener_app/service/helpers/getApponent.dart';
import 'package:trener_app/widgets/circle_default_user_icon.dart';
import 'package:trener_app/widgets/circle_network_Img.dart';

class ChatIcon extends StatelessWidget {
  ChatIcon({
    super.key,
    required this.chat
    });

  Chat chat;
  @override
  Widget build(BuildContext context) {
    if(chat.users.length>2){
      return MyCircleDefaulUserIcon(name: chat.chat.name,radius: 100,);
    }else{
      User apponent = GetApponent(chat.users);
      return apponent.img != ''? 
      MyCircleNetworkImg(width: 40, height: 40, url: apponent.img,radius: 100,):
      MyCircleDefaulUserIcon(name: apponent.name,radius: 100,);
    }

  }
}