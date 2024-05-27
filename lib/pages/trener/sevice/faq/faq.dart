import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {


    ScrollController _scrollController = ScrollController();
  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
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
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons
              .arrow_back_ios_new_rounded), // Устанавливаем иконку "домой" вместо стрелки "назад"
          onPressed: () {
            Navigator.pushReplacementNamed(context,'/service');
          },
        ),
        toolbarHeight: 13*vh,
        title: const Text(
          'Справочник',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: "Manrope"),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff1B1C20),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: EdgeInsets.all(3 * vw),
            child: Column(
              children: [
                SizedBox(height: 4*vh,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 2 * vh, horizontal: 5 * vw),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Указываем радиус скругления углов
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/trener_trainings');
                  },
                  child: Container(
                    width: 90 * vw,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/img/pleers_trener.svg',
                              width: 4.4 * vw,
                            ),
                            SizedBox(
                              width: 3 * vw,
                            ),
                            Text(
                              'Упражнения',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Manrope",
                                  fontSize: 4.5 * vw),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 4 * vw,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2*vh,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 2 * vh, horizontal: 5 * vw),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Указываем радиус скругления углов
                    ),
                  ),
                  onPressed: () {Navigator.pushReplacementNamed(context, '/trener_tests');},
                  child: Container(
                    width: 90 * vw,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/img/tests.svg',
                              width: 4.4 * vw,
                            ),
                            SizedBox(
                              width: 3 * vw,
                            ),
                            Text(
                              'Тесты',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Manrope",
                                  fontSize: 4.5 * vw),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 4 * vw,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2*vh,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 2 * vh, horizontal: 5 * vw),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Указываем радиус скругления углов
                    ),
                  ),
                  onPressed: () {},
                  child: Container(
                    width: 90 * vw,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/img/zdorovie.svg',
                              width: 4.4 * vw,
                            ),
                            SizedBox(
                              width: 3 * vw,
                            ),
                            Text(
                              'Показатели здоровья',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Manrope",
                                  fontSize: 4.5 * vw),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 4 * vw,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2*vh,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 2 * vh, horizontal: 5 * vw),
                    backgroundColor: Color(0xff23252B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Указываем радиус скругления углов
                    ),
                  ),
                  onPressed: () {},
                  child: Container(
                    width: 90 * vw,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/img/med.svg',
                              width: 4.4 * vw,
                            ),
                            SizedBox(
                              width: 3 * vw,
                            ),
                            Text(
                              'Медицинские анализы',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Manrope",
                                  fontSize: 4.5 * vw),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 4 * vw,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _isAtTop ? Navbar() : NavbarScroll(),
        ],
      ),
    );
  }
}
