import 'package:flutter/cupertino.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';
import 'package:trener_app/widgets/text/description.dart';

class MyTrainingPatternCard extends StatelessWidget {
  MyTrainingPatternCard({super.key, required this.card});
  Map<String, dynamic> card;

  @override
  Widget build(BuildContext context) {
    return MyCardButton(
      callback: () {},
      widget: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MyDescriptionText(text: 'card'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
