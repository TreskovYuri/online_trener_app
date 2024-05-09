import 'package:flutter/material.dart';
import 'package:trener_app/widgets/service/carts.dart';
import 'package:trener_app/widgets/service/navbar.dart';
import 'package:trener_app/widgets/service/servises.dart';

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  bool serviseMotification = true;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      ? CardService()
                      : Container(
                        width: 80*vw,
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.all(5 * vw),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Здесь пока пусто... Как только появятся новые уведомления, вы увидите их здесь',
                            style: TextStyle(color: Color.fromARGB(155, 255, 255, 255),
                            fontFamily: 'Manrope',fontSize: 3.5*vw,fontWeight: FontWeight.w500),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
