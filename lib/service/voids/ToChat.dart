
import 'package:get/get.dart';
import 'package:trener_app/models/chat.dart';
import 'package:trener_app/pages/chat/oneChat.dart';

// Функция для прехода в чат по переданному id
void ToChat(Chat chat)async{
      Get.to(const OneChat(),arguments: chat);
  }