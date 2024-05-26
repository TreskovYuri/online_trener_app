import 'package:get/get.dart';

// Контроллер для работы с пользователями

class MyTestsController extends GetxController {



  var _tests = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get tests => _tests;
  void setTests(List<Map<String, dynamic>> newTests) {_tests.assignAll(newTests);}



  var _groups = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get groups => _groups;
  void setGroups(List<Map<String, dynamic>> newGroups) {
    _groups.assignAll(newGroups);
  }
  

  // Выбранная группа при созджании теста
  var currentGroup = 0.obs;
  void setCurrentGroup(int newCG) {
    currentGroup.value = newCG;
  }


  // Выбранная группа при созджании теста
  var currentType = ''.obs;
  void setCurrentType(String newCG) {
    currentType.value = newCG;
  }
  


}