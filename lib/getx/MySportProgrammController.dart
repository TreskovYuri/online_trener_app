
import 'package:get/get.dart';



// Контроллер для работы с пользователями

class MySportProgrammController extends GetxController{
  // Выбранная дата
  final _currentDate = RxString('');
  String get  currentDate => _currentDate.value;
  void setCurrentDate(String newDate) => _currentDate.value = newDate;


  // Выбранный тип
  final _currentType = RxString('');
  String get  currentType => _currentType.value;
  void setCurrentType(String newType) => _currentType.value = newType;


    // Переменные для создания спортивной программы
  var nameRuAddSportProgramm = ''.obs;
  String get getNameRuAddSportProgramm => nameRuAddSportProgramm.value;
  setNameRuAddSportProgramm (String newName){nameRuAddSportProgramm.value = newName;}

}