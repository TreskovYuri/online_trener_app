import 'package:get/get.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/models/chat.dart';
import 'package:trener_app/models/user.dart';


// Функция принимает двух пользователей чата и возвращает аппонента
User GetApponent(List<User> users) {
  MyUserController myUserController = Get.put(MyUserController());
  return users.firstWhere((user) => user.id != myUserController.user['id'],orElse: () => {} as User,);
}