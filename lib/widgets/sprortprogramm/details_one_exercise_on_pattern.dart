import 'package:flutter/material.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/widgets/modal_wind.dart';
import 'package:trener_app/widgets/text/description.dart';
import 'package:trener_app/widgets/text/title.dart';
import 'package:trener_app/widgets/youtube.dart';

class DetailsOneExerciseOnPattern extends StatelessWidget {
  DetailsOneExerciseOnPattern({super.key,required this.exercise});
  Map<String, dynamic> exercise;

  @override
  Widget build(BuildContext context) {
    return MyModalWind(height: 80, widget: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if(exercise['link']!='')Padding(padding: const EdgeInsets.symmetric(vertical: 10),child: Youtube(url: exercise['link']),),
         Row(children: [ MyTitleText(text: 'Техника выполнения',size: 22)],),
         const SizedBox(height: 20,),
         Row(children: [ Expanded(child: MyDescriptionText(text:exercise['descriptionRu'],size: 16, color: AppColors.blackThemeTextOpacity3,maxLines: 150))],)
        ],
      ),
    ), title: exercise['nameRu']);
  }
}