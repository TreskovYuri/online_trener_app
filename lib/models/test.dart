// To parse this JSON data, do
//
//     final test = testFromJson(jsonString);

import 'dart:convert';

Test testFromJson(String str) => Test.fromJson(json.decode(str));

String testToJson(Test data) => json.encode(data.toJson());

class Test {
    int? id;
    int? programmId;
    int? testId;
    int? userId;
    String? date;
    DateTime? createdAt;
    DateTime? updatedAt;

    Test({
        this.id,
        this.programmId,
        this.testId,
        this.userId,
        this.date,
        this.createdAt,
        this.updatedAt,
    });

    factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["id"],
        programmId: json["programmId"],
        testId: json["testId"],
        userId: json["userId"],
        date: json["date"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "programmId": programmId,
        "testId": testId,
        "userId": userId,
        "date": date,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
