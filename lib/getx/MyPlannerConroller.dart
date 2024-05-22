
import 'package:get/get.dart';


class MyPlannerConroller  extends GetxController{
  // Выбранная дата



  //Список данных для журнала
  var _Planner = RxMap<String,dynamic>({});

  void setPlanner(newPlanner){
    this._Planner.assignAll(newPlanner);
    }
  Map<String, dynamic> get Planner => _Planner;
























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