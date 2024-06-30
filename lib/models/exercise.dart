// To parse this JSON data, do
//
//     final exercise = exerciseFromJson(jsonString);

import 'dart:convert';

Exercise exerciseFromJson(String str) => Exercise.fromJson(json.decode(str));

String exerciseToJson(Exercise data) => json.encode(data.toJson());

class Exercise {
    int? id;
    int? programmId;
    int? exerciseId;
    int? userId;
    String? sets;
    dynamic time;
    String? date;
    dynamic recomendation;
    DateTime? createdAt;
    DateTime? updatedAt;

    Exercise({
        this.id,
        this.programmId,
        this.exerciseId,
        this.userId,
        this.sets,
        this.time,
        this.date,
        this.recomendation,
        this.createdAt,
        this.updatedAt,
    });

    factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json["id"],
        programmId: json["programmId"],
        exerciseId: json["exerciseId"],
        userId: json["userId"],
        sets: json["sets"],
        time: json["time"],
        date: json["date"],
        recomendation: json["recomendation"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "programmId": programmId,
        "exerciseId": exerciseId,
        "userId": userId,
        "sets": sets,
        "time": time,
        "date": date,
        "recomendation": recomendation,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
