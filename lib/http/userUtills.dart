import 'package:get/get.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/http/http.dart';
import 'package:trener_app/mobx/mobx.dart';
// import 'package:fluttertoast/fluttertoast.dart';

Future<dynamic> SignIn({required String email, required String password,required Mobx mobx}) async {
    MyUserController myUserController = Get.put(MyUserController());
  try {
    var data = await Session().post('user/login', {'email':email, 'password':password});
    if(data['status']<300){
      // print(data['body']['session']);
      myUserController.setUser( data['body']);
    }
      return data;
  } catch(e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}



Future GetSportsmans() async {
  MyUserController myUserController = Get.put(MyUserController());

  try {
    // Assuming Session().get() returns Map<String, dynamic>
    Map<String, dynamic> data = await Session().get('user/sportsmans');
    
    List<Map<String, dynamic>> list = [];
    
    if (data['status'] < 300) {
      // Safely handle the data assuming 'body' is a List<dynamic>
      for (var e in data['body']) {
        Map<String,dynamic> sportsmans = {
           'email': e['email']??'',
          'id': e['id']??0,
          'trenerId': e['trenerId']??0,
          'post': e['post']??'',
          'name': e['name']??'',
          'number': e['number']??'',
          'team': e['team']??'',
          'date': e['date']??'',
          'img': e['img']??'',
        };
        list.add(sportsmans);
      }
    }

    // Update the controller with the fetched exercises
    myUserController.setSportsmans(list);
    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}




Future GetUsers() async {
  MyUserController myUserController = Get.put(MyUserController());

  try {
    // Assuming Session().get() returns Map<String, dynamic>
    Map<String, dynamic> data = await Session().get('user/users');
    List<Map<String, dynamic>> list = [];
    
    if (data['status'] < 300) {
      // Safely handle the data assuming 'body' is a List<dynamic>
      for (var e in data['body']) {
        Map<String,dynamic> users = {
           'email': e['email']??'',
          'id': e['id']??0,
          'trenerId': e['trenerId']??0,
          'post': e['post']??'',
          'name': e['name']??'',
          'number': e['number']??'',
          'team': e['team']??'',
          'date': e['date']??'',
          'img': e['img']??'',
        };
        list.add(users);
      }
    }

    // Update the controller with the fetched exercises
    myUserController.setUsers(list);
    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}

