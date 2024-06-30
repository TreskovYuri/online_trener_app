import 'dart:convert';

import 'package:trener_app/models/training.dart';

List<Day> daysFromJson(List str) => List<Day>.from(str.map((x) => Day.fromJson(x)));

String daysToJson(List<Day> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Day {
    String? date;
    Training? training;

    Day({
        this.date,
        this.training,
    });

    factory Day.fromJson(Map<String, dynamic>? json) {
        if (json == null) {
            return Day();
        }

        return Day(
            date: json["date"] as String?,
            training: json["training"] == null ? null : Training.fromJson(json["training"] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() => {
        "date": date,
        "training": training?.toJson(),
    };
}
