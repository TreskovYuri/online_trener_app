
import 'dart:convert';

import 'package:get/get.dart';
import 'package:trener_app/getx/MyJournalConroller.dart';
import 'package:trener_app/getx/MyPlannerConroller.dart';
import 'package:trener_app/getx/MySportProgrammController.dart';
import 'package:trener_app/http/GETHandler.dart';
import 'package:trener_app/http/http.dart';
import 'package:trener_app/models/day.dart';
import 'package:trener_app/models/nutrition.dart';
import 'package:trener_app/models/planner.dart';
import 'package:trener_app/models/test.dart';
import 'package:trener_app/models/training.dart';
// import 'package:fluttertoast/fluttertoast.dart';



Future GetJournal() async {
  MyJournalConroller myJournalConroller = Get.put(MyJournalConroller());

  try {
    // Assuming Session().get() returns Map<String, dynamic>
    Map<String, dynamic> data = await Session().get('journal');
  print(data);
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



Future GetPlanner() async {
  
  final myPlannerConroller = Get.put(MyPlannerConroller());

    //   await fetchMapData<Planner>(
    //   url: 'planner',
    //   fromJson: (json) => Planner.fromJson(json),
    //   setData: (planner) => myPlannerConroller.setPlanner(planner as Planner),
    // );

  try {
    // Assuming Session().get() returns Map<String, dynamic>
    Map<String, dynamic> data = await Session().get('planner');
    List<Day> finalList = [];
    if (data['status'] < 300) {
        // myPlannerConroller.setExercises(data['body']['exercises'].map((e)=>Exercise.fromJson(e))??[]);
        // myPlannerConroller.setExercises(data['body']['tests'].map((e)=>Test.fromJson(e))??[]);
        // myPlannerConroller.setExercises(data['body']['nutrition'].map((e)=>Nutrition.fromJson(e))??[]);
        data['body']['days'].forEach((day)=>{
          finalList.add(Day.fromJson(day))
        });
        myPlannerConroller.setDays(finalList);
        myPlannerConroller.setPlanner(data['body']);
    }

    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}

// Получение списка спортивных программ
Future GetSportProgramm() async {
  MySportProgrammController mySportProgrammController = Get.put(MySportProgrammController());

  try {
    Map<String, dynamic> data = await Session().get('sportprogramm');
    List<Map<String, dynamic>> list = [];
    if (data['status'] < 300) {
      data['body'].forEach((e) {
        Map<String, dynamic> group = {
            'id': e['id'] ?? 0,
            'userId': e['userId'] ?? 0,
            'name': e['name'] ?? '',
            'description': e['description'] ?? '',
        };
        list.add(group);
      });
    }
    mySportProgrammController.setSportProgrammList(list);
    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}

// Создание спортивной программы
Future SetSportProgramm(Map <String,dynamic>formData) async {

  try {
    Map<String, dynamic> data = await Session().post('sportprogramm',formData);
    if(data['status']<300)GetSportProgramm();

    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}


// Фиксация спортивной программы
Future SetFixSportProgramm(Map <String,dynamic>formData) async {
  try {
    Map<String, dynamic> data = await Session().post('sportprogramm/fix',formData);
    
    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}

// Получение списка спортивных программ
Future GetFixSportProgramm(id) async {
  MySportProgrammController mySportProgrammController = Get.put(MySportProgrammController());

  try {
    Map<String, dynamic> data = await Session().get('sportprogramm/fix/$id');
    List<Map<String, dynamic>> list = [];
    if (data['status'] < 300) {
      data['body'].forEach((e) {
        Map<String, dynamic> group = {
            'id': e['id'] ?? 0,
            'exerciseId': e['exerciseId'] ?? 0,
            'programmId': e['programmId'] ?? 0,
            'userId': e['userId'] ?? 0,
            'setId': e['setId'] ?? 0,
            'date': e['date'] ?? '',
            'sets': jsonDecode(e['sets']) ?? [],
        };
        list.add(group);
      });
    }
    mySportProgrammController.setFixList(list);
    return data;
  } catch (e) {
    print(e);
  }
  
  // Return null in case of failure
  return null;
}

