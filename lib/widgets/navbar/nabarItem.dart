import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trener_app/widgets/text/description.dart';

class NabarItem extends StatelessWidget {
  NabarItem({
    super.key,
    required this.page,
    required this.title,
    required this.setPage,
    required this.icon,
  });

  String page;
  String title;
  String icon;
  VoidCallback setPage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: page == title ? 1 : .4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {if (page != title) {setPage();}},
              icon: SvgPicture.asset(
                icon,
                height: 30,
              ),
            ),
            MyDescriptionText(text: title,size: 10)
          ],
        ),
      ),
    );
  }
}
