import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trener_app/widgets/text/description.dart';
import 'package:trener_app/widgets/text/title.dart';

class MyHeaderType3 extends StatelessWidget {
  MyHeaderType3({
    super.key,
    required this.title,
    required this.vh,
    this.closeActionColor = Colors.white,
    this.nextActionText = '',
    this.nextActionColor = Colors.white,
    this.nextActionFontSize = 15,
    this.prevActionIconSize = 23,
    this.nextActionIconSize = 28,
    this.titleFontSize = 21,
    required this.prevActionCallback,
    required this.nextActionCallback,
    this.prevActionAcon = 1,
  });
  final String title;
  final double vh;
  int prevActionAcon;
  Color closeActionColor;
  Color nextActionColor;
  String nextActionText;
  double nextActionFontSize;
  double nextActionIconSize;
  double prevActionIconSize;
  double titleFontSize;
  VoidCallback prevActionCallback;
  VoidCallback nextActionCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(228, 27, 28, 32),
      ),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.only(top: 10),
      height: 9 * vh,
      width: double.infinity,
      alignment: Alignment.center,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: prevActionCallback,
                  icon: Icon(
                    prevActionAcon !=1? Icons.arrow_back_ios : Icons.close,
                    color: closeActionColor,
                    size: prevActionIconSize,
                  )),
            ),
            Expanded(
                flex: 3,
                child: Center(
                  child: MyTitleText(text: title, size: titleFontSize),
                )),
            Expanded(
              flex: 1,
              child: nextActionText != ''
                  ? TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(0)
                    ),
                      onPressed: nextActionCallback,
                      child: MyDescriptionText(
                          text: nextActionText,
                          color: nextActionColor,
                          size: nextActionFontSize))
                  : IconButton(
                      onPressed: nextActionCallback,
                      icon: Icon(
                        Icons.add,
                        color: nextActionColor,
                        size: nextActionIconSize,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
