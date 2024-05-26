
import 'package:get/get.dart';
import 'package:trener_app/getx/MyTestsController.dart';
import 'package:trener_app/http/http.dart';

// ignore: non_constant_identifier_names
Future GetTests() async {
  MyTestsController myTestsController = Get.put(MyTestsController());

  try {
    // Assuming Session().get() returns Map<String, dynamic>
    Map<String, dynamic> data = await Session().get('tests');

    
    List<Map<String, dynamic>> list = [];
    
    if (data['status'] < 300) {
      // Safely handle the data assuming 'body' is a List<dynamic>
      for (var e in data['body']) {
        Map<String,dynamic> test = {
           'description': e['description']??'',
          'groupId': e['groupId']??0,
          'id': e['id']??0,
          'item': e['item']??'',
          'name': e['name']??'',
          'type': e['type']??'',
          'userId': e['userId']??0,
        };
        list.add(test);
      }
    }

    // Update the controller with the fetched exercises
    myTestsController.setTests(list);
    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}


// ignore: non_constant_identifier_names
Future GetTestGroups() async {
  MyTestsController myTestsController = Get.put(MyTestsController());

  try {
    // Assuming Session().get() returns Map<String, dynamic>
    Map<String, dynamic> data = await Session().get('tests/group');
    
    List<Map<String, dynamic>> list = [];
    
    if (data['status'] < 300) {
      // Safely handle the data assuming 'body' is a List<dynamic>
      for (var e in data['body']) {
        Map<String,dynamic> group = {
          'id': e['id']??0,
          'name': e['name'],
          'userId': e['userId']??0,
        };
        list.add(group);
      }
    }

    // Update the controller with the fetched exercises
    myTestsController.setGroups(list);
    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}



// ignore: non_constant_identifier_names
Future AddTestGroup({formData}) async {
  try {
    // Assuming Session().get() returns Map<String, dynamic>
    Map<String, dynamic> data = await Session().post('tests/group',formData);
    if(data['status'] <300){GetTestGroups();}
    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}


// ignore: non_constant_identifier_names
Future AddTest({formData}) async {
  try {
    print(formData);
    Map<String, dynamic> data = await Session().post('tests',formData);
    if(data['status'] <300){GetTestGroups();}
    
    print(data);
    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}