
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:trener_app/widgets/text/title.dart';

class MyGradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyGradientAppBar({
    super.key,
    required this.height, 
    required this. title
    });
  final double height;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: false,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        leading: IconButton(
          icon: const Icon(Icons
              .arrow_back_ios_new_rounded), // Устанавливаем иконку "домой" вместо стрелки "назад"
          onPressed: () {
            Get.back();
          },
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 16),
        //     child: IconButton(
        //       onPressed: () {},
        //       icon: SvgPicture.asset(
        //         'assets/img/chats_edit.svg',
        //         width: 16,
        //       ),
        //     ),
        //   ),
        // ],
        toolbarHeight: 90,
        title: title,
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
        ), // Устанавливаем прозрачный фон
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}