
import 'package:get/get.dart';


class MyJournalConroller  extends GetxController{
  // Выбранная дата



  //Список данных для журнала
  var _Journal = RxList<Map<String,dynamic>>([]);

  void setJournal(newJournal){
    this._Journal.assignAll(newJournal);
    }
  List<Map<String, dynamic>> get Journal => _Journal;
























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