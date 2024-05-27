import 'package:flutter/material.dart';
import 'package:trener_app/widgets/buttons/blueTextButton.dart';
import 'package:trener_app/widgets/text/title.dart';

class AppBarTitleOneAction extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback callback;
  final double height;
  final String actionTitle;

  AppBarTitleOneAction({
    super.key,
    required this.title,
    required this.callback,
    required this.height, 
    this.actionTitle = 'Далее'
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: MyTitleText(text: title),
              ),
              const Spacer(), // Этот виджет займет все оставшееся пространство, чтобы кнопки были справа
              BlueTextButton(text: actionTitle, callback: callback),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}