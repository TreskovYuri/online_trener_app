import 'package:flutter/foundation.dart';
import 'package:trener_app/http/http.dart';


// Функция для получения данных с сервера и присваивания ее в глобальное хранилище
Future<List<T>?> fetchData<T>({
  required String url,
  required T Function(Map<String, dynamic>) fromJson,
  required void Function(List<T>) setData,
}) async {
  try {
    Map<String, dynamic> data = await Session().get(url);
    if (data['status'] == 200) {
      List<T> items = [];
      for (Map<String, dynamic> i in data['body']) {
        items.add(fromJson(i));
      }
      setData(items);
      return items;
    } else {
      // Обработка случая, если статус не равен 200
      debugPrint("Ошибка запроса (Статус отличается от 200): ${data['status']}, ${data['message']}");
    }
  } catch (e) {
    debugPrint(": $e");
  }
  return null;
}
