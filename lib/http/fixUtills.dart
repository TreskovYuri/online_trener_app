// Получить список групп
import 'package:get/get.dart';
import 'package:trener_app/getx/MyFixController.dart';
import 'package:trener_app/getx/MySportProgrammController.dart';
import 'package:trener_app/http/http.dart';

// Получние списка фиксаций тестов для запрашивабщего спортсмена
Future GetTestFixForSportsman() async {
  MyFixController myFixController = Get.put(MyFixController());

  try {
    Map<String, dynamic> data = await Session().getList('fix/sportsman/test');
    List<Map<String, dynamic>> list = [];

    if (data['status'] < 300) {
      data['body'].forEach((e) {
        Map<String, dynamic> data = {
          'testId': e['testId'] ?? 0,
          'programmId': e['programmId'] ?? 0,
          'result': e['result'] ?? 0,
          'trenerId': e['trenerId'] ?? 0,
          'date': e['date'] ?? '',
        };
        list.add(data);
      });
    }
    myFixController.setSportsmanTestsFix(list);
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}

// Получние списка фиксаций тестов для запрашивабщего спортсмена
Future GetTestFixForTrenr() async {
  MyFixController myFixController = Get.put(MyFixController());

  try {
    Map<String, dynamic> data = await Session().getList('fix/trener/test');
    List<Map<String, dynamic>> list = [];
    if (data['status'] < 300) {
      data['body'].forEach((e) {
        Map<String, dynamic> data = {
          'testId': e['testId'] ?? 0,
          'programmId': e['programmId'] ?? 0,
          'sportsmanId': e['sportsmanId'] ?? 0,
          'result': e['result'] ?? 0,
          'trenerId': e['trenerId'] ?? 0,
          'date': e['date'] ?? '',
        };
        list.add(data);
      });
    }
    myFixController.setSportsmanTestsFix(list);
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}

// Создания фиксации от спортсмена
Future SetTestFixForSportsman(formData) async {
  try {
    Map<String, dynamic> data =
        await Session().post('fix/sportsman/test', formData);
    GetTestFixForSportsman();
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}


// Получние списка фиксаций тестов для запрашивабщего спортсмена
Future GetSportprogrammFixForTrener() async {
  MySportProgrammController mySportProgrammController = Get.put(MySportProgrammController());

  try {
    Map<String, dynamic> data = await Session().getList('sportprogramm/fix/bytrenerid');
    List<Map<String, dynamic>> list = [];

    if (data['status'] < 300) {
      data['body'].forEach((e) {
        Map<String, dynamic> data = {
          'id': e['id'] ?? 0,
          'programmId': e['programmId'] ?? 0,
          'exerciseId': e['exerciseId'] ?? 0,
          'userId': e['userId'] ?? 0,
          'setId': e['setId'] ?? 0,
          'sets': e['sets'] ?? '',
          'date': e['date'] ?? '',
        };
        list.add(data);
      });
    }
    mySportProgrammController.setFixList(list);
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}
