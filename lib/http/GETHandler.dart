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
    debugPrint(data.toString());
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
    debugPrint("Ошибка запроса GET запроса: $e");
  }
  return null;
}



// Функция для получения данных с сервера и присваивания их в глобальное хранилище
Future<Map<String, T>?> fetchMapData<T>({
  required String url,
  required T Function(Map<String, dynamic>) fromJson,
  required void Function(Map<String, T>) setData,
}) async {
  try {
    Map<String, dynamic> data = await Session().get(url);
    debugPrint(data.toString());
    if (data['status'] == 200) {
      Map<String, T> items = {};
      (data['body'] as Map<String, dynamic>).forEach((key, value) {
        items[key] = fromJson(value as Map<String, dynamic>);
      });
      setData(items);
      return items;
    } else {
      // Обработка случая, если статус не равен 200
      debugPrint("Ошибка запроса (Статус отличается от 200): ${data['status']}, ${data['message']}");
    }
  } catch (e) {
    debugPrint("Ошибка запроса GET запроса: $e");
  }
  return null;
}