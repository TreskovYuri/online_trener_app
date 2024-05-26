
import 'package:get/get.dart';
import 'package:trener_app/getx/MyChatController.dart';
import 'package:trener_app/http/http.dart';


// Получить список групп
Future GetChats() async {
  MyChatController myChatController =
      Get.put(MyChatController());

  try {
    Map<String, dynamic> data = await Session().get('chat');
    // data['body'].forEach((e)=>print(e));
    List<Map<String, dynamic>> list = [];
    if (data['status'] < 300) {
      data['body'].forEach((e) {
        Map<String, dynamic> group = {
            'id': e['id'] ?? 0,
            'user1Id': e['user1Id'] ?? 0,
            'user2Id': e['user2Id'] ?? 0,
            'message':e['message']??{}
        };
        list.add(group);
      });
    }
    myChatController.setChats(list);
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}


// Получить список групп
Future GetChatId(userId) async {

  try {
    Map<String, dynamic> data = await Session().get('chat/userid/$userId');
    return data['body'];
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}




// Получить список групп
Future GetChatMessages({id}) async {
  MyChatController myChatController =
      Get.put(MyChatController());
  try {
    Map<String, dynamic> data = await Session().get('chat/$id');
    List<Map<String, dynamic>> list = [];
    if (data['status'] < 300) {
      data['body'].forEach((e) {
        Map<String, dynamic> messages = {
            'id': e['id'] ?? 0,
            'chatId': e['chatId'] ?? 0,
            'userId': e['userId'] ?? 0,
            'message':e['message']??{}
        };
        list.add(messages);
      });
    }
    myChatController.setMessages(list);
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}




// Получить список групп
Future SetMessageOnChatId({formData, chatId}) async {

  try {
    Map<String, dynamic> data = await Session().post('chat/$chatId',formData);
    if(data['status']<300){
      GetChatMessages(id: data['body']['chatId']);
    }
    return data['body'];
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}




// // Добавление группы
// Future AddExerciseGroup(Map <String,dynamic> formData) async {
//   print(formData);
//   try {
//     Map<String, dynamic> data = await Session().post('exercises/groups',formData);
//     GetExerciseGroups();
//     print(data);
//     return data;
//   } catch (e) {
//     print(e);
//   }
//   // Возвращаемое значение в случае неудачи
//   return null;
// }
