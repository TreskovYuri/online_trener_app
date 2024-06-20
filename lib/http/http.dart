import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

var URL = "${dotenv.env['API']}";

class Session {
  var headers = {};
  


Future<Map<String, dynamic>> getMap(String url) async {
  final GetStorage box = GetStorage();
  final Uri apiUrl = Uri.parse('$URL/$url');
  final String session = box.read('session') ?? '';
  final http.Response response = await http.get(apiUrl, headers: {'session': session});

  final String responseBody = utf8.decode(response.bodyBytes);
  final decode = json.decode(responseBody);

  return {
    "status": response.statusCode,
    'body': decode
  };
}
Future<Map<String, dynamic>> getList(String url) async {
  final GetStorage box = GetStorage();
  final Uri apiUrl = Uri.parse('$URL/$url');
  final String session = box.read('session') ?? '';
  final http.Response response = await http.get(apiUrl, headers: {'session': session});

  final String responseBody = utf8.decode(response.bodyBytes);
  final decode = json.decode(responseBody);
  // print(decode);

  return {
    "status": response.statusCode,
    'body': decode
  };
}


  Future <Map<String,dynamic>> post(String url, data) async {
    final box = GetStorage();
    var apiUrl = Uri.parse('$URL/$url');
    // print(apiUrl);
    http.Response response = await http.post(apiUrl,body: data, headers: {'session': box.read('session') ?? ''});
    try {
      var responseBody = utf8.decode(response.bodyBytes);
      try {
        if (json.decode(responseBody)['session'] != null) {
          await box.write('session', json.decode(responseBody)['session']);
        }
      } catch (e) {
        print(e);
      }
      return {'status': response.statusCode, 'body': jsonDecode(responseBody) as Map<String, dynamic>};
    } catch (e) {
      print(e);
      return {'status': 418};
    }
  }

   Future<Map<String, dynamic>> post1(String url, dynamic data) async {
    final box = GetStorage();
    var apiUrl = '$URL/$url';
    var _dio = Dio();

    try {
      Response response = await _dio.post(
        apiUrl,
        data: data,
        options: Options(
          headers: {'session': box.read('session') ?? ''},
        ),
      );

      var responseBody = response.data;
      if (responseBody['session'] != null) {
        await box.write('session', responseBody['session']);
      }

      return {'status': response.statusCode!, 'body': responseBody as Map<String, dynamic>};
    } catch (e) {
      print(e);
      return {'status': 418};
    }
  }

}
