import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MySportProgrammController.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/http/sportpogrammUtills.dart';
import 'package:trener_app/http/userUtills.dart';
import 'package:trener_app/pages/trener/sevice/sportprogramm/trener_sportprogramm.dart';
import 'package:trener_app/widgets/cards/sportsman_card.dart';
import 'package:trener_app/widgets/modal_wind.dart';
import 'dart:convert';


class SprotProgrammModalSportsmans extends StatefulWidget {
  const SprotProgrammModalSportsmans({super.key});

  @override
  State<SprotProgrammModalSportsmans> createState() =>
      _SprotProgrammModalSportsmansState();
}

class _SprotProgrammModalSportsmansState
    extends State<SprotProgrammModalSportsmans> {
  MyUserController myUserController = Get.put(MyUserController());
  MySportProgrammController mySportProgrammController = Get.put(MySportProgrammController());
  List<Map<String,dynamic>> finalUsers = [];
  

  @override
  void initState() {
    GetSportsmans();
    super.initState();
  }
  void onTapUserCard (Map<String,dynamic> user){
    if(finalUsers.length>0 &&  finalUsers.any((el) => el['id'] == user['id'])){
      setState(() {
        finalUsers.removeWhere((el) => el['id']==user['id']);
      });
    }else{
      setState(() {
        finalUsers.add(user);
      });
    }
  }

  void saveProgramm () {

    final Map<String,dynamic> map = {
      "name":mySportProgrammController.nameRuAddSportProgramm,
      "description":mySportProgrammController.descriptionRuAddSportProgramm,
      "nutritions": jsonEncode(mySportProgrammController.finalNutritionsList),
      "tests": jsonEncode(mySportProgrammController.finalNTestsList),
      "users": jsonEncode(finalUsers),
      "exersices":jsonEncode(mySportProgrammController.finalExercisesList),
    };
    SetSportProgramm(map);
    mySportProgrammController.clear();
    Get.to(const TrenerSportProgramm());
  }

  @override
  Widget build(BuildContext context) {
    return MyModalWind(
      height: 90,
      widget: Obx(
        () => Column(
          children: [...myUserController.sportsmans.map((e) => MyUserCard(user: e,callback:()=>onTapUserCard(e),select:finalUsers.length>0 && finalUsers.any((el)=>el['id']==e['id'])?true:false))],
        ),
      ),
      title: 'Спортсмены',
      button: true,
      ButtonCallback: saveProgramm,
      buttonText: 'Назначить',
    );
  }
}

