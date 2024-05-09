import 'package:flutter/material.dart';

class TrainingDetailsTrener extends StatefulWidget {
  const TrainingDetailsTrener({super.key});

  @override
  State<TrainingDetailsTrener> createState() => _TrainingDetailsTrenerState();
}

class _TrainingDetailsTrenerState extends State<TrainingDetailsTrener> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons
              .arrow_back_ios_new_rounded), // Устанавливаем иконку "домой" вместо стрелки "назад"
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 13 * vh,
        title: Text(
          '${arguments['name']}',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w500,
              fontSize: 5 * vw),
        ),
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
        ),
      ),
    );
  }
}
