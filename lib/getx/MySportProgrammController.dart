
import 'package:get/get.dart';



// Контроллер для работы с пользователями

class MySportProgrammController extends GetxController{
    // Список спортивныйх программ
  var _sportprogramms = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get sportprogramms => _sportprogramms;
  void setSportProgrammList(List<Map<String, dynamic>> newSportProgrammList) { _sportprogramms.assignAll(newSportProgrammList);}


    // Список связей упражнения со спортивной программой
  var _sportprogrammsBelongExercise = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get sportprogrammsBelongExercise => _sportprogrammsBelongExercise;
  void setSportProgrammBelongExerciseList(List<Map<String, dynamic>> newSportProgrammBelongExerciseList) { _sportprogrammsBelongExercise.assignAll(newSportProgrammBelongExerciseList);}

    // Список связей питания со спортивной программой
  var _sportprogrammsBelongNutrition = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get sportprogrammsBelongNutrition => _sportprogrammsBelongNutrition;
  void setSportProgrammBelongNutritionList(List<Map<String, dynamic>> newSportProgrammBelongNutritionList) { _sportprogrammsBelongNutrition.assignAll(newSportProgrammBelongNutritionList);}

    // Список связей питания со спортивной программой
  var _sportprogrammsBelongTest = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get sportprogrammsBelongTest => _sportprogrammsBelongTest;
  void setSportProgrammBelongTestList(List<Map<String, dynamic>> newSportProgrammBelongTestList) { _sportprogrammsBelongTest.assignAll(newSportProgrammBelongTestList);}


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
  void setExercisesList(Map<String, dynamic> newExercisesList) { _finalExercisesList.add(newExercisesList);}

  // Финальный список шаблонов питания
  var _finalNutritionsList = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get finalNutritionsList => _finalNutritionsList;
  void setNutritionsList(Map<String, dynamic> newNutritionsList) { _finalNutritionsList.add(newNutritionsList);}

  // Финальный список тестов
  var _finalTestsList = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get finalNTestsList => _finalTestsList;
  void setTestsList(Map<String, dynamic> newTestsList) { _finalTestsList.add(newTestsList);}

  // Финальный список тестов
  var _finalUsersList = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get finallUsersList => _finalUsersList;
  void selUsersList(Map<String, dynamic> newTestsList) { _finalUsersList.add(newTestsList);}

  void clear (){
    _currentDate.value ='';
    _currentType.value = '';
    _nameRuAddSportProgramm.value = '';
    _descriptionRuAddSportProgramm.value = '';
    _nameEngAddSportProgramm.value = '';
    _descriptionEngAddSportProgramm.value = '';
     _finalExercisesList.clear();
     _finalNutritionsList.clear();
     _finalTestsList.clear();
     _finalUsersList.clear();
  }


}