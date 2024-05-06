import 'dart:convert'; // Import for JSON decoding
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


var URL = "${dotenv.env['API']}";

Future<dynamic> MyCasomGetHttpReauest({required String urls}) async {
  var apiUrl = Uri.parse('$URL/$urls');
  try {
    var response =
        await http.get(apiUrl, headers: {'Accept': 'application/json'});
        print(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      // Specify the encoding when decoding JSON
      var responseBody = utf8.decode(response.bodyBytes);
      return jsonDecode(responseBody);
    } else {
      // Return null if the response status code is not 200
      return null;
    }
  } catch (e) {
    print("Error: $e");
    return null; // Return null in case of error
  }
}

Future<dynamic> MyCasomPostHttpReauest({
  required String urls,
  required String email,
  required String password,
}) async {
  try {
    var apiUrl = Uri.parse('$URL/$urls');
    var response =
        await http.post(apiUrl, body: {"email": email, "password": password}, headers: {'Accept': 'application/json'});
        print(response);
    if (response.statusCode >0) {
      // Specify the encoding when decoding JSON
      var responseBody = {
        'status':response.statusCode,
        'data': jsonDecode(utf8.decode(response.bodyBytes))
      };
      return responseBody;
    } else {
      return null;
    }
  } catch (e) {
    print("Error: $e");
    return null;
  }
}

