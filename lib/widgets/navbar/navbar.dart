import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/widgets/navbar/nabarItem.dart';


class Navbar extends StatefulWidget {
  const Navbar({
    Key? key,
    required this.page,
    required this.setPage,
  }) : super(key: key);

  final String page;
  final Function(String) setPage;

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late MyUserController myUserController;

  @override
  void initState() {
    super.initState();
    myUserController = Get.put(MyUserController());
  }

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 12 * vh,
        padding: EdgeInsets.symmetric(horizontal: 2 * vw),
        decoration: const BoxDecoration(
          color: Color(0xff1B1C20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NabarItem(
              icon: 'assets/img/journal_trener.svg',
              page: widget.page,
              title: 'Журнал',
              setPage: () => widget.setPage('Журнал'),
            ),
            NabarItem(
              icon: 'assets/img/pleers_trener.svg',
              page: widget.page,
              title: 'Спортсмены',
              setPage: () => widget.setPage('Спортсмены'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/img/nav_plus.svg',
                    width: 60,
                  ),
                ),
              ],
            ),
            NabarItem(
              icon: 'assets/img/chats.svg',
              page: widget.page,
              title: 'Чат',
              setPage: () => widget.setPage('Чат'),
            ),
            NabarItem(
              icon: 'assets/img/services.svg',
              page: widget.page,
              title: 'Сервисы',
              setPage: () => widget.setPage('Сервисы'),
            ),
          ],
        ),
      ),
    );
  }
}