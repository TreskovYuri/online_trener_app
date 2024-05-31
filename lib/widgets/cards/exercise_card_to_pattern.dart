import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';
import 'package:trener_app/widgets/circle_default_user_icon.dart';
import 'package:trener_app/widgets/circle_network_Img.dart';
import 'package:trener_app/widgets/text/title.dart';

class MyExerciseCardToPattern extends StatelessWidget {
  MyExerciseCardToPattern({
    super.key, 
    required this.card,
    required this.callback,
    });
  Map<String, dynamic> card;
  final VoidCallback callback;
  MyExercisesController myExercisesController = Get.put(MyExercisesController()); 

  @override
  Widget build(BuildContext context) {
    final exercise = myExercisesController.exercises.firstWhere((el) => el['id'] == card['exersiceId']);
      return MyCardButton(
        callback: callback,
        widget: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            exercise['img'] != null && exercise['img'] != ''
                ? MyCircleNetworkImg(width: 50, height: 50, url: exercise['img'])
                : MyCircleDefaulUserIcon(
                    name: exercise['nameRu'] ?? '',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 20,),
                  Expanded( child: Align(alignment: Alignment.centerLeft, child: MyTitleText(text: exercise['nameRu']??'',size: 18),)),
          ],

        ));
  }
}
