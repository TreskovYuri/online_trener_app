import 'dart:convert';

import 'package:trener_app/models/user.dart';

Chat chatFromJson(String str) => Chat.fromJson(json.decode(str));

String chatToJson(Chat data) => json.encode(data.toJson());

class Chat {
    ChatInfo chat;
    List<User> users;
    LastMessage? lastMessage; // Marked as nullable
    int unRead;

    Chat({
        required this.chat,
        required this.users,
        this.lastMessage, // Nullable field
        required this.unRead,
    });

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        chat: ChatInfo.fromJson(json["chat"]),
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        lastMessage: json["lastMessage"] != null ? LastMessage.fromJson(json["lastMessage"]) : null, // Handle null
        unRead: json["unRead"],
    );

    Map<String, dynamic> toJson() => {
        "chat": chat.toJson(),
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "lastMessage": lastMessage?.toJson() ?? {}, // Handle null with null-aware operator
        "unRead": unRead,
    };
}

class ChatInfo {
    int id;
    int userId;
    String name;
    bool messageOnlyI;
    bool isGroup;
    DateTime createdAt;
    DateTime updatedAt;

    ChatInfo({
        required this.id,
        required this.userId,
        required this.name,
        required this.messageOnlyI,
        required this.isGroup,
        required this.createdAt,
        required this.updatedAt,
    });

    factory ChatInfo.fromJson(Map<String, dynamic> json) => ChatInfo(
        id: json["id"] ?? 0,
        userId: json["userId"] ?? 0,
        name: json["name"] ?? '',
        messageOnlyI: json["messageOnlyI"] ?? false,
        isGroup: json["isGroup"] ?? false,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "name": name,
        "messageOnlyI": messageOnlyI,
        "isGroup": isGroup,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class LastMessage {
    int id;
    int chatId;
    int userId;
    String message;
    bool isRead;
    DateTime createdAt;
    DateTime updatedAt;

    LastMessage({
        required this.id,
        required this.chatId,
        required this.userId,
        required this.message,
        required this.isRead,
        required this.createdAt,
        required this.updatedAt,
    });

    factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
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
