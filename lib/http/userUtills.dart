import 'package:trener_app/getx/getx_controller.dart';
import 'package:trener_app/http/http.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/models/user.dart';
// import 'package:fluttertoast/fluttertoast.dart';

Future<dynamic> SignIn({required String email, required String password,required Mobx mobx}) async {
  MyGetxController getx = MyGetxController();
  try {
    var data = await Session().post('user/login', {'email':email, 'password':password});
    mobx.setUser(data['body']);
    getx.setUser( data['body']);
      return data;
  } catch(e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}
