import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

var URL = "${dotenv.env['API']}";

class Session {
  var headers = {};
  
  Future get(String url) async {
    final box = GetStorage();
    var apiUrl = Uri.parse('$URL/$url');
    // print(apiUrl);
    http.Response response =
        await http.get(apiUrl, headers: {'session': box.read('session') ?? ''});
    var responseBody = utf8.decode(response.bodyBytes);
    // print(json.decode(responseBody));
    return json.decode(responseBody);
  }

  Future post(String url, dynamic data) async {
    final box = GetStorage();
    var apiUrl = Uri.parse('$URL/$url');
    http.Response response = await http.post(apiUrl,
        body: data, headers: {'session': box.read('session') ?? ''});
    try {
      var responseBody = utf8.decode(response.bodyBytes);
      try {
        if (json.decode(responseBody)['session'] != null) {
          await box.write('session', json.decode(responseBody)['session']);
        }
      } catch (e) {
        print(e);
      }
      return {'status': response.statusCode, 'body': jsonDecode(responseBody)};
    } catch (e) {
      print(e);
      return {'status': 418};
    }
  }

}
