import 'package:get/get.dart';

// Контроллер для работы с пользователями

class MyChatController extends GetxController {


  // Список всех чатов пользователя
  var _chats = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get chats => _chats;
  void setChats(List<Map<String, dynamic>> newChats) {_chats.assignAll(newChats);}


  // Сообщения для выбранного чата 
  var _OneChat = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get OneChat => _OneChat;
  void setOneChat(List<Map<String, dynamic>> newOneChat) {_OneChat.assignAll(newOneChat);}
  void clearOneChat (){
    _OneChat.clear();
    _Messages.clear();
    _chats.clear();
    }

    // Список всех чатов пользователя
  var _Messages = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get Messages => _Messages;
  void setMessages(List<Map<String, dynamic>> newMessages) {_Messages.assignAll(newMessages);}



}