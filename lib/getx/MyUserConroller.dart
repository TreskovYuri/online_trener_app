
import 'package:get/get.dart';


class MyUserController  extends GetxController{
  // Выбранная дата


  //Текущий пользователь
  var _user = RxMap<String,dynamic>({});
  void setUser(newUser){
    this._user.assignAll(newUser);
    }
  Map<String, dynamic> get user => _user;






  //Список спортсменов
  var _sportsmans = RxList<Map<String,dynamic>>([]);

  void setSportsmans(newSportsmans){
    this._sportsmans.assignAll(newSportsmans);
    }
  List<Map<String, dynamic>> get sportsmans => _sportsmans;
























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