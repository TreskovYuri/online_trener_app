

import 'package:get/get.dart';
import 'package:trener_app/getx/getx.dart';

class MyController extends GetxController{
  var repository= CurrentDate();
  void setCurrentDate(date){
    repository.setCurrentDate(date); // Use the method to update the date
  }
}