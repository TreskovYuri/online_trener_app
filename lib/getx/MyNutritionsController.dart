import 'package:get/get.dart';

// Контроллер для работы с пользователями

class MyNutritionsController extends GetxController {
  // Reactive list of exercises
  var _nutritions = <Map<String, dynamic>>[].obs;
  
  // Getter for exercises
  List<Map<String, dynamic>> get nutritions => _nutritions;
  
  // Setter for exercises
  void setNutritions(List<Map<String, dynamic>> newNutritions) {
    _nutritions.assignAll(newNutritions);
  }

  


}