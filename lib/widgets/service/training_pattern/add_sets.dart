
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/widgets/modal_wind.dart';

class TrainingPatternAddSets extends StatefulWidget {
  const TrainingPatternAddSets({super.key});

  @override
  State<TrainingPatternAddSets> createState() => _TrainingPatternAddSetsState();
}

class _TrainingPatternAddSetsState extends State<TrainingPatternAddSets> {
  MyExercisesController myExercisesController = Get.put(MyExercisesController());
  @override
  Widget build(BuildContext context) {
    return MyModalWind(
      button: true,
      buttonText: 'Сохранить',
      height: 90, 
      widget: Column(), 
      title: myExercisesController.CurrentExercise['nameRu']);
  }
}