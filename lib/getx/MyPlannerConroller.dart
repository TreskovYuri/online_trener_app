
import 'package:get/get.dart';
import 'package:trener_app/models/day.dart';
import 'package:trener_app/models/exercise.dart';
import 'package:trener_app/models/test.dart';
import 'package:trener_app/pages/sportsman/planner/nutrition.dart';


class MyPlannerConroller  extends GetxController{
  // Список данных для журнала
  var planner = <String,dynamic>{}.obs;

  // Метод для установки нового плана
void setPlanner(newPlanner) {
  planner.value = newPlanner;
}

  // Список всех упражнений пользователя
  var _exercises = <Exercise>[].obs;
  List<Exercise> get exercises => _exercises;
  void setExercises(List<Exercise> data) {_exercises.assignAll(data);}

  // Список всех тестов пользователя
  var _tests = <Test>[].obs;
  List<Test> get tests => _tests;
  void setTests(List<Test> data) {_tests.assignAll(data);}

  // Список всех чатов пользователя
  var _nutritions = <Nutrition>[].obs;
  List<Nutrition> get nutritions => _nutritions;
  void setNutritions(List<Nutrition> data) {_nutritions.assignAll(data);}

  // Список всех чатов пользователя
  var _days = <Day>[].obs;
  List<Day> get days => _days;
  void setDays(List<Day> data) {_days.assignAll(data);}






  var userExercisesOnDay = RxList();


  // Список всех упражнений
  var exercisesList = RxList();
  
  var testsList = RxList();


  void setUserExercisesOnDay(newList){
    userExercisesOnDay.value = newList; // Use .value to assign the value
  }
  void setTestsOnDay(newTests){
    testsList.value = newTests; // Use .value to assign the value
  }
}