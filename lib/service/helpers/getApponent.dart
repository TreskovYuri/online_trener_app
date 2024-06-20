import 'package:get/get.dart';
import 'package:trener_app/getx/MyUserConroller.dart';


// Функция принимает двух пользователей чата и возвращает аппонента
Map<String, dynamic> GetApponent(List<Map<String, dynamic>> users) {
  MyUserController myUserController = Get.put(MyUserController());
  return users.firstWhere((user) => user['id'] != myUserController.user['id'],orElse: () => {},);
}