import 'package:get/get.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/models/chat.dart';
import 'package:trener_app/models/user.dart';

String GetCHatName (Chat chat){
  final myUserController = Get.put(MyUserController());
  if(chat.users.length>2){
    return chat.chat.name;
  }else{
    User apponent = chat.users.firstWhere((element) => element.id != myUserController.user['id']);
    return apponent.name;
  }
}