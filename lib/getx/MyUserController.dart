
import 'package:get/get.dart';



// Контроллер для работы с пользователями

class MyUserController  extends GetxController{
  // Выбранная дата
  final _date = RxString('qwdqqwdqwdw');
  String get  date => _date.value;
  void setCurrentDate(String newDate) => _date.value = newDate;

}