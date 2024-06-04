import 'package:flutter/material.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/widgets/text/description.dart';

class MyBurgerModalWind extends StatefulWidget {
  MyBurgerModalWind({
    super.key,
    required this.title,
    required this.body
    });
  String title;
  Widget body;
  

  @override
  State<MyBurgerModalWind> createState() => _MyBurgerModalWindState();
}

class _MyBurgerModalWindState extends State<MyBurgerModalWind> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            foregroundColor: AppColors.blackThemeButtonForeground
          ),
          onPressed:()=> setState(() { state=!state;}), child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyDescriptionText(text:widget.title),
              const SizedBox(width: 10,),
              Icon(state? Icons.keyboard_arrow_up_rounded: Icons.arrow_forward_ios_rounded, color: AppColors.blackThemeTextOpacity3,size: state?25:17,)
            ],
          )),
          if(state)Padding(padding: const EdgeInsets.symmetric(horizontal: 12),child: widget.body,)
      ],
    );
  }
}