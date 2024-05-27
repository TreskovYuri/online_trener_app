import 'package:get/get.dart';

// Контроллер для работы с пользователями

class MyPatternsController extends GetxController {
  // Упражнения
  var _exercisePatterns = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get exercisePatterns => _exercisePatterns;
  void setExercisePatterns(List<Map<String, dynamic>> newExercisePatterns) { _exercisePatterns.assignAll(newExercisePatterns);}



}