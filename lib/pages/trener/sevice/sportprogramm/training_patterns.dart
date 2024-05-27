import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyPatternsController.dart';
import 'package:trener_app/http/patternsUtills.dart';
import 'package:trener_app/widgets/app_bar/app_bar_titile_one_action.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';
import 'package:trener_app/widgets/text/counter.dart';
import 'package:trener_app/widgets/text/title.dart';

class SportprogrammTrainingPatterns extends StatefulWidget {
  SportprogrammTrainingPatterns({super.key});

  @override
  State<SportprogrammTrainingPatterns> createState() =>
      _SportprogrammTrainingPatternsState();
}

class _SportprogrammTrainingPatternsState
    extends State<SportprogrammTrainingPatterns> {
  int currentPattern = 0;
  final MyPatternsController myPatternsController =
      Get.put(MyPatternsController());

  @override
  void initState() {
    GetPatterns();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height / 100;

    return SafeArea(
      child: Scaffold(
        appBar: AppBarTitleOneAction(
          title: 'Выберите шаблон',
          callback: () {
            Get.back();
          },
          height: 13 * vh,
        ),
        body: Container(
          height: 87 * vh,
          child: Center(
              child: Obx(
            () => ListView(
              children: [
                ...myPatternsController.exercisePatterns.map((e) => _Card(
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

    return MyCardButton(callback: callback, widget: Container(
      margin: const EdgeInsets.all(10),
      child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTitleText(text: map['name'], size: 17),
                    const SizedBox(
                      height: 20,
                    ),
                    MyCounter(
                      count: map['count'],
                      height: 25,
                      width: 40 * vw,
                      size: 15,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  if (flag == true) SvgPicture.asset('assets/img/blue_ok.svg')
                ],
              )
            ],
          ),
    ));
  }
}
