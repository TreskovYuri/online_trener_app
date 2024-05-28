import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/http/userUtills.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';
import 'package:trener_app/widgets/modal_wind.dart';
import 'package:trener_app/widgets/text/description.dart';
import 'package:trener_app/widgets/text/title.dart';

class SprotProgrammModalSportsmans extends StatefulWidget {
  const SprotProgrammModalSportsmans({super.key});

  @override
  State<SprotProgrammModalSportsmans> createState() =>
      _SprotProgrammModalSportsmansState();
}

class _SprotProgrammModalSportsmansState
    extends State<SprotProgrammModalSportsmans> {
  MyUserController myUserController = Get.put(MyUserController());

  @override
  void initState() {
    GetSportsmans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyModalWind(
      height: 90,
      widget: Obx(
        () => Column(
          children: [...myUserController.sportsmans.map((e) => _Card(card: e))],
        ),
      ),
      title: 'Спортсмены',
      button: true,
      buttonText: 'Назначить',
    );
  }
}

class _Card extends StatelessWidget {
  _Card({super.key, required this.card});
  Map<String, dynamic> card;

  @override
  Widget build(BuildContext context) {
    return MyCardButton(
        callback: () {},
        widget: Row(
          children: [Expanded(child: MyDescriptionText(text: card['name']))],
        ));
  }
}
