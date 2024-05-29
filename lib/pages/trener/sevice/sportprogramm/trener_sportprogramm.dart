
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MySportProgrammController.dart';
import 'package:trener_app/http/sportpogrammUtills.dart';
import 'package:trener_app/widgets/cards/sportprogramm_card.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';
import 'package:trener_app/widgets/sprortprogramm/add_sportprogramm.dart';


class TrenerSportProgramm extends StatefulWidget {
  const TrenerSportProgramm({super.key});

  @override
  State<TrenerSportProgramm> createState() => _TrenerSportProgrammState();
}

class _TrenerSportProgrammState extends State<TrenerSportProgramm> {
  ScrollController _scrollController = ScrollController();
  MySportProgrammController mySportProgrammController = Get.put(MySportProgrammController());

  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    GetSportProgramm();
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
        iconTheme: IconThemeData(color: Color(0xff4D8AEE)),
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
              onPressed: () {showModalBottomSheet(isScrollControlled: true, context: context, builder: (_)=>AddSportProgramm());},
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
              'Спортивная программа',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  fontSize: 5 * vw),
            ),
          ],
        ),
        backgroundColor: Color(0xff1B1C20), // Устанавливаем прозрачный фон
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView(
            controller: _scrollController,
            children: [
              Padding(
                      padding: EdgeInsets.all(3 * vw),
                      child: TextField(
                        cursorColor: Color.fromARGB(255, 112, 112, 112),
                        style: TextStyle(color: Colors.white, fontSize: 4 * vw),
                        decoration: InputDecoration(
                          hintText: 'Найти...',
                          filled: true, // Set to true to fill the background
                          fillColor: Color(0xff23252B), // Set background color
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                              color: Colors.grey), // Customize hint text color
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 4 * vw, vertical: 1.5 * vh),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none, // Remove border
                            borderRadius: BorderRadius.circular(4 * vw),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none, // Remove border
                            borderRadius: BorderRadius.circular(4 * vw),
                          ),
                        ),
                      ),
                    ),
                    Obx(()=>Column(
                      children: [
                        ...mySportProgrammController.sportprogramms.map((el) => MySprotProgrammCard(programm: el,)),
                        const SizedBox(height: 100,)
                      ],
                    ))
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
      padding: EdgeInsets.all(1*vw),
      margin: EdgeInsets.all(3 * vw),
      decoration: BoxDecoration(
        color: Color(0xff23252B),
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
                    ? Color.fromARGB(34, 235, 238, 247)
                    : Colors.transparent),
            child: Text(
              'Мои упражнения',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontSize: 4 * vw,
                  fontWeight: FontWeight.w500),
            ),
          ),),
                          Expanded(
              child: Container(
                alignment: Alignment.center,
            padding: EdgeInsets.all(1.5 * vw),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10 * vw),
                color: !typeFlag
                    ? Color.fromARGB(34, 235, 238, 247)
                    : Colors.transparent),
            child: Text(
              'Общая база',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontSize: 4 * vw,
                  fontWeight: FontWeight.w500),
            ),
          ),),
        ],
      ),
    );
  }
}
