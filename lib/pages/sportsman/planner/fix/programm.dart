import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyDateController.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/getx/MySportProgrammController.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/http/exerciseUtills.dart';
import 'package:trener_app/http/sportpogrammUtills.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/models/constants/images.dart';
import 'package:trener_app/utills/sokrashatel.dart';
import 'package:trener_app/widgets/app_bar/gradient_appbar.dart';
import 'package:trener_app/widgets/buttons/gradient_button.dart';
import 'package:trener_app/widgets/circle_default_user_icon.dart';
import 'package:trener_app/widgets/circle_network_Img.dart';
import 'package:trener_app/widgets/inputs/input_inline_fill.dart';
import 'package:trener_app/widgets/shanckbar.dart';
import 'package:trener_app/widgets/text/description.dart';
import 'package:trener_app/widgets/text/title.dart';

class SportsmanSportprogrammFixResult extends StatefulWidget {
  SportsmanSportprogrammFixResult(
      {super.key,
      required this.sportprogramm,
      required this.execisesList,
      required this.trainingData});
  Map<String, dynamic> sportprogramm;
  List<Map<String, dynamic>> execisesList;
  List<dynamic> trainingData;

  @override
  State<SportsmanSportprogrammFixResult> createState() =>
      _SportsmanSportprogrammFixResultState();
}

class _SportsmanSportprogrammFixResultState
    extends State<SportsmanSportprogrammFixResult> {
  final mySportProgrammController = Get.put(MySportProgrammController());
  final myUserConroller = Get.put(MyUserController());
  @override
  void initState() {
    List<Map<String, dynamic>> finalList = [];
    widget.trainingData.forEach((element) {
      List sets = jsonDecode(element['sets']);
      List<Map<String, dynamic>> finalSets = [];

      sets.forEach((el) {
        Map<String, dynamic> set = {};
        if (el['set'] != null && el['set'] != '') {
          set['set'] = el['set'];
        }
        if (el['diapazonOt'] != null && el['diapazonOt'] != '') {
          set['diapazonOt'] = el['diapazonOt'];
        }
        if (el['diapazonDo'] != null && el['diapazonDo'] != '') {
          set['diapazonDo'] = el['diapazonDo'];
        }
        if (el['pokazatel2'] != null && el['pokazatel2'] != '') {
          set['pokazatel2'] = el['pokazatel2'];
        }
        if (el['pokazatel3'] != null && el['pokazatel3'] != '') {
          set['pokazatel3'] = el['pokazatel3'];
        }
        if (el['pokazatel4'] != null && el['pokazatel4'] != '') {
          set['pokazatel4'] = el['pokazatel4'];
        }
        if (el['pokazatel5'] != null && el['pokazatel5'] != '') {
          set['pokazatel5'] = el['pokazatel5'];
        }
        finalSets.add(set);
      });
      finalList.add({
        'setId': element['id'],
        'programmId': element['programmId'],
        'exerciseId': element['exerciseId'],
        'userId': element['userId'],
        'sets': finalSets,
        'date':element['date']
      });
    });
    GetFixSportProgramm(widget.sportprogramm['id']);
    mySportProgrammController.setFinalFixSetsList(finalList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: MyGradientAppBar(
        height: 12 * vh,
        title: MyTitleText(text: widget.sportprogramm['name'] ?? ''),
      ),
      body: Container(
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            ...widget.execisesList.map((e) => _ExerciseCard(
                  exercise: e,
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: MyGradientButton(
                  callback: () async {
                    mySportProgrammController.finalFixSetsList.forEach((e) => SetFixSportProgramm({
                          'setId': e['setId'].toString(),
                          'programmId': e['programmId'].toString(),
                          'exerciseId': e['exerciseId'].toString(),
                          'userId': myUserConroller.user['id'].toString(),
                          'sets': jsonEncode(e['sets']),
                          'date':e['date']
                        }));
                    await GetFixSportProgramm(widget.sportprogramm['id']);
                    Get.back();
                  },
                  text: 'Зафиксировать'),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _ExerciseCard extends StatefulWidget {
  _ExerciseCard({
    super.key,
    required this.exercise,
  });
  Map<String, dynamic> exercise;

  @override
  State<_ExerciseCard> createState() => __ExerciseCardState();
}

class __ExerciseCardState extends State<_ExerciseCard> {
  final mySportProgrammController = Get.put(MySportProgrammController());
  final myUserController = Get.put(MyUserController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: MyDescriptionText(
                      text: widget.exercise['nameRu'] ?? '', size: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppImages.VideoCamera,
                      width: 27,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppImages.ChatBlue, width: 27),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppImages.Warn, width: 27),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _SetHeader(exercise: widget.exercise),
          const SizedBox(
            height: 10,
          ),
          _SetBody(
            id: widget.exercise['id'],
          ),
          _ExerciseComments(sportsmanID: myUserController.user['id'], belongID: widget.exercise['id'])
        ],
      ),
    );
  }
}

class _SetHeader extends StatelessWidget {
  _SetHeader({super.key, required this.exercise});
  Map<String, dynamic> exercise;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: MyDescriptionText(
                text: 'Cет',
                size: 12,
                color: AppColors.blackThemeTextOpacity1)),
        Expanded(
            flex: 1,
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
    );
  }
}

class _SetBody extends StatefulWidget {
  _SetBody({super.key, required this.id});
  int id;

  @override
  State<_SetBody> createState() => _SetBodyState();
}

class _SetBodyState extends State<_SetBody> {
  final mySportProgrammController = Get.put(MySportProgrammController());

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sets = mySportProgrammController.finalFixSetsList
        .firstWhere((element) => element['exerciseId'] == widget.id)['sets'];
    return Column(
      children: [
        ...sets.map((e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: _InputsRow(
              set: e,
              exervciseId: widget.id,
            )))
      ],
    );
  }
}

class _InputsRow extends StatefulWidget {
  _InputsRow({super.key, required this.set, required this.exervciseId});
  Map<String, dynamic> set;
  int exervciseId;

  @override
  State<_InputsRow> createState() => __InputsRowState();
}

class __InputsRowState extends State<_InputsRow> {
  final mySportProgrammController = Get.put(MySportProgrammController());
  final setController = TextEditingController();
  final diapazonController = TextEditingController();
  final pokazatel2Controller = TextEditingController();
  final pokazatel3Controller = TextEditingController();
  final pokazatel4Controller = TextEditingController();
  final pokazatel5Controller = TextEditingController();
  late Map<String, dynamic> ss = {};
  MyDateController myDateController = Get.put(MyDateController());

  @override
  void initState() {
    ss = widget.set;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Function onCHangeHandler = (int id) {
      final Map<String, dynamic> s = mySportProgrammController.finalFixSetsList
          .firstWhere((element) => element['exerciseId'] == widget.exervciseId);

      List<Map<String, dynamic>> sets =
          s['sets'].where((e) => e['set'] != id).toList();
      sets.add({
        "set": id,
        'diapazon': diapazonController.text,
        if (sets[0]['pokazatel2'] != null)
          'pokazatel2': pokazatel2Controller.text,
        if (sets[0]['pokazatel3'] != null)
          'pokazatel3': pokazatel3Controller.text,
        if (sets[0]['pokazatel4'] != null)
          'pokazatel4': pokazatel4Controller.text,
        if (sets[0]['pokazatel5'] != null)
          'pokazatel5': pokazatel5Controller.text,
      });
      sets.sort((a, b) => a['set'].compareTo(b['set']));
      mySportProgrammController.setFinalFixSetsList([
        ...mySportProgrammController.finalFixSetsList
            .where((element) => element['exerciseId'] != widget.exervciseId),
        {
          'exerciseId': widget.exervciseId,
          'sets': sets,
          'programmId': s['programmId'],
          'userId': s['userId'],
          'setId': s['setId'],
          'date':myDateController.date
        }
      ]);
    };
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: MyInlineFillInput(
            enabled: false,
            controller: setController,
            marginH: 3,
            hintText: ss['set'].toString(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: MyInlineFillInput(
                  callback: () => onCHangeHandler(widget.set['set']),
                  controller: diapazonController,
                  hintText: '${ss['diapazonOt']}-${ss['diapazonDo']} ',
                  marginH: 3,
                ),
              ),
            ],
          ),
        ),
        if (widget.set['pokazatel2'] != null)
          Expanded(
            flex: 1,
            child: MyInlineFillInput(
              callback: () => onCHangeHandler(widget.set['set']),
              hintText: ss['pokazatel2'].toString(),
              controller: pokazatel2Controller,
              marginH: 3,
            ),
          ),
        if (widget.set['pokazatel3'] != null)
          Expanded(
            flex: 1,
            child: MyInlineFillInput(
              callback: () => onCHangeHandler(widget.set['set']),
              hintText: ss['pokazatel3'].toString(),
              controller: pokazatel3Controller,
              marginH: 3,
            ),
          ),
        if (widget.set['pokazatel4'] != null)
          Expanded(
            flex: 1,
            child: MyInlineFillInput(
              callback: () => onCHangeHandler(widget.set['set']),
              hintText: ss['pokazatel4'].toString(),
              controller: pokazatel4Controller,
              marginH: 3,
            ),
          ),
        if (widget.set['pokazatel5'] != null)
          Expanded(
            flex: 1,
            child: MyInlineFillInput(
              callback: () => onCHangeHandler(widget.set['set']),
              hintText: ss['pokazatel5'].toString(),
              controller: pokazatel5Controller,
              marginH: 3,
            ),
          ),
      ],
    );
  }
}



class _ExerciseComments extends StatelessWidget {
  _ExerciseComments({
    super.key,
    required this.sportsmanID,
    required this.belongID,
  });
  int sportsmanID;
  int belongID;
  MyExercisesController myExercisesController =
      Get.put(MyExercisesController());
  MyUserController myUserController = Get.put(MyUserController());
  TextEditingController messageController = TextEditingController();

  void PushMessage() {
    if (messageController.text.length == 0) {
      GetMySnackBar(description: 'Поле ввода не может быть пустым...');
    } else {
      AddComment({
        'commentatorId': myUserController.user['id'].toString(),
        'exerciseBelongId': belongID.toString(),
        'message': messageController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Map<String, dynamic>> comments = myExercisesController.comments
          .where((element) => element['exerciseBelongId'] == belongID)
          .toList();
      return Container(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.star_border,
                        color: AppColors.blackThemeTextOpacity,
                        size: 20,
                      ),
                      Icon(
                        Icons.star_border,
                        color: AppColors.blackThemeTextOpacity,
                        size: 20,
                      ),
                      Icon(
                        Icons.star_border,
                        color: AppColors.blackThemeTextOpacity,
                        size: 20,
                      ),
                      Icon(
                        Icons.star_border,
                        color: AppColors.blackThemeTextOpacity,
                        size: 20,
                      ),
                      Icon(
                        Icons.star_border,
                        color: AppColors.blackThemeTextOpacity,
                        size: 20,
                      ),
                    ],
                  ),
                  MyDescriptionText(
                      text: '${comments.length} комментариев',
                      color: AppColors.blackThemeTextOpacity,
                      size: 15)
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              width: double.infinity,
              height: 1,
              color: AppColors.blackThemeTextOpacity,
            ),
            ...comments.map((e) => _Comment(
                  comment: e,
                )),
            Row(
              children: [
                Expanded(
                    child: MyInlineFillInput(
                  keyWoardType: TextInputType.text,
                  inputFormatters: 'string',
                  hintText: 'Комментарий',
                  controller: messageController,
                  marginH: 0,
                )),
                IconButton(
                    onPressed: PushMessage,
                    icon: SvgPicture.asset(
                      AppImages.ChatPushMessage1,
                      height: 45,
                    ))
              ],
            )
          ],
        ),
      );
    });
  }
}

class _Comment extends StatelessWidget {
  _Comment({super.key, required this.comment});
  Map<String, dynamic> comment;
  MyUserController myUserController = Get.put(MyUserController());

  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> user = myUserController.Users.firstWhere((el) => el['id'] == comment['commentatorId'], orElse: ()=>{});
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 200,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              user['img']!=null && user['img']!=''?MyCircleNetworkImg(width: 40, height: 40, url: user['img'],radius: 100,):MyCircleDefaulUserIcon(name: user['name']??'',radius: 100,),
              const SizedBox(width: 10,),
              MyDescriptionText(text: FIOSokrashatel(user['name']??'') ,size: 14,color: AppColors.blackThemeTextOpacity4)
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [Expanded(child: MyDescriptionText(text: comment['message']??'',color: AppColors.blackThemeTextOpacity3,size: 12))],
          ),
        ],
      ),
    );
  }
}