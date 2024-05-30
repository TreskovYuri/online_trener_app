import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trener_app/widgets/text/title.dart';

class MyHeaderType2 extends StatelessWidget {
  MyHeaderType2(
      {super.key,
      required this.title,
      required this.vh,
      this.closeActionColor = Colors.white});
  final String title;
  final double vh;
  Color closeActionColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(228, 27, 28, 32),
          borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.only(top: 10),
      height: 9 * vh,
      width: double.infinity,
      alignment: Alignment.center,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
            MyTitleText(text: title, size: 22)
          ],
        ),
      ),
    );
  }
}
