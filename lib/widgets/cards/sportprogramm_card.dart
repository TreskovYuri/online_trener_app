import 'package:flutter/material.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';
import 'package:trener_app/widgets/text/description.dart';

class MySprotProgrammCard extends StatelessWidget {
  MySprotProgrammCard({super.key,required this.programm});
  Map<String,dynamic> programm;

  @override
  Widget build(BuildContext context) {
    return MyCardButton(callback: (){}, widget: Column(children: [
      Row(
        children: [Expanded(child: MyDescriptionText(text: programm['name']))],
      )
    ],));
  }
}