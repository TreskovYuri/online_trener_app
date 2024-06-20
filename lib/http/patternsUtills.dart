
import 'package:get/get.dart';
import 'package:trener_app/getx/MyPatternsController.dart';
import 'package:trener_app/http/http.dart';

// Получить список упражнений
Future GetPatterns() async {
  MyPatternsController myPatternsController = Get.put(MyPatternsController());

  try {
    Map<String, dynamic> data = await Session().getList('exercises/patterns');
    List<Map<String, dynamic>> list = [];
    if (data['status'] < 300) {
      for (var e in data['body']) {
        Map<String,dynamic> pattern = {
          'id': e['id'] ?? 0,
          'userId': e['userId'] ?? 0,
          'count': e['count'] ?? 0,
          'name': e['name'] ?? '',
        };
        list.add(pattern);
      }
    }

    myPatternsController.setExercisePatterns(list);
    return data;
  } catch (e) {
    print(e);
  }
  
  return null;
}

// // Получить список групп
// Future GetExerciseGroups() async {
//   MyExercisesController myExercisesController =
//       Get.put(MyExercisesController());

//   try {
//     Map<String, dynamic> data = await Session().get('exercises/groups');
//     List<Map<String, dynamic>> list = [];
//     if (data['status'] < 300) {
//       data['body'].forEach((e) {
//         Map<String, dynamic> group = {
//             'id': e['id'] ?? 0,
//             'name': e['name'] ?? '',
//             'trenerId': e['trenerId'] ?? 0
//         };
//         list.add(group);
//       });
//     }
//     myExercisesController.setGroups(list);
//     return data;
//   } catch (e) {
//     print(e);
//   }
//   // Возвращаемое значение в случае неудачи
//   return null;
// }




// // Добавление упражнения
// Future AddExercise(Map <String,dynamic> formData) async {
//   try {
//     Map<String, dynamic> data = await Session().post('exercises',formData);
//     GetExercise();
//     return data;
//   } catch (e) {
//     print(e);
//   }
//   // Возвращаемое значение в случае неудачи
//   return null;
// }


// // Добавление группы
// Future AddExerciseGroup(Map <String,dynamic> formData) async {
//   try {
//     Map<String, dynamic> data = await Session().post('exercises/groups',formData);
//     GetExerciseGroups();
//     return data;
//   } catch (e) {
//     print(e);
//   }
//   // Возвращаемое значение в случае неудачи
//   return null;
// }
