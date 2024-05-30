import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/widgets/inputs/input_outline.dart';
import 'package:trener_app/widgets/modal_wind.dart';
import 'package:trener_app/widgets/service/training_pattern/exercises.dart';
import 'package:trener_app/widgets/service/training_pattern/final_exercises.dart';
import 'package:trener_app/widgets/shanckbar.dart';

class TrainingPatternAddName extends StatelessWidget {
  TrainingPatternAddName({super.key});
  TextEditingController controller = TextEditingController();
  MyExercisesController myExercisesController = Get.put(MyExercisesController());


  @override
  Widget build(BuildContext context) {
    controller.text = myExercisesController.patternName;
    return MyModalWind(
      nextActionCallback: (){
        if(controller.text.length>0){
          myExercisesController.setPatternName(controller.text);
          Get.back();
          showModalBottomSheet(
            isScrollControlled: true,
            context: context, 
            builder: (_)=>TrainingPatternFinalExercises());
        }else{
          GetMySnackBar(description: 'Введите название шаблона!');
        }
      },
      nextActionText: 'Далее',
      height: 90, 
      headerType: 3, 
      nextActionColor: AppColors.blueText,
      widget: Column(children: [
       MyInputOutline(controller: controller, label: 'Введите название',hintText: 'Название шаблона',),

    ],), 
    title: 'Добавить шаблон');
  }
}