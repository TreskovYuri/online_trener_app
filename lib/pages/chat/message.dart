import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/models/message.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({super.key, required this.message});
  Message message;

  MyUserController myUserController = Get.put(MyUserController());

  @override
  Widget build(BuildContext context) {
    if (message.userId == myUserController.user['id']) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const RadialGradient(
                colors: [
                  Color(0xff4D8AEE),
                  Color.fromARGB(201, 41, 52, 255),
                ],
                radius: 2.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 80, // Укажите желаемую максимальную ширину
              ),
              child: Text(
                message.message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 23, 26, 34),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              message.message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    }
  }
}