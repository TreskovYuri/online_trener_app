import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trener_app/getx/MyFixController.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/http/fixUtills.dart';
import 'package:trener_app/constants/colors.dart';
import 'package:trener_app/service/helpers/IntMonthToStringRus.dart';
import 'package:trener_app/widgets/inputs/input_inline_fill.dart';
import 'package:trener_app/widgets/modal_wind.dart';

class FixTestModalWind extends StatefulWidget {
  FixTestModalWind({super.key, required this.test, required this.belong});
  Map<String, dynamic> test;
  Map<String, dynamic> belong;

  @override
  State<FixTestModalWind> createState() => _FixTestModalWindState();
}

class _FixTestModalWindState extends State<FixTestModalWind> {
  TextEditingController dateController = TextEditingController();

  TextEditingController resultController = TextEditingController();

  MyFixController myFixController = Get.put(MyFixController());
  MyUserController myUserController = Get.put(MyUserController());

  @override
  Widget build(BuildContext context) {
    final bool fix = myFixController.sportsmanTestsFix.any((el) =>
        el['date'] == widget.belong['date'] &&
        el['programmId'] == widget.belong['programmId']);
    final currentDate = DateTime.now();
    final formattedDate =
        DateFormat.Hm(Localizations.localeOf(context).languageCode)
            .format(currentDate);
    dateController.text = DateFormat(
            'd ${IntMonthToStringRus(num: DateTime.now().month)} ${DateTime.now().year}г. ${formattedDate}')
        .format(DateTime.now());

    return MyModalWind(
        prevActionCallback: () => Get.back(),
        nextActionColor: AppColors.blueText,
        nextActionText: 'Готово',
        nextActionCallback: () {
          if (!fix) {
            SetTestFixForSportsman({
              'testId': widget.test['id'].toString(),
              'programmId': widget.belong['programmId'].toString(),
              'result': resultController.text,
              'date': widget.belong['date'],
              'trenerId': widget.belong['userId'].toString(),
              'sportsmanId': myUserController.user['id'].toString()
            });
          }
          Get.back();
        },
        headerType: 3,
        height: 70,
        widget: Obx(() {
          final bool fixed = myFixController.sportsmanTestsFix.any((el) =>
              el['date'] == widget.belong['date'] &&
              el['programmId'] == widget.belong['programmId']);
          if (fixed) {
            resultController.text = myFixController.sportsmanTestsFix
                .firstWhere((el) =>
                    el['date'] == widget.belong['date'] &&
                    el['programmId'] == widget.belong['programmId'])['result']
                .toString();
          }
          return SingleChildScrollView(
            child: Column(
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
                  enabled: !fixed,
                  labelText: '${widget.test['name']} / ${widget.test['type']}',
                  controller: resultController,
                  hintText: widget.test['item'],
                ),
              ],
            ),
          );
        }),
        title: widget.test['name']);
  }
}
