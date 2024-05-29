import 'package:get/get.dart';

// Контроллер для работы с пользователями

class MyExercisesController extends GetxController {
  // Упражнения
  var _exercises = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get exercises => _exercises;
  void setExercises(List<Map<String, dynamic>> newExercises) { _exercises.assignAll(newExercises);}

  // Шаблоны
  var _exercisePattern = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get exercisePattern => _exercisePattern;
  void setExercisePattern(List<Map<String, dynamic>> newExercisePattern) { _exercisePattern.assignAll(newExercisePattern);}

  // связи упражнений с выбранным шаблоном
  var _exercisesBelongPattern = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get exercisesBelongPattern => _exercisesBelongPattern;
  void setExercisesBelongPattern(List<Map<String, dynamic>> newExercisesBelongPattern) { _exercisesBelongPattern.assignAll(newExercisesBelongPattern);}

  // связи упражнений с совсеми шаблонами тренировок
  var _exercisesAllBelongPattern = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get exercisesAllBelongPattern => _exercisesAllBelongPattern;
  void setExercisesAllBelongPattern(List<Map<String, dynamic>> newExercisesAllBelongPattern) { _exercisesAllBelongPattern.assignAll(newExercisesAllBelongPattern);}

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