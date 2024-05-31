import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/http/exerciseUtills.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/models/constants/lists.dart';
import 'package:trener_app/widgets/cards/exercise_card_to_pattern.dart';
import 'package:trener_app/widgets/modal_wind.dart';
import 'package:trener_app/widgets/service/training_pattern/exercises.dart';
import 'package:trener_app/widgets/service/training_pattern/modal_current_type.dart';
import 'dart:convert';

class TrainingPatternFinalExercises extends StatelessWidget {
  TrainingPatternFinalExercises({super.key});
  MyExercisesController myExercisesController =
      Get.put(MyExercisesController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => MyModalWind(
        buttonEnabled: myExercisesController.finalExercisesOnPattern.length > 0,
        nextActionCallback: () => showCupertinoModalPopup(
            context: context,
            builder: (_) => MyModalCurrentType(
                  categoryList: AppLists.ExercisesTypes,
                  callback: (type) {
                    myExercisesController.setCurrentStage(type);
                    Get.back();
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (_) => AddTrainingPatternsExercises());
                  },
                )),
                ButtonCallback: () {
                  AddExercisePattern({
                    'name': jsonEncode(myExercisesController.patternName),
                    'exersices':jsonEncode(myExercisesController.finalExercisesOnPattern),
                    'tests':jsonEncode([])
                  });
                  myExercisesController.clearAll();
                },
        buttonText: 'Сохранить',
        button: true,
        prevActionCallback: () => Get.back(),
        headerType: 3,
        nextActionColor: AppColors.blueText,
        height: 90,
        widget: Column(
          children: [
            ...myExercisesController.finalExercisesOnPattern
                .map((el) => MyExerciseCardToPattern(card: el, callback: () {}))
          ],
        ),
        title: 'Упражнения'));
  }
}
