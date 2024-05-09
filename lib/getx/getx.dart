
import 'package:get/get.dart';

class MyeGetx {
  // Выбранная дата
  final _date = RxString('qwdqqwdqwdw');
  String get  date => _date.value;
  void setCurrentDate(String newDate) => _date.value = newDate;


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