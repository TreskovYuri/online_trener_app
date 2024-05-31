import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/widgets/buttons/blue_outline_color_button.dart';
import 'package:trener_app/widgets/inputs/input_inline_fill.dart';
import 'package:trener_app/widgets/modal_wind.dart';
import 'package:trener_app/widgets/text/description.dart';
import 'package:trener_app/widgets/text/title.dart';

class TrainingPatternAddSets extends StatefulWidget {
  const TrainingPatternAddSets({super.key});

  @override
  State<TrainingPatternAddSets> createState() => _TrainingPatternAddSetsState();
}

class _TrainingPatternAddSetsState extends State<TrainingPatternAddSets> {
  int setCount = 1;
  MyExercisesController myExercisesController =
      Get.put(MyExercisesController());
  TextEditingController timeController = TextEditingController();

  void deleteSet() {
    myExercisesController.setCurrentExerciseSets(
        myExercisesController.CurrentExerciseSets.where(
            (el) => el['set'] != setCount).toList());
    if (setCount > 0) {
      setState(() {
        setCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> exercise = myExercisesController.CurrentExercise;
    final vh = MediaQuery.of(context).size.height / 100;
    return Obx(()=>MyModalWind(
        button: true,
        ButtonCallback: (){
          print(myExercisesController.CurrentExerciseSets);
          myExercisesController.setFinalExercisesOnPattern({
          'sets':myExercisesController.CurrentExerciseSets,
          'time':timeController.text,
          'exersiceId': exercise['id']
        });
        
        Get.back();
        Get.back();
        // myExercisesController.clearSets();
        },
        buttonText: 'Сохранить',
        height: 90,
        widget: Column(children: [
          SetHeader(exercise: exercise),
          Column(
            children: [
              ...List.generate(setCount, (index) => index).map((i) => SetCard(
                    exercise: exercise,
                    set: i + 1,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: MyBlueOutlineColorButton(
              buttonText: 'Добавить сет',
              buttonCallBack: () => setState(() {
                setCount++;
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: MyBlueOutlineColorButton(
              actionType: 'minus',
              buttonText: 'Удалить сет',
              buttonCallBack: deleteSet,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [MyDescriptionText(text: 'Время отдыха',size: 12, color: AppColors.blackThemeTextOpacity1)],),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: MyInlineFillInput(
              hintText: '40',
              controller: timeController, 
              callback: (){}),
            ),
          const SizedBox(
            height: 50,
          )
        ]),
        title: myExercisesController.CurrentExercise['nameRu']));
  }
}


class SetHeader extends StatelessWidget {
  SetHeader({
    super.key,
    required this.exercise
    });
  Map<String,dynamic> exercise;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: MyDescriptionText(
                        text: 'Cет',
                        size: 12,
                        color: AppColors.blackThemeTextOpacity1)),
                Expanded(
                    flex: 2,
                    child: MyDescriptionText(
                        text: exercise['pocazatel1Name'],
                        size: 12,
                        color: AppColors.blackThemeTextOpacity1)),
                if (exercise['pocazatel2Name'] != '')
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: MyDescriptionText(
                            text: exercise['pocazatel2Name'],
                            size: 12,
                            color: AppColors.blackThemeTextOpacity1),
                      )),
                if (exercise['pocazatel3Name'] != '')
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: MyDescriptionText(
                            text: exercise['pocazatel3Name'],
                            size: 12,
                            color: AppColors.blackThemeTextOpacity1),
                      )),
                if (exercise['pocazatel4Name'] != '')
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: MyDescriptionText(
                            text: exercise['pocazatel4Name'],
                            size: 12,
                            color: AppColors.blackThemeTextOpacity1),
                      )),
                if (exercise['pocazatel5Name'] != '')
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: MyDescriptionText(
                            text: exercise['pocazatel5Name'],
                            size: 12,
                            color: AppColors.blackThemeTextOpacity1),
                      )),
              ],
            ),
          );
  }
}

class SetCard extends StatefulWidget {
  SetCard({super.key, required this.exercise, required this.set});
  Map<String, dynamic> exercise;
  int set;

  @override
  State<SetCard> createState() => _SetCardState();
}

class _SetCardState extends State<SetCard> {
  TextEditingController pokazatel1OtController = TextEditingController();
  TextEditingController pokazatel1DoController = TextEditingController();
  TextEditingController pokazatel2Controller = TextEditingController();
  TextEditingController pokazatel3Controller = TextEditingController();
  TextEditingController pokazatel4Controller = TextEditingController();
  TextEditingController pokazatel5Controller = TextEditingController();
  MyExercisesController myExercisesController =
      Get.put(MyExercisesController());

  void changedHandler() {
    myExercisesController.setCurrentExerciseSets([
      ...myExercisesController.CurrentExerciseSets.where(
          (el) => el['set'] != widget.set).toList(),
      {
        'set': widget.set,
        'diapazonOt': pokazatel1OtController.text,
        'diapazonDo': pokazatel1DoController.text,
        if (widget.exercise['pocazatel2Name'] != '')
          'pokazatel2': pokazatel2Controller.text,
        if (widget.exercise['pocazatel3Name'] != '')
          'pokazatel3': pokazatel3Controller.text,
        if (widget.exercise['pocazatel4Name'] != '')
          'pokazatel4': pokazatel4Controller.text,
        if (widget.exercise['pocazatel5Name'] != '')
          'pokazatel5': pokazatel5Controller.text,
      }
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.blackThemeInputInlineBacground,
                    borderRadius: BorderRadiusDirectional.circular(7)),
                child: MyTitleText(text: widget.set.toString(), size: 20),
              )),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: MyInlineFillInput(
                    controller: pokazatel1OtController,
                    callback: () => changedHandler(),
                  )),
                  MyTitleText(text: '-'),
                  Expanded(
                      child: MyInlineFillInput(
                    controller: pokazatel1DoController,
                    callback: () => changedHandler(),
                  )),
                ],
              )),
          if (widget.exercise['pocazatel2Name'] != '')
            Expanded(
                flex: 1,
                child: MyInlineFillInput(
                  controller: pokazatel2Controller,
                  callback: () => changedHandler(),
                )),
          if (widget.exercise['pocazatel3Name'] != '')
            Expanded(
                flex: 1,
                child: MyInlineFillInput(
                  controller: pokazatel3Controller,
                  callback: () => changedHandler(),
                )),
          if (widget.exercise['pocazatel4Name'] != '')
            Expanded(
                flex: 1,
                child: MyInlineFillInput(
                  controller: pokazatel4Controller,
                  callback: () => changedHandler(),
                )),
          if (widget.exercise['pocazatel5Name'] != '')
            Expanded(
                flex: 1,
                child: MyInlineFillInput(
                  controller: pokazatel5Controller,
                  callback: () => changedHandler(),
                )),
        ],
      ),
    );
  }
}
