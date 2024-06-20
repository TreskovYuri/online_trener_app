import 'package:flutter/material.dart';
import 'package:trener_app/models/chat.dart';
import 'package:trener_app/models/user.dart';
import 'package:trener_app/modules/chats/DialogCard.dart';
import 'package:trener_app/service/voids/ToChat.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';

class ListViewChatCard extends StatelessWidget {
  ListViewChatCard(
      {super.key, required this.card, required this.vh, required this.vw});
  Chat card;
  double vh;
  double vw;

  @override
  Widget build(BuildContext context) {
    List<User> users = card.users;
    return MyCardButton(
      callback: () => ToChat(card),
      widget: DialogCard(
        chat: card,
        users: users,
      ),
    );
  }
}
