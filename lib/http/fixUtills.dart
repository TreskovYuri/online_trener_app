// Получить список групп
import 'package:get/get.dart';
import 'package:trener_app/getx/MyFixController.dart';
import 'package:trener_app/http/http.dart';

// Получние списка фиксаций тестов для запрашивабщего спортсмена
Future GetTestFixForSportsman() async {
  MyFixController myFixController = Get.put(MyFixController());

  try {
    Map<String, dynamic> data = await Session().get('fix/sportsman/test');
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
    Map<String, dynamic> data = await Session().get('fix/trener/test');
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
