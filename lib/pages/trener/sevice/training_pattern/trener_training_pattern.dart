import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyExercisesController.dart';
import 'package:trener_app/http/exerciseUtills.dart';
import 'package:trener_app/constants/colors.dart';
import 'package:trener_app/widgets/cards/training_pattern_card.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';
import 'package:trener_app/widgets/service/training_pattern/add_name.dart';

class TrenerTrainingPattern extends StatefulWidget {
  const TrenerTrainingPattern({super.key});

  @override
  State<TrenerTrainingPattern> createState() => _TrenerTrainingPatternState();
}

class _TrenerTrainingPatternState extends State<TrenerTrainingPattern> {
  MyExercisesController myExercisesController =
      Get.put(MyExercisesController());
  ScrollController _scrollController = ScrollController();
  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    GetExercisePatterns();
    GetExerciseAllBelongPatterns();
    GetExercise();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _isAtTop = _scrollController.position.pixels == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xff4D8AEE)),
        leading: IconButton(
          icon: const Icon(Icons
              .arrow_back_ios_new_rounded), // Устанавливаем иконку "домой" вместо стрелки "назад"
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/service');
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2 * vw),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => TrainingPatternAddName());
              },
              icon: SvgPicture.asset(
                'assets/img/blue_plus.svg',
                width: 2.6 * vh,
              ),
            ),
          ),
        ],
        toolbarHeight: 13 * vh,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Шаблоны тренировок',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  fontSize: 5 * vw),
            ),
          ],
        ),
        backgroundColor:
            AppColors.blackThemeBacground, // Устанавливаем прозрачный фон
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const SizedBox(height: 20,),
              SizedBox(
                height: 74*vh,
                child: ListView(
                  controller: _scrollController,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(() => Column(
                          children: [
                            ...myExercisesController.exercisePattern
                                .map((e) => MyTrainingPatternCard(
                                      card: e,
                                      belongs: myExercisesController
                                          .exercisesAllBelongPattern
                                          .where((element) =>
                                              element['programmId'] == e['id'])
                                          .toList(),
                                    )),
                            const SizedBox(
                              height: 100,
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
          _isAtTop ? const Navbar() : const NavbarScroll(),
        ],
      ),
    );
  }
}

// <========== Выбор между моими упражнениями и общей базой
class NavType extends StatelessWidget {
  const NavType({
    super.key,
    required this.vw,
    required this.typeFlag,
  });

  final double vw;
  final bool typeFlag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1 * vw),
      margin: EdgeInsets.all(3 * vw),
      decoration: BoxDecoration(
        color: const Color(0xff23252B),
        borderRadius: BorderRadius.circular(10 * vw),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(1.5 * vw),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * vw),
                  color: typeFlag
                      ? const Color.fromARGB(34, 235, 238, 247)
                      : Colors.transparent),
              child: Text(
                'Мои упражнения',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Manrope',
                    fontSize: 4 * vw,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(1.5 * vw),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * vw),
                  color: !typeFlag
                      ? const Color.fromARGB(34, 235, 238, 247)
                      : Colors.transparent),
              child: Text(
                'Общая база',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Manrope',
                    fontSize: 4 * vw,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
