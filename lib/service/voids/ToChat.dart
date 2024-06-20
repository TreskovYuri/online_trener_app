
import 'package:get/get.dart';
import 'package:trener_app/http/chatUtills.dart';
import 'package:trener_app/pages/chat/oneChat.dart';

// Функция для прехода в чат по переданному id
void ToChat(id)async{
    Map chat = await GetChatId(id);
    if(chat['id'] !=null){
      Get.to(const OneChat(),arguments: chat);
    }
  }