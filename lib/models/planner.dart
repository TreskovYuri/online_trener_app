import 'package:trener_app/models/day.dart';

class Planner {
  List exercises;
  List tests;
  List nutrition;
  List days;

  Planner({
    required this.exercises,
    required this.tests,
    required this.nutrition,
    required this.days,
  });

      factory Planner.fromJson(Map<String, dynamic> json) => Planner(
        exercises: json["exercises"] == null ? [] : json["exercises"] as List,
        tests: json["tests"] == null ? [] : json["tests"] as List,
        nutrition: json["nutrition"] == null ? [] : json["nutrition"] as List,
        days: json["days"] == null ? [] : List<Day>.from(json["days"]!.map((x) => Day.fromJson(x))),
    );

        Map<String, dynamic> toJson() => {
        "exercises":  List<dynamic>.from(exercises.map((x) => x.toJson())),
        "tests":List<dynamic>.from(tests.map((x) => x.toJson())),
        "nutrition":  List<dynamic>.from(nutrition.map((x) => x.toJson())),
        "days":  List<dynamic>.from(days.map((x) => x.toJson())),
    };


}
