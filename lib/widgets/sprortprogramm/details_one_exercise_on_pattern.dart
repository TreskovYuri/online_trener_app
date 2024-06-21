import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trener_app/constants/colors.dart';
import 'package:trener_app/widgets/MyVideoPlayer.dart';
import 'package:trener_app/widgets/modal_wind.dart';
import 'package:trener_app/widgets/text/description.dart';
import 'package:trener_app/widgets/text/title.dart';

class DetailsOneExerciseOnPattern extends StatelessWidget {
  DetailsOneExerciseOnPattern({super.key, required this.exercise});
  Map<String, dynamic> exercise;

  @override
  Widget build(BuildContext context) {
    return MyModalWind(
        height: 90,
        widget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (exercise['video'] != '')
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: MyVideoPlayer(
                    url: '${dotenv.env['STATIC_URL']}/${exercise['video']}',
                  ),
                ),
              Row(
                children: [MyTitleText(text: 'Техника выполнения', size: 22)],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: MyDescriptionText(
                          text: exercise['descriptionRu'],
                          size: 16,
                          color: AppColors.blackThemeTextOpacity3,
                          maxLines: 150))
                ],
              )
            ],
          ),
        ),
        title: exercise['nameRu']);
  }
}
