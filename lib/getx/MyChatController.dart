import 'package:get/get.dart';
import 'package:trener_app/models/chat.dart';
import 'package:trener_app/models/message.dart';

// Контроллер для работы с пользователями

class MyChatController extends GetxController {


  // Список всех чатов пользователя
  var _chats = <Chat>[].obs;
  List<Chat> get chats => _chats;
  void setChats(List<Chat> newChats) {_chats.assignAll(newChats);}


  // Сообщения для выбранного чата 
  var _Messages = <Message>[].obs;
  List<Message> get Messages => _Messages;
  void setMessages(List<Message> newMessages) {_Messages.assignAll(newMessages);}
  void clearMessages (){_Messages.clear();}




}