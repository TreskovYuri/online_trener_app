import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:trener_app/widgets/text/title.dart';

class MyHeaderType1 extends StatelessWidget {
  MyHeaderType1({super.key, required this.title, required this.vh});
  final String title;
  final double vh;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(228, 27, 28, 32),
          borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.only(top: 10),
      height: 9 * vh,
      width: double.infinity,
      alignment: Alignment.center,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 40,),child: MyTitleText(text: title, size: 22),),
      ),
    );
  }
}
