// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String email;
    int id;
    String post;
    String name;
    String secret;
    String number;
    String team;
    String date;
    String img;
    int trenerId;

    User({
        required this.email,
        required this.id,
        required this.post,
        required this.name,
        required this.secret,
        required this.number,
        required this.team,
        required this.date,
        required this.img,
        required this.trenerId,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"] == null ? '': json["email"],
        id: json["id"] == null ? 0: json["id"] as int,
        post: json["post"] == null ? '': json["post"],
        name: json["name"] == null ? '': json["name"],
        secret: json["secret"] == null ? '': json["secret"],
        number: json["number"] == null ? '': json["number"],
        team: json["team"] == null ? '': json["team"],
        date: json["date"] == null ? '':json["date"],
        img: json["img"] == null ? '': json["img"],
        trenerId: json["trenerId"] == null ? 0: json["trenerId"] as int,
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "post": post,
        "name": name,
        "secret": secret,
        "number": number,
        "team": team,
        "date": date,
        "img": img,
        "trenerId": trenerId,
    };
}
