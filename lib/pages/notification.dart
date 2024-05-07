import 'package:flutter/material.dart';
import 'package:trener_app/widgets/nitification/carts.dart';
import 'package:trener_app/widgets/nitification/navbar.dart';
import 'package:trener_app/widgets/nitification/servises.dart';


class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Services()),
                Expanded(
                  flex: 5,
                  child: CardService()),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  Navbar(),
    );
  }
}
