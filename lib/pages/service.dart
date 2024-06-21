import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/widgets/service/card_service_player.dart';
import 'package:trener_app/widgets/service/card_service_trener.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';
import 'package:trener_app/widgets/service/servises.dart';

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  MyUserController myUserController = Get.put(MyUserController());
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
  bool serviseMotification = true;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width / 100;
    final mobx = Provider.of<Mobx  >(context);
    
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            controller: _scrollController,
          child: Container(
            height: screenHeight,
            color: const Color(0xff1B1C20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 3,
                    child: GestureDetector(
                        onTap: () => setState(() {
                              serviseMotification = !serviseMotification;
                            }),
                        child: Services(
                          bl: serviseMotification,
                        ))),
                Expanded(
                  flex: 5,
                  child: serviseMotification
                      ? (myUserController.user['post'] == 'Тренер' || myUserController.user['post'] == 'Супер тренер') ? CardServiceTrener(): CardServicePlayer()
                      : Container(
                        width: 80*vw,
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.all(5 * vw),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Здесь пока пусто... Как только появятся новые уведомления, вы увидите их здесь',
                            style: TextStyle(color: const Color.fromARGB(155, 255, 255, 255),
                            fontFamily: 'Manrope',fontSize: 3.5*vw,fontWeight: FontWeight.w500),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
        _isAtTop ? const Navbar() : const NavbarScroll(),
        ],)
      ),
    );
  }
}
