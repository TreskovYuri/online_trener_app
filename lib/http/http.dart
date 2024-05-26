import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

var URL = "${dotenv.env['API']}";

class Session {
  var headers = {};
  


  Future <Map<String,dynamic>> get(String url) async {
    final box = GetStorage();
    var apiUrl = Uri.parse('$URL/$url');
        // print(apiUrl);
    http.Response response = await http.get(apiUrl, headers: {'session': box.read('session') ?? ''});
      var responseBody = utf8.decode(response.bodyBytes);
      var decode = json.decode(responseBody);
      return {
        "status":response.statusCode,
        'body':decode
      };  

  }


  Future <Map<String,dynamic>> post(String url, Map<String,dynamic> data) async {
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

}
