import 'dart:convert';

import 'package:get/get.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/http/http.dart';
import 'package:trener_app/mobx/mobx.dart';

// ignore: non_constant_identifier_names
Future GetExercise() async {
  MyExercisesController myExercisesController = Get.put(MyExercisesController());

  try {
    // Assuming Session().get() returns Map<String, dynamic>
    Map<String, dynamic> data = await Session().get('exercises');
    print(data['body'][0]);
    
    List<Map<String, dynamic>> list = [];
    
    if (data['status'] < 300) {
      // Safely handle the data assuming 'body' is a List<dynamic>
      for (var e in data['body']) {
        Map<String,dynamic> exercise = {
          'id': e['id'] ?? 0,
          'groupId': e['groupId'] ?? 0,
          'nameRu': e['nameRu'] ?? '',
          'nameEng': e['nameEng'] ?? '',
          'descriptionRu': e['descriptionRu'] ?? '',
          'descriptionEn': e['descriptionEn'] ?? '',
          'link': e['link'] ?? '',
          'img': e['img'] ?? '',
          'stage': e['stage'] != null ? List<String>.from(json.decode(e['stage'])) : [],
          'equipment': e['equipment'] != null ? List<String>.from(json.decode(e['equipment'])) : [],
          'musclegroups': e['musclegroups'] != null ? List<String>.from(json.decode(e['musclegroups'])) : [],
          'pocazatel1Name': e['pocazatel1Name'] ?? '',
          'pocazatel1Type': e['pocazatel1Type'] ?? '',
          'pocazatel1SPFlag': e['pocazatel1SPFlag'] ?? '',
          'pocazatel2Name': e['pocazatel2Name'] ?? '',
          'pocazatel2Type': e['pocazatel2Type'] ?? '',
          'pocazatel2SPFlag': e['pocazatel2SPFlag'] ?? '',
          'pocazatel3Name': e['pocazatel3Name'] ?? '',
          'pocazatel3Type': e['pocazatel3Type'] ?? '',
          'pocazatel3SPFlag': e['pocazatel3SPFlag'] ?? '',
          'pocazatel4Name': e['pocazatel4Name'] ?? '',
          'pocazatel4Type': e['pocazatel4Type'] ?? '',
          'pocazatel4SPFlag': e['pocazatel4SPFlag'] ?? '',
          'pocazatel5Name': e['pocazatel5Name'] ?? '',
          'pocazatel5Type': e['pocazatel5Type'] ?? '',
          'pocazatel5SPFlag': e['pocazatel5SPFlag'] ?? '',
        };
        list.add(exercise);
      }
    }

    // Update the controller with the fetched exercises
    myExercisesController.setExercises(list);
    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}


Future GetGroups() async {
  MyExercisesController myExercisesController =
      Get.put(MyExercisesController());

  try {
    Map<String, dynamic> data = await Session().get('exercises/groups');
    List<Map<String, dynamic>> list = [];
    if (data['status'] < 300) {
      data['body'].forEach((e) {
        Map<String, dynamic> group = {
            'id': e['id'] ?? 0,
            'name': e['name'] ?? '',
            'trenerId': e['trenerId'] ?? 0
        };
        list.add(group);
      });
    }
    myExercisesController.setGroups(list);
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}

Future GetExerciseBelongForSportsmans(Mobx mobx) async {
  try {
    var data = await Session().get('sportprogramm/exersices/forusers');
    // mobx.setUserExercises(data);
    // print(mobx.userExercisesOnDay);
    return data;
  } catch (e) {
    print(e);
    return null;
  }
}
