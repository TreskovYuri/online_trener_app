



// Получить список групп
import 'package:get/get.dart';
import 'package:trener_app/getx/MyFixController.dart';
import 'package:trener_app/http/http.dart';


// Получние списка фиксаций тестов для запрашивабщего спортсмена
Future GetTestFixForSportsman() async {
  MyFixController myFixController =
      Get.put(MyFixController());

  try {
    Map<String, dynamic> data = await Session().get('fix/sportsman/test');
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
    Map<String, dynamic> data = await Session().post('fix/sportsman/test', formData);
    print(data);
    GetTestFixForSportsman();
    return data;
  } catch (e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}
