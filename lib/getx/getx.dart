
import 'package:get/get.dart';


class MyController  extends GetxController{
  // Выбранная дата


  //Текущий пользователь
  var user = RxMap({});
  void setUser(newUser){
    user.clear(); // Очищаем текущий RxMap
    user.addAll(newUser);
    }


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