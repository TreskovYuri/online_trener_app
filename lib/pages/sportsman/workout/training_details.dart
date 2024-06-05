import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyDateController.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/getx/MySportProgrammController.dart';
import 'package:trener_app/http/sportpogrammUtills.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/pages/sportsman/planner/fix/programm.dart';
import 'package:trener_app/widgets/buttons/gradient_button.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';
import 'package:trener_app/widgets/cards/burger_modal_wind.dart';
import 'package:trener_app/widgets/circle_default_user_icon.dart';
import 'package:trener_app/widgets/circle_network_Img.dart';
import 'package:trener_app/widgets/muscle_groups_image.dart';
import 'package:trener_app/widgets/placeholder_image.dart';
import 'package:trener_app/widgets/sprortprogramm/details_one_exercise_on_pattern.dart';
import 'package:trener_app/widgets/text/description.dart';

class SportsmanTrainingDetails extends StatefulWidget {
  SportsmanTrainingDetails({super.key, required this.traininData});
  List traininData;

  @override
  State<SportsmanTrainingDetails> createState() => _SportsmanTrainingDetailsState();
}

class _SportsmanTrainingDetailsState extends State<SportsmanTrainingDetails> {
  MySportProgrammController mySportProgrammController =
      Get.put(MySportProgrammController());

  MyExercisesController myExercisesController =
      Get.put(MyExercisesController());
  MyDateController myDateController =
      Get.put(MyDateController());
      @override
  void initState() {
    GetFixSportProgramm(widget.traininData[0]['programmId']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    Map<String, dynamic> sportprogramm = mySportProgrammController
        .sportprogramms
        .firstWhere((el) => el['id'] == widget.traininData[0]['programmId']);
    Map<String, dynamic> exercise = myExercisesController.exercises
        .firstWhere((el) => el['id'] == widget.traininData[0]['exerciseId']);
    List<String> stage = [];
    List<String> muscleGroups = [];

    List<Map<String, dynamic>> execisesList = [];

    if(myExercisesController.exercises.length>0){
      execisesList = widget.traininData
        .map((el) => myExercisesController.exercises
            .firstWhere((element) => element['id'] == el['exerciseId'])).toList();
    }
        ;
    final vh = MediaQuery.of(context).size.height / 100;
    execisesList.forEach((el) {
      el['equipment'].forEach((e) => {
            if (!stage.contains(e)) {stage.add(e)}
          });
      el['musclegroups'].forEach((e) => {
            if (!muscleGroups.contains(e)) {muscleGroups.add(e)}
          });
    });
    return Scaffold(
        body: ListView(
      children: [
        _ImageBlock(
            exercise: exercise,
            sportprogramm: sportprogramm,
            stage: stage,
            vh: vh),
        ...execisesList.map((e) => _ExeciseCard(
              exercise: e,
              sets: jsonDecode(widget.traininData.firstWhere(
                  (element) => element['exerciseId'] == e['id'])?['sets']),
            )),
        MyBurgerModalWind(
          title: 'Описние',
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyDescriptionText(text: sportprogramm['description'],maxLines: 150,color: AppColors.blackThemeTextOpacity3),
          ),
        ),
        MyBurgerModalWind(
          title: 'Группы мышц',
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: MyscleGroupsImage(vh: vh, muscleGroups: muscleGroups),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child:Obx((){
            bool fixed = mySportProgrammController.fixList.any((el) => el['date'] == myDateController.date);
            return !fixed? MyGradientButton(
            callback: () =>Get.to(SportsmanSportprogrammFixResult(
              trainingData: widget.traininData,
              execisesList: execisesList,
              sportprogramm: sportprogramm,
            )),
            text: 'Заполнить',
          ):const SizedBox.shrink();
          })
        )
      ],
    ));
  }
}

class _ImageBlock extends StatelessWidget {
  _ImageBlock(
      {super.key,
      required this.exercise,
      required this.sportprogramm,
      required this.stage,
      required this.vh});
  List<String> stage;
  Map<String, dynamic> exercise;
  double vh;
  Map<String, dynamic> sportprogramm;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50 * vh,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft:
                  Radius.circular(6), // Радиус закругления нижнего левого угла
              bottomRight:
                  Radius.circular(6), // Радиус закругления нижнего правого угла
            ),
            child:exercise['img']!=''? Image.network(
              '${dotenv.env['STATIC_URL']}/${exercise['img']}',
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Container(
                  width: double.infinity,
                  color: Colors
                      .grey, // You can set any color or image as a placeholder
                  child: const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 50.0, // Adjust the size as needed
                  ),
                );
              },
            ):const MyPlaceHolderImage(),
          ),
        ),
        Positioned(
          top: 7 * vh,
          left: 15,
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(35, 94, 94, 94),
                borderRadius: BorderRadius.circular(25)),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded), // Иконка
              iconSize: 20,
              color: const Color.fromARGB(202, 255, 255, 255),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Container(
            // Цвет подложки текста
            padding: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 16), // Отступы текста от краев
            child: Text(
              sportprogramm['name'] ?? '',
              style: const TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 20,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: SizedBox(
              width: double.infinity,
              height: 5 * vh,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stage.length,
                itemBuilder: (context, index) {
                  String st = stage[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppColors.blackThemeButtonForeground,
                        backgroundColor: Color.fromARGB(164, 53, 53, 53),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Скругление углов
                        ),
                      ),
                      child: Text(
                        st,
                        style: const TextStyle(
                          color: Color.fromARGB(178, 255, 255, 255),
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )),
      ],
    );
  }
}

class _ExeciseCard extends StatelessWidget {
  _ExeciseCard({super.key, required this.exercise, required this.sets});
  Map<String, dynamic> exercise;
  List sets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: MyCardButton(
          callback: () =>showModalBottomSheet(isScrollControlled: true, context: context, builder: (_)=>DetailsOneExerciseOnPattern(exercise: exercise,)),
          widget: Row(
            children: [
              exercise['img'] != ''
                  ? MyCircleNetworkImg(
                      width: 40, height: 40, url: exercise['img'])
                  : MyCircleDefaulUserIcon(name: exercise['nameRu']),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyDescriptionText(text: exercise['nameRu']),
                  MyDescriptionText(
                      size: 13,
                      color: AppColors.blackThemeTextOpacity3,
                      text:
                          '${sets.length}x${sets[0]['pokazatel2'] ?? 15} • ${sets[0]['diapazonOt']}-${sets[0]['diapazonDo']} ${exercise['pocazatel1Type']}')
                ],
              )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.blackThemeTextOpacity3,
                    size: 18,
                  ))
            ],
          )),
    );
  }
}
