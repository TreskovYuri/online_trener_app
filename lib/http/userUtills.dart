import 'package:get/get.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/getx/getx_controller.dart';
import 'package:trener_app/http/http.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/models/user.dart';
// import 'package:fluttertoast/fluttertoast.dart';

Future<dynamic> SignIn({required String email, required String password,required Mobx mobx}) async {
    MyUserController myUserController = Get.put(MyUserController());
  try {
    var data = await Session().post('user/login', {'email':email, 'password':password});
    if(data['status']<300){
      myUserController.setUser( data['body']);
    }
      return data;
  } catch(e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}
