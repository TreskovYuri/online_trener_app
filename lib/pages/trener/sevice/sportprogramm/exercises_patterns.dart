import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/getx/MySportProgrammController.dart';
import 'package:trener_app/http/testUtills.dart';
import 'package:trener_app/pages/trener/sevice/sportprogramm/add_sportprogramm.dart';
import 'package:trener_app/widgets/app_bar/app_bar_titile_one_action.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';
import 'package:trener_app/widgets/shanckbar.dart';
import 'package:trener_app/widgets/text/title.dart';

class SportprogrammExercisesPatterns extends StatefulWidget {
  SportprogrammExercisesPatterns({super.key});

  @override
  State<SportprogrammExercisesPatterns> createState() =>
      _SportprogrammExercisesPatternsState();
}

class _SportprogrammExercisesPatternsState
    extends State<SportprogrammExercisesPatterns> {
  int currentPattern = 0;
  final MyExercisesController myExercisesController =
      Get.put(MyExercisesController());
  final MySportProgrammController mySportProgrammController =
      Get.put(MySportProgrammController());

  @override
  void initState() {
    GetTests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height / 100;

    return SafeArea(
      child: Scaffold(
        appBar: AppBarTitleOneAction(
          title: 'Выберите упражнение',
          callback: () {
            // if (currentPattern != 0) {
            //   mySportProgrammController.setTestsList({
            //     ...myExercisesController.exercises
            //         .firstWhere((element) => element['id'] == currentPattern),
            //     'date': mySportProgrammController.currentDate,
            //     'type': 'тест'
            //   });
            //   Get.to(const AddSportProgrammPage());
            // } else {
            //   GetMySnackBar(description: 'Необходимо выбрать шаблон!');
            // }
            Get.to(const AddSportProgrammPage());
          },
          height: 13 * vh,
        ),
        body: Container(
          height: 87 * vh,
          child: Center(
              child: Obx(
            () => ListView(
              children: [
                ...myExercisesController.exercises.map((e) => _Card(
                    map: e,
                    flag: e['id'] == currentPattern ? true : false,
                    callback: () => setState(() {
                          currentPattern = e['id'];
                        })))
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  _Card(
      {super.key,
      required this.map,
      required this.flag,
      required this.callback});
  Map<String, dynamic> map;
  bool flag;
  Function callback;

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;

    return MyCardButton(
        callback: callback,
        widget: Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTitleText(text: map['nameRu'], size: 17),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    if (flag == true) SvgPicture.asset('assets/img/blue_ok.svg')
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
