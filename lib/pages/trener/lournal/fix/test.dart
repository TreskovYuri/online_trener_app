import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trener_app/getx/MyFixController.dart';
import 'package:trener_app/http/fixUtills.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/utills/IntMonthToStringRus.dart';
import 'package:trener_app/widgets/inputs/input_inline_fill.dart';
import 'package:trener_app/widgets/modal_wind.dart';

class FixTestModalWindTrener extends StatelessWidget {
  FixTestModalWindTrener(
      {super.key,
      required this.test,
      required this.belong,
      required this.sportsmanId});
  Map<String, dynamic> test;
  TextEditingController dateController = TextEditingController();
  TextEditingController resultController = TextEditingController();
  MyFixController myFixController = Get.put(MyFixController());
  int sportsmanId;

  Map<String, dynamic> belong;

  @override
  Widget build(BuildContext context) {
    print(myFixController.sportsmanTestsFix);
    final bool fix = myFixController.sportsmanTestsFix.any((el) =>
        el['date'] == belong['date'] &&
        el['programmId'] == belong['programmId'] &&
        el['sportsmanId'] == sportsmanId);
    final currentDate = DateTime.now();
    final formattedDate =
        DateFormat.Hm(Localizations.localeOf(context).languageCode)
            .format(currentDate);
    if (fix)
      dateController.text = DateFormat(
              'd ${IntMonthToStringRus(DateTime.now().month)} ${DateTime.now().year}г. ${formattedDate}')
          .format(DateTime.now());

    return MyModalWind(
        prevActionCallback: () => Get.back(),
        nextActionColor: AppColors.blueText,
        nextActionText: 'Готово',
        nextActionCallback: () {
          if (!fix) {
            SetTestFixForSportsman({
              'testId': test['id'].toString(),
              'programmId': belong['programmId'].toString(),
              'result': resultController.text,
              'date': belong['date']
            });
          }
          Get.back();
        },
        headerType: 3,
        height: 50,
        widget: Obx(() {
          final bool fixed = myFixController.sportsmanTestsFix.any((el) =>
              el['date'] == belong['date'] &&
              el['programmId'] == belong['programmId'] &&
              el['sportsmanId'] == sportsmanId);
          if (fixed) {
            resultController.text = myFixController.sportsmanTestsFix
                .firstWhere((el) =>
                    el['date'] == belong['date'] &&
                    el['programmId'] == belong['programmId'])['result']
                .toString();
          }
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              MyInlineFillInput(
                fixed: false,
                enabled: false,
                labelText: 'Дата',
                controller: dateController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyInlineFillInput(
                fixed: fixed,
                enabled: false,
                labelText: '${test['name']} / ${test['type']}',
                controller: resultController,
                hintText: test['item'],
              ),
            ],
          );
        }),
        title: test['name']);
  }
}
