
import 'package:get/get.dart';



// Контроллер для работы с датами

class MyDateController  extends GetxController{
  // Выбранная дата
  final _date = RxString('qwdqqwdqwdw');
  String get  date => _date.value;
  void setCurrentDate(String newDate){
    try{ _date.value = newDate;}catch(e){
      print(e);
  };
  }

}