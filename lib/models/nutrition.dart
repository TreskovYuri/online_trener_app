
import 'dart:convert';

Nutrition nutritionFromJson(String str) => Nutrition.fromJson(json.decode(str));

String nutritionToJson(Nutrition data) => json.encode(data.toJson());

class Nutrition {
    int? id;
    int? programmId;
    int? nutritionId;
    int? userId;
    String? date;
    DateTime? createdAt;
    DateTime? updatedAt;

    Nutrition({
        this.id,
        this.programmId,
        this.nutritionId,
        this.userId,
        this.date,
        this.createdAt,
        this.updatedAt,
    });

    factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        id: json["id"],
        programmId: json["programmId"],
        nutritionId: json["nutritionId"],
        userId: json["userId"],
        date: json["date"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "programmId": programmId,
        "nutritionId": nutritionId,
        "userId": userId,
        "date": date,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
