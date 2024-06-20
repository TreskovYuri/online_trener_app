
import 'package:get/get.dart';
import 'package:trener_app/getx/MyNutritionsController.dart';
import 'package:trener_app/http/http.dart';

// ignore: non_constant_identifier_names
Future GetNutritions() async {
  MyNutritionsController myNutritionsController = Get.put(MyNutritionsController());

  try {
    // Assuming Session().get() returns Map<String, dynamic>
    Map<String, dynamic> data = await Session().getList('nutritions');

    
    List<Map<String, dynamic>> list = [];
    
    if (data['status'] < 300) {
      // Safely handle the data assuming 'body' is a List<dynamic>
      for (var e in data['body']) {
        Map<String,dynamic> test = {
           'description': e['description']??'',
          'groupId': e['groupId']??0,
          'id': e['id']??0,
          'userId': e['userId']??0,
          'name': e['name']??'',
          'recomendation': e['recomendation']??'',
          'name1': e['name1']??'',
          'description1': e['description1']??'',
          'name2': e['name2']??'',
          'description2': e['description2']??'',
          'name3': e['name3']??'',
          'description3': e['description3']??'',
          'name4': e['name4']??'',
          'description4': e['description4']??'',
          'name5': e['name5']??'',
          'description5': e['description5']??'',
        };
        list.add(test);
      }
    }

    // Update the controller with the fetched exercises
    myNutritionsController.setNutritions(list);
    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}
