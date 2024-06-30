import 'dart:convert';

import 'package:trener_app/models/day.dart';
import 'package:trener_app/models/training.dart';

List<Days> daysFromJson(String str) {
  if (str.isEmpty) {
    return [];
  }
  var decodedJson = json.decode(str);
  if (decodedJson == null) {
    return [];
  }
  return List<Days>.from(decodedJson.map((x) => Days.fromJson(x)));
}

String daysToJson(List<Days> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Days {
  String? date;
  Training? training;

  Days({
    this.date,
    this.training,
  });

  factory Days.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Days();
    }

    return Days(
      date: json["date"] as String?,
      training: json["training"] == null ? null : Training.fromJson(json["training"] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    "date": date,
    "training": training?.toJson(),
  };
}
