import 'package:flutter/widgets.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/widgets/text/title.dart';

class MyModalWind extends StatelessWidget {
  MyModalWind({super.key, required this.height,required this.widget, this.headerType = 1, required this.title});
  int height;
  Widget widget;
  int headerType;
  String title;

  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height / 100;
    return Container(
      height: height*vh ,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.blackModalBacground,
        borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(10), topEnd: Radius.circular(10))
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: 100,
            height: .5*vh,
            decoration: BoxDecoration(
              color: AppColors.blackTextOpacity,
              borderRadius: BorderRadius.circular(100)
            ),
          ),
          _Header(title: title, type: headerType,vh: vh,),
          Container(height: 57*vh,child: ListView(
            children: [widget],
          ),)
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  _Header({super.key, required this.title, required this.type,required this.vh});
  String title;
  int type;
  double vh;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 1:
        return Container(height: 10*vh,child: MyTitleText(text: 'Упражнения',size: 22),);
      default:
        return MyTitleText(text: 'Упражнения',size: 22);
    }
  }
}


