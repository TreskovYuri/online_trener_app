import 'package:flutter/cupertino.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';
import 'package:trener_app/widgets/text/counter.dart';
import 'package:trener_app/widgets/text/description.dart';

class MyTrainingPatternCard extends StatelessWidget {
  MyTrainingPatternCard({super.key, required this.card, required this.belongs});
  Map<String, dynamic> card;
  List<Map<String,dynamic>> belongs;

  @override
  Widget build(BuildContext context) {
    return MyCardButton(
      callback: () {},
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: MyDescriptionText(text: card['name']),
                ),
              ],
            ),
            SizedBox(height: 10,),
            MyCounter(width: 150, height: 20, size: 13, count: belongs.length)
          ],
        ),
      ),
    );
  }
}
