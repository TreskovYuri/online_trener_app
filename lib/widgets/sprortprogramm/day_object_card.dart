
import 'package:flutter/material.dart';
import 'package:trener_app/widgets/text/description.dart';
import 'package:trener_app/widgets/text/title.dart';

class DayObjectCard extends StatelessWidget {
  DayObjectCard({super.key, required this.card});
  Map<String,dynamic> card;

  @override
  Widget build(BuildContext context) {
    return Container(  
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      child: Column(children: [
        Row(children: [MyTitleText(text: card['date'],size: 20)],),
        const SizedBox(height: 10,),
        ...card['objects'].map((e) => _Card(card: e))
      ],),
    );
  }
}

class _Card extends StatelessWidget {
  _Card({super.key, required this.card});
  Map<String, dynamic> card;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white24,
            width: 1.0,
          ),
        ),
      ),
      child: Row(children: [Expanded(child: MyDescriptionText(text: card['name'], weigth: FontWeight.w600,size: 15))],),
    );
  }
}