import 'package:flutter/cupertino.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';
import 'package:trener_app/widgets/checkbox.dart';
import 'package:trener_app/widgets/circle_default_user_icon.dart';
import 'package:trener_app/widgets/circle_network_Img.dart';
import 'package:trener_app/widgets/text/title.dart';

class MyExerciseCard extends StatelessWidget {
  MyExerciseCard({
    super.key, 
    required this.card,
    required this.isChecked,
    required this.callback,
    });
  Map<String, dynamic> card;
  final bool isChecked;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return MyCardButton(
        callback: callback,
        widget: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            card['img'] != ''
                ? MyCircleNetworkImg(width: 50, height: 50, url: card['img'])
                : MyCircleDefaulUserIcon(
                    name: card['nameRu'] ?? '',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 20,),
                  Expanded( child: Align(alignment: Alignment.centerLeft, child: MyTitleText(text: card['nameRu']??'',size: 18),)),
                  MyCheckBox(isChecked: isChecked)
          ],

        ));
  }
}
