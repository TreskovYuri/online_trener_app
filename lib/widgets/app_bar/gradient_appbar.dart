
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyGradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyGradientAppBar({
    super.key,
    required this.height, 
    required this. title,
    this.centerTitle = false
    });
  final double height;
  final Widget title;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: centerTitle,
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