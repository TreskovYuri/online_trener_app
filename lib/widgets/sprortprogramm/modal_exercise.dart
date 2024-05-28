import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/getx/MySportProgrammController.dart';
import 'package:trener_app/http/exerciseUtills.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/pages/trener/sevice/sportprogramm/add_sportprogramm.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';
import 'package:trener_app/widgets/circle_network_Img.dart';
import 'package:trener_app/widgets/modal_wind.dart';
import 'package:trener_app/widgets/text/title.dart';

class AddSportprogrammModalExercise extends StatefulWidget {
  AddSportprogrammModalExercise({super.key, required this.patternId});
  int patternId;

  @override
  State<AddSportprogrammModalExercise> createState() =>
      _AddSportprogrammModalExerciseState();
}

class _AddSportprogrammModalExerciseState
    extends State<AddSportprogrammModalExercise> {
  @override
  void initState() {
    GetExercise();
    GetExerciseBelongPatterns(widget.patternId);
    super.initState();
  }

  MyExercisesController myExercisesController =
      Get.put(MyExercisesController());
  final MySportProgrammController mySportProgrammController =
      Get.put(MySportProgrammController());

  @override
  Widget build(BuildContext context) {
    return MyModalWind(
        button: true,
        ButtonCallback: () {
          myExercisesController.exercisesBelongPattern
              .where((element) => element['programmId'] == widget.patternId)
              .forEach((e) {
            mySportProgrammController.setExercisesList({
              ...myExercisesController.exercises
                  .firstWhere((element) => element['id'] == e['exerciseId']),
              'date': mySportProgrammController.currentDate,
              'type': 'упражнение'
            });
          });
          Get.to(const AddSportProgrammPage());
        },
        height: 70,
        title: 'Упражнения',
        widget: Obx(
          () => Column(children: [
            ...myExercisesController.exercisesBelongPattern
                .where((element) => element['programmId'] == widget.patternId)
                .map(
                  (e) => _Card(
                    card: myExercisesController.exercises.firstWhere(
                        (element) => element['id'] == e['exerciseId']),
                    callback: () {},
                  ),
                )
          ]),
        ));
  }
}

class _Card extends StatelessWidget {
  _Card({super.key, required this.card, required this.callback});
  Map<String, dynamic> card;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return MyCardButton(
        callback: callback,
        widget: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (card['img'] != '')
              MyCircleNetworkImg(
                width: 45,
                height: 45,
                url: card['img'],
              ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: MyTitleText(
              text: card['nameRu'],
              size: 18,
            )),
            IconButton(
                onPressed: callback,
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 13,
                  color: AppColors.blackThemeWhiteArrow,
                ))
          ],
        ));
  }
}
