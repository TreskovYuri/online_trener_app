import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyDateController.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/getx/MySportProgrammController.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/http/chatUtills.dart';
import 'package:trener_app/http/exerciseUtills.dart';
import 'package:trener_app/http/sportpogrammUtills.dart';
import 'package:trener_app/http/userUtills.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/models/constants/images.dart';
import 'package:trener_app/pages/chat/oneChat.dart';
import 'package:trener_app/service/helpers/sokrashatel.dart';
import 'package:trener_app/widgets/MyVideoPlayer.dart';
import 'package:trener_app/widgets/circle_default_user_icon.dart';
import 'package:trener_app/widgets/circle_network_Img.dart';
import 'package:trener_app/widgets/inputs/input_inline_fill.dart';
import 'package:trener_app/widgets/shanckbar.dart';
import 'package:trener_app/widgets/text/description.dart';
import 'package:trener_app/widgets/text/textContainerBacgroundFill.dart';
import 'package:trener_app/widgets/youtube.dart';

class TrainingDetailsTrener extends StatefulWidget {
  const TrainingDetailsTrener({super.key});

  @override
  State<TrainingDetailsTrener> createState() => _TrainingDetailsTrenerState();
}

class _TrainingDetailsTrenerState extends State<TrainingDetailsTrener> {
  @override
  void initState() {
    GetUsers();
    GetChats();
    GetAllExerciseComents();

    super.initState();
  }

  MyDateController myDateController = Get.put(MyDateController());
  MySportProgrammController mySportProgrammController =
      Get.put(MySportProgrammController());
  MyUserController myUserController = Get.put(MyUserController());
  void toChat(id) async {
    Map chat = await GetChatId(id);
    if (chat['id'] != null) {
      Get.to(const OneChat(), arguments: chat);
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    List<dynamic> exercise = arguments['exercises'];
    Map user = arguments['user'];
    GetFixSportProgramm(exercise[0]['programmId']);
    // List sets = json.decode(arguments['sets']);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons
              .arrow_back_ios_new_rounded), // Устанавливаем иконку "домой" вместо стрелки "назад"
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2 * vw),
            child: IconButton(
              onPressed: () {
                toChat(user['id']);
              },
              icon: SvgPicture.asset(
                AppImages.WhiteChat,
                width: 3.6 * vh,
              ),
            ),
          ),
        ],
        toolbarHeight: 13 * vh,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${mySportProgrammController.sportprogramms.firstWhere((element) => element['id'] == exercise[0]['programmId'])['name']}',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  fontSize: 5 * vw),
            ),
            Text(
              '☺ ${user['name']}',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  fontSize: 3 * vw),
            ),
          ],
        ),
        backgroundColor: Colors.transparent, // Устанавливаем прозрачный фон
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xff4D8AEE),
                Color(0xff2932FF)
              ], // Цвета радиального градиента
              center: Alignment.topLeft, // Центр радиального градиента
              radius: 3.5, // Радиус радиального градиента
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ...exercise.map((e) => _ExercisesCard(
                sportsman: user,
                exercise: e,
              ))
        ],
      ),
    );
  }
}

class _ExercisesCard extends StatelessWidget {
  _ExercisesCard({super.key, required this.exercise, required this.sportsman});
  
  Map sportsman;
  Map exercise;
  MyExercisesController myExercisesController =
      Get.put(MyExercisesController());
  MySportProgrammController mySportProgrammController =
      Get.put(MySportProgrammController());
  MyDateController myDateController =
      Get.put(MyDateController());
    

  @override
  Widget build(BuildContext context) {
  
    final List sets = json.decode(exercise['sets']);
    return Obx(() {
      Map<String, dynamic> exerciseData = myExercisesController.exercises
          .firstWhere((element) => element['id'] == exercise['exerciseId']);
      List<dynamic> fixSets  = [];
      if(mySportProgrammController.fixList.length>0){
        var newFix = mySportProgrammController.fixList.firstWhere((el)=>el['date'] == myDateController.date && el['userId'] == sportsman['id'] ,orElse: ()=>{'sets':[]} )['sets']??[];
        if( newFix is String){
          fixSets = jsonDecode(newFix);
        }else{
          fixSets=newFix;
        }
      }
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: MyDescriptionText(
                        text: exerciseData['nameRu'], size: 20))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // if (exerciseData['link'] != '') Youtube(url: exerciseData['link']),
            if(exerciseData['video']!='')MyVideoPlayer(url:'${dotenv.env['STATIC_URL']}/${exerciseData['video']}'),
            const SizedBox(
              height: 20,
            ),
            _SetHeader(exercise: exerciseData),
            ...sets.map((e) => _SetBodyRow(exercise: e,fixSet:fixSets.firstWhere((element) => element['set'] == e['set'],orElse: () => {}),)),
            _ExerciseComments(
              belongID: exercise['id'],
              sportsmanID: sportsman['id'],
            ),
          ],
        ),
      );
    });
  }
}

class _SetHeader extends StatelessWidget {
  _SetHeader({super.key, required this.exercise});
  Map<String, dynamic> exercise;

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
      ),
    );
  }
}

class _SetBodyRow extends StatelessWidget {
  _SetBodyRow({super.key, required this.exercise, required this.fixSet});
  MySportProgrammController mySportProgrammController = Get.put(MySportProgrammController());
  Map exercise;
  Map fixSet;

  @override
  Widget build(BuildContext context) {
    bool flag = fixSet['diapazon'] != null;
    return Row(
      children: [
        Expanded(
            child:
                MyTextContainerBacgroundFill(text: exercise['set'].toString())),
        Expanded(
            child: flag && fixSet['diapazon'].toString()!=''?MyTextContainerBacgroundFill(
              flag: true,
                text: '${fixSet['diapazon']}',):MyTextContainerBacgroundFill(
                text: '${exercise['diapazonOt']}-${exercise['diapazonDo']}',textColor: AppColors.blackThemeTextOpacity3,)),
        if (exercise['pokazatel2'] != null)
          Expanded(
              child:flag && fixSet['pokazatel2'].toString()!=''? MyTextContainerBacgroundFill(
                flag: true,
                  text: fixSet['pokazatel2'].toString()): MyTextContainerBacgroundFill(
                  text: exercise['pokazatel2'].toString(),textColor: AppColors.blackThemeTextOpacity3,)),
        if (exercise['pokazatel3'] != null)
          Expanded(
              child: flag && fixSet['pokazatel3'].toString()!=''?MyTextContainerBacgroundFill(
                flag: true,
                  text: fixSet['pokazatel3'].toString()):MyTextContainerBacgroundFill(
                  text: exercise['pokazatel3'].toString(),textColor: AppColors.blackThemeTextOpacity3,)),
        if (exercise['pokazatel4'] != null)
          Expanded(
              child: flag && fixSet['pokazatel4'].toString()!=''?MyTextContainerBacgroundFill(
                flag: true,
                  text: fixSet['pokazatel4'].toString()):MyTextContainerBacgroundFill(
                  text: exercise['pokazatel4'].toString(),textColor: AppColors.blackThemeTextOpacity3,)),
        if (exercise['pokazatel5'] != null)
          Expanded(
              child: flag && fixSet['pokazatel5'].toString()!=''?MyTextContainerBacgroundFill(
                flag: true,
                  text: fixSet['pokazatel5'].toString()):MyTextContainerBacgroundFill(
                  text: exercise['pokazatel5'].toString(),textColor: AppColors.blackThemeTextOpacity3,)),
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
    Map<String,dynamic> user = myUserController.Users.firstWhere((el) => el['id'] == comment['commentatorId']);
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
              user['img']!=''?MyCircleNetworkImg(width: 40, height: 40, url: user['img'],radius: 100,):MyCircleDefaulUserIcon(name: user['name'],radius: 100,),
              const SizedBox(width: 10,),
              MyDescriptionText(text: FIOSokrashatel(user['name']) ,size: 14,color: AppColors.blackThemeTextOpacity4)
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [Expanded(child: MyDescriptionText(text: comment['message'],color: AppColors.blackThemeTextOpacity3,size: 12))],
          ),
        ],
      ),
    );
  }
}
