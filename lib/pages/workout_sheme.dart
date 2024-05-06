import 'package:flutter/material.dart';
import 'package:trener_app/widgets/workout/nav.dart';
import 'package:trener_app/widgets/workout/workout_sheme_on_day.dart';

class WorkoutSheme extends StatelessWidget {
  const WorkoutSheme({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width / 100;
    final topMargin = screenHeight * 0.38; // 40% от высоты экрана

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(

          color: const Color.fromARGB(255, 23, 23, 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Nav(),
              WorkoutShemeOnDay()
            ],
          ),
        ),
      ),
    );
  }
}
