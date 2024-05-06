import 'package:flutter/material.dart';
import 'package:trener_app/widgets/nitification/carts.dart';
import 'package:trener_app/widgets/nitification/navbar.dart';
import 'package:trener_app/widgets/nitification/servises.dart';


class Notification1 extends StatelessWidget {
  const Notification1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width / 100;
    final topMargin = screenHeight * 0.38; // 40% от высоты экрана

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          color: const Color.fromARGB(255, 23, 23, 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Services(),
              CardService(),
              Navbar()
            ],
          ),
        ),
      ),
    );
  }
}
