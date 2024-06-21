import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiseCard extends StatelessWidget {
  ServiseCard(
      {super.key,
      required this.svg,
      required this.callback,
      required this.title});
  String svg;
  String title;
  VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              svg,
              width: 70,
            ),
            onPressed: callback,
          ),
          Container(
            width: 70,
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(234, 255, 255, 255),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
