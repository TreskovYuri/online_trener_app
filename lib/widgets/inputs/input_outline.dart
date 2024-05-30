import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInputOutline extends StatelessWidget {
  MyInputOutline({
    super.key, 
    this.label ='', 
    this.hintText ='', 
    required this.controller, 
    this.labelSize = 13,
    this.textSize = 15,
    this.paddingH = 10,
    this.paddingV = 10,
    this.paddingGH = 10,
    this.paddingGV = 10,
    this.radius=10,
    });
  String label;
  String hintText;
  TextEditingController controller;
  double labelSize;
  double textSize;
  double paddingV;
  double paddingH;
  double paddingGV;
  double paddingGH;
  double radius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingGV, horizontal:paddingGH ),
      child: Column(
        children: [
          if(label !='')Row(
           children: [
             Text(label,
                 textAlign: TextAlign.start,
                 style: TextStyle(
                     color: Color.fromARGB(115, 255, 255, 255),
                     fontSize: labelSize,
                     fontWeight: FontWeight.w500,
                     fontFamily: 'Manrope')),
           ],
         ),
         const SizedBox(height: 10,),
          TextField(
            controller: controller,
            cursorColor: const Color.fromRGBO(112, 112, 112, 1),
            style: TextStyle(color: Colors.white, fontSize: textSize),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.grey, // Цвет текста плейсхолдера
                fontSize: 16, // Размер текста плейсхолдера
                fontWeight: FontWeight.normal, // Начертание текста плейсхолдера
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 112, 112, 112),
                  width: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}