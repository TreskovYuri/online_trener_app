import 'package:get/get.dart';

// Контроллер для работы с пользователями

class MyExercisesController extends GetxController {
  // Reactive list of exercises
  var _exercises = <Map<String, dynamic>>[].obs;
  
  // Getter for exercises
  List<Map<String, dynamic>> get exercises => _exercises;
  
  // Setter for exercises
  void setExercises(List<Map<String, dynamic>> newExercises) {
    _exercises.assignAll(newExercises);
  }


  var _groups = <Map<String, dynamic>>[].obs;
  
  // Getter for exercises
  List<Map<String, dynamic>> get groups => _groups;
  
  // Setter for exercises
  void setGroups(List<Map<String, dynamic>> newGroups) {
    _groups.assignAll(newGroups);
  }


  List<Map<String, dynamic>> GetExerciseOnGroupList() {
    List<Map<String, dynamic>> list =[];
    this._groups.forEach((element) {
      List<Map<String, dynamic>> exercises = [];
      this._exercises.forEach((el) {
        if(el['groupId']==element['id'] ){
          exercises.add(el);
        }

      });
      list.add({
        'type':element['name'],
        'exercises':exercises
      });
    });

    return[];
  }


}