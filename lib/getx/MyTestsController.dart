import 'package:get/get.dart';

// Контроллер для работы с пользователями

class MyTestsController extends GetxController {
  // Reactive list of exercises
  var _tests = <Map<String, dynamic>>[].obs;
  
  // Getter for exercises
  List<Map<String, dynamic>> get tests => _tests;
  
  // Setter for exercises
  void setTests(List<Map<String, dynamic>> newTests) {
    _tests.assignAll(newTests);
  }



  // Reactive list of exercises
  var _groups = <Map<String, dynamic>>[].obs;
  
  // Getter for exercises
  List<Map<String, dynamic>> get groups => _groups;
  
  // Setter for exercises
  void setGroups(List<Map<String, dynamic>> newGroups) {
    _groups.assignAll(newGroups);
  }
  


}