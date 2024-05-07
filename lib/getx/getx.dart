
import 'package:get/get.dart';

class CurrentDate {
  var date = RxString('qwdqqwdqwdw');

  void setCurrentDate(newDate){
    date.value = newDate; // Use .value to assign the value
  }
}