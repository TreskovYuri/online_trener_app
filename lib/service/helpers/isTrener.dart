import 'package:get/get.dart';
import 'package:trener_app/getx/MyUserConroller.dart';

bool IsTrener(){
  final myUserController = Get.put(MyUserController());
  if(['Тренер','Супер тренер'].contains(myUserController.user['post'])){
    return true;
  }else{
    return false;
  }
}