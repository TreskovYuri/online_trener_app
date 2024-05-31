import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trener_app/http/fixUtills.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/utills/IntMonthToStringRus.dart';
import 'package:trener_app/widgets/inputs/input_inline_fill.dart';
import 'package:trener_app/widgets/modal_wind.dart';

class FixTestModalWind extends StatelessWidget {
  FixTestModalWind({
    super.key, 
    required this.test,
    required this.belong
    });
  Map<String, dynamic> test;
  TextEditingController dateController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  Map<String, dynamic> belong;

  @override
  Widget build(BuildContext context) {
    print(belong);
    final currentDate = DateTime.now();
    final formattedDate =
        DateFormat.Hm(Localizations.localeOf(context).languageCode).format(currentDate);
    dateController.text = DateFormat('d ${IntMonthToStringRus(DateTime.now().month)} ${DateTime.now().year}г. ${formattedDate}').format(DateTime.now());


    return MyModalWind(
      prevActionCallback:()=> Get.back(),
        nextActionColor: AppColors.blueText,
        nextActionText: 'Готово',
        nextActionCallback: (){
          SetTestFixForSportsman({
            'testId':test['id'],
            'programmId':belong['programmId'],
            'result':resultController.text
          });
          Get.back();
        },
        headerType: 3,
        height: 50,
        widget: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            MyInlineFillInput(
              enabled: false,
              labelText: 'Дата',
              controller: dateController,
            ),
            const SizedBox(height: 20,),
            MyInlineFillInput(
              labelText: '${test['name']} / ${test['type']}',
              controller: resultController,
              hintText: test['item'],
            ),
          ],
        ),
        title: test['name']);
  }
}
