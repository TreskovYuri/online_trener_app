import 'package:trener_app/http/http.dart';
import 'package:trener_app/mobx/mobx.dart';
// import 'package:fluttertoast/fluttertoast.dart';

Future<dynamic> SignIn({required String email, required String password,required Mobx mobx}) async {
  
  try {
    var data = await Session().post('user/login', {'email':email, 'password':password});
    mobx.setUser(data['body']);
      return data;
  } catch(e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}
