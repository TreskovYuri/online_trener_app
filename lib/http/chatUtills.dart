import 'dart:convert';

import 'package:get/get.dart';
import 'package:trener_app/getx/MyChatController.dart';
import 'package:trener_app/http/GETHandler.dart';
import 'package:trener_app/http/POSTHandler.dart';
import 'package:trener_app/models/chat.dart';
import 'package:trener_app/models/message.dart';
import 'package:trener_app/models/user.dart';

class ChatUtills {
  final MyChatController myChatController = Get.put(MyChatController());

  // Получить список чатов
  Future<void> getChats() async {
    await fetchData<Chat>(
      url: 'chat',
      fromJson: (json) => Chat.fromJson(json),
      setData: (chats) => myChatController.setChats(chats),
    );
  }

  // Получить сообщения по chatId
  Future<void> getChatById(int chatId) async {
    await fetchData<Message>(
      url: 'chat/$chatId',
      fromJson: (json) => Message.fromJson(json),
      setData: (messages) => myChatController.setMessages(messages),
    );
  }


  Future<void> CreateChat (User user) async {

    final formData = {
      'name':'',
      'users':jsonEncode([user])
    };
    await setData(url: 'chat', getData: ()=>this.getChats() , formData: formData);
    Get.back();
}
}
