import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/widgets/modal_wind.dart';
import 'package:trener_app/widgets/text/title.dart';

class AddSportprogrammModalExercise extends StatefulWidget {
  AddSportprogrammModalExercise({super.key, required this.patternId});
  int patternId;

  @override
  State<AddSportprogrammModalExercise> createState() => _AddSportprogrammModalExerciseState();
}

class _AddSportprogrammModalExerciseState extends State<AddSportprogrammModalExercise> {
  MyExercisesController myExercisesController = Get.put(MyExercisesController());
  @override
  Widget build(BuildContext context) {
    return MyModalWind(height: 70,title: 'Упражнения', widget:Column(
      children: [
      ],
    ));
  }
}