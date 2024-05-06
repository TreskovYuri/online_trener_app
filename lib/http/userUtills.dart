import 'package:trener_app/http/http.dart';
// import 'package:fluttertoast/fluttertoast.dart';

Future<dynamic> SignIn({required String email, required String password}) async {
  try {
    var data = await Session().post('user/login', {'email':email, 'password':password});
      return data;
  } catch(e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}
