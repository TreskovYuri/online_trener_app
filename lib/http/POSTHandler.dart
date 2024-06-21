import 'package:flutter/foundation.dart';
import 'package:trener_app/http/http.dart';


// Функция для получения данных с сервера и присваивания ее в глобальное хранилище
Future<Map<String,dynamic>> setData({
  required String url,
  required Function getData,
  required Map<String,dynamic> formData,
}) async {
  try {
    Map<String, dynamic> data = await Session().post(url,formData);
    debugPrint(data.toString());
    if (data['status'] == 200) {
      await getData();
      return data;
    } else {
      // Обработка случая, если статус не равен 200
      debugPrint("Ошибка запроса (Статус отличается от 200): ${data['status']}, ${data['message']}");
    }
  } catch (e) {
    debugPrint(": $e");
  }
  return {};
}
