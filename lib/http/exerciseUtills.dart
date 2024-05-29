import 'dart:convert';

import 'package:get/get.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/http/http.dart';
import 'package:trener_app/mobx/mobx.dart';

// Получить список упражнений
Future GetExercise() async {
  MyExercisesController myExercisesController = Get.put(MyExercisesController());

  try {
    Map<String, dynamic> data = await Session().get('exercises');
    List<Map<String, dynamic>> list = [];
    
    if (data['status'] < 300) {
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

    myExercisesController.setExercises(list);
    return data;
  } catch (e) {
    print(e);
  }
  
  return null;
}

// Получить список групп
Future GetExerciseGroups() async {
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

// Получить список сшаблонов тренировок
Future GetExercisePatterns() async {
  MyExercisesController myExercisesController =
      Get.put(MyExercisesController());

  try {
    Map<String, dynamic> data = await Session().get('exercises/patterns');
    List<Map<String, dynamic>> list = [];
    if (data['status'] < 300) {
      data['body'].forEach((e) {
        Map<String, dynamic> pattern = {
            'userId': e['userId'] ?? 0,
            'id': e['id'] ?? 0,
            'count': e['count'] ?? 0,
            'name': e['name'] ?? ''
        };
        list.add(pattern);
      });
    }
    myExercisesController.setExercisePattern(list);
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}

// Получить список связей упражнений с выбраным шаблоном
Future GetExerciseBelongPatterns(int id) async {
  MyExercisesController myExercisesController =
      Get.put(MyExercisesController());

  try {
    Map<String, dynamic> data = await Session().get('exercises/patterns/$id');
    List<Map<String, dynamic>> list = [];
    if (data['status'] < 300) {
      data['body'].forEach((e) {
        Map<String, dynamic> belong = {
            'programmId': e['programmId'] ?? 0,
            'exerciseId': e['exerciseId'] ?? 0,
            'userId': e['userId'] ?? 0,
            'sets': e['sets'] ?? {},
            'time': e['time'] ?? '',
            'date': e['date'] ?? ''
        };
        list.add(belong);
      });
    }
    myExercisesController.setExercisesBelongPattern(list);
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}

// Получить список связей упражнений со всеми шаблонами тренировок
Future GetExerciseAllBelongPatterns() async {
  MyExercisesController myExercisesController =
      Get.put(MyExercisesController());

  try {
    Map<String, dynamic> data = await Session().get('exercises/patterns/belongs');
    print(data);
    List<Map<String, dynamic>> list = [];
    if (data['status'] < 300) {
      data['body'].forEach((e) {
        Map<String, dynamic> belong = {
            'programmId': e['programmId'] ?? 0,
            'exerciseId': e['exerciseId'] ?? 0,
            'userId': e['userId'] ?? 0,
            'sets': e['sets'] ?? {},
            'time': e['time'] ?? '',
            'date': e['date'] ?? ''
        };
        list.add(belong);
      });
    }
    myExercisesController.setExercisesAllBelongPattern(list);
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}




// Добавление упражнения
Future AddExercise(Map <String,dynamic> formData) async {
  try {
    Map<String, dynamic> data = await Session().post('exercises',formData);
    GetExercise();
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}


// Добавление группы
Future AddExerciseGroup(Map <String,dynamic> formData) async {
  try {
    Map<String, dynamic> data = await Session().post('exercises/groups',formData);
    GetExerciseGroups();
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}
