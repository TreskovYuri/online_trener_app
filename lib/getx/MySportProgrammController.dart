
import 'package:get/get.dart';



// Контроллер для работы с пользователями

class MySportProgrammController extends GetxController{
  // Выбранная дата
  final _currentDate = ''.obs;
  String get  currentDate => _currentDate.value;
  void setCurrentDate(String newDate) => _currentDate.value = newDate;


  // Выбранный тип
  final _currentType = ''.obs;
  String get  currentType => _currentType.value;
  void setCurrentType(String newType) => _currentType.value = newType;


    // Переменные для создания спортивной программы
    // Название на русском
  var _nameRuAddSportProgramm = ''.obs;
  String get nameRuAddSportProgramm => _nameRuAddSportProgramm.value;
  setNameRuAddSportProgramm (String newName){_nameRuAddSportProgramm.value = newName;}

  // Название на английском 
  var _nameEngAddSportProgramm = ''.obs;
  String get nameEngAddSportProgramm => _nameEngAddSportProgramm.value;
  setNameEngAddSportProgramm (String newName){_nameEngAddSportProgramm.value = newName;}

  // Описание на русском
    var _descriptionRuAddSportProgramm = ''.obs;
  String get descriptionRuAddSportProgramm => _descriptionRuAddSportProgramm.value;
  setDescriptionRuAddSportProgramm (String newDescription){_descriptionRuAddSportProgramm.value = newDescription;}
  
  // Описание на английском
  var _descriptionEngAddSportProgramm = ''.obs;
  String get descriptionEngAddSportProgramm => _descriptionEngAddSportProgramm.value;
  setDescriptionEngAddSportProgramm (String newDescription){_descriptionEngAddSportProgramm.value = newDescription;}

  // Финальный список упражнений
  var _finalExercisesList = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get finalExercisesList => _finalExercisesList;
  void setExercisesList(List<Map<String, dynamic>> newExercisesList) { _finalExercisesList.assignAll(newExercisesList);}

  // Финальный список шаблонов питания
  var _finalNutritionsList = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get finalNutritionsList => _finalNutritionsList;
  void setNutritionsList(Map<String, dynamic> newNutritionsList) { _finalNutritionsList.add(newNutritionsList);}

  // Финальный список тестов
  var _finalTestsList = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get finalNTestsList => _finalTestsList;
  void setTestsList(List<Map<String, dynamic>> newTestsList) { _finalTestsList.assignAll(newTestsList);}


}