import 'package:get/get.dart';

// Контроллер для работы с пользователями

class MyExercisesController extends GetxController {
  // Упражнения
  var _exercises = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get exercises => _exercises;
  void setExercises(List<Map<String, dynamic>> newExercises) { _exercises.assignAll(newExercises);}

  //Группы упражнений
  var _groups = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get groups => _groups;
  void setGroups(List<Map<String, dynamic>> newGroups) {_groups.assignAll(newGroups);}

  // Выбранная стадия при созджании упражнения
  var currentStage = 'Разминка'.obs;
  void setCurrentStage(String newCG) {currentStage.value = newCG;}


  // Выбранная группа при созджании упражнения
  var currentGroup = 0.obs;
  void setCurrentGroup(int newCG) {currentGroup.value = newCG;}



}