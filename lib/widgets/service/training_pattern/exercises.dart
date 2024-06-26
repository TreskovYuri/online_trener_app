
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/constants/colors.dart';
import 'package:trener_app/widgets/cards/exercise_card.dart';
import 'package:trener_app/widgets/inputs/search.dart';
import 'package:trener_app/widgets/modal_wind.dart';
import 'package:trener_app/widgets/service/training_pattern/add_sets.dart';

class AddTrainingPatternsExercises extends StatefulWidget {
  AddTrainingPatternsExercises({super.key});

  @override
  State<AddTrainingPatternsExercises> createState() => _AddTrainingPatternsExercisesState();
}

class _AddTrainingPatternsExercisesState extends State<AddTrainingPatternsExercises> {
  TextEditingController serachController = TextEditingController();

  MyExercisesController myExercisesController = Get.put(MyExercisesController());

  Map<String, dynamic> currentExercise = {};


  @override
  Widget build(BuildContext context) {
    return MyModalWind(
      headerType: 3,
      nextActionCallback: ()=>showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_)=>TrainingPatternAddSets()),
      prevActionCallback:()=> Get.back(),
      nextActionColor: AppColors.blueText,
      nextActionText: 'Добавить',
      height: 90, 
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            MySearchInput(controller: serachController,),
            const SizedBox(height: 30,),
            ...myExercisesController.exercises.map((e)=> MyExerciseCard(
              callback:()=>setState(() {
                myExercisesController.setCurrentExercise(e);
                currentExercise = e;}),
              card: e, 
              isChecked: currentExercise['id'] == e['id'],)),
           
          ],
        ),
      ), 
      title: 'Упражнения');
  }
}