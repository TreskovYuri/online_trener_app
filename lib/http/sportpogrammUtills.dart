import 'dart:convert';

import 'package:get/get.dart';
import 'package:trener_app/getx/MyJournalConroller.dart';
import 'package:trener_app/http/http.dart';
// import 'package:fluttertoast/fluttertoast.dart';



Future GetJournal() async {
  MyJournalConroller myJournalConroller = Get.put(MyJournalConroller());

  try {
    // Assuming Session().get() returns Map<String, dynamic>
    Map<String, dynamic> data = await Session().get('journal');

    List<Map<String, dynamic>> list = [];
    if (data['status'] < 300) {
      // Safely handle the data assuming 'body' is a List<dynamic>
      for (var e in data['body']) {
        Map<String,dynamic> sportsmans = {
                "id":e['id']??0,
                "name":e['name']??'',
                "number":e['number']??'',
                "email":e['email']??'',
                "post":e['post']??'',
                "team":e['team']??'',
                "exercises":e['exercises'],
                "tests":e['tests'],
                "nutrition":e['nutrition'],
        };
        list.add(sportsmans);
      }
    }

    // Update the controller with the fetched exercises
    myJournalConroller.setJournal(list);
    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}

