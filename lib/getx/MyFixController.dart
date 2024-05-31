import 'package:get/get.dart';

class MyFixController extends GetxController {
  // Фиксации тестов для спортсмена
  var _sportsmanTestsFix = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get sportsmanTestsFix => _sportsmanTestsFix.value;
  void setSportsmanTestsFix(List<Map<String, dynamic>> newData) {
    _sportsmanTestsFix.assignAll(newData);
  }
}
