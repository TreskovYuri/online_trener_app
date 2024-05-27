import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyTestsController.dart';
import 'package:trener_app/http/testUtills.dart';
import 'package:trener_app/widgets/app_bar/app_bar_titile_one_action.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';
import 'package:trener_app/widgets/text/counter.dart';
import 'package:trener_app/widgets/text/title.dart';

class SportprogrammTestsPatterns extends StatefulWidget {
  SportprogrammTestsPatterns({super.key});

  @override
  State<SportprogrammTestsPatterns> createState() =>
      _SportprogrammTestsPatternsState();
}

class _SportprogrammTestsPatternsState
    extends State<SportprogrammTestsPatterns> {
  int currentPattern = 0;
  final MyTestsController myTestsController =
      Get.put(MyTestsController());

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
          title: 'Выберите тест',
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
                ...myTestsController.tests.map((e) => _Card(
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
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTitleText(text: map['name'], size: 17),
                   
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
