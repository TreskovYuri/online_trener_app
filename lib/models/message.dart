// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
    int id;
    int chatId;
    int userId;
    String message;
    bool isRead;
    DateTime createdAt;
    DateTime updatedAt;

    Message({
        required this.id,
        required this.chatId,
        required this.userId,
        required this.message,
        required this.isRead,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        chatId: json["chatId"],
        userId: json["userId"],
        message: json["message"],
        isRead: json["isRead"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "chatId": chatId,
        "userId": userId,
        "message": message,
        "isRead": isRead,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
