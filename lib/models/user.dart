import 'package:flutter/material.dart';

class User {
  User({required this.name, required this.email, required this.team, required this.post, required this.img});
  String name;
  String email;
  String team;
  String post;
  String img;

  Map<String, dynamic> get data {
    return {
      'name': name,
      'email': email,
      'team': team,
      'post': post,
      'img': img,
    };
  }
}