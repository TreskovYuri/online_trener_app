import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trener_app/widgets/text/title.dart';

class MyBlueOutlineColorButton extends StatelessWidget {
  MyBlueOutlineColorButton({
    super.key,
    required this.buttonText,
    required this.buttonCallBack,
    this.actionType ='plus',
    });
  String buttonText;
  VoidCallback buttonCallBack;
  String actionType;


  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      gradient: const RadialGradient(
                          colors: [Color(0xff4D8AEE), Color(0xff2932FF)],
                          radius: 71),
                      borderRadius: BorderRadius.circular(100)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 0, 84, 122),
                      backgroundColor: const Color(0xff1B1C20),
                      padding:
                          EdgeInsets.zero, // Убираем внутренний отступ кнопки
                      minimumSize: const Size(
                          0, 0), // Устанавливаем минимальный размер кнопки
                      tapTargetSize: MaterialTapTargetSize
                          .shrinkWrap, // Уменьшаем размер области клика
                    ),
                    onPressed: buttonCallBack,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 120, vertical:actionType =='plus'? 10: 4),
                      child: Row(
                        mainAxisSize:
                            MainAxisSize.min, // Минимальный размер для Row
                        children: [
                          actionType =='plus'?const Icon( Icons.add,color: Colors.white,size: 22,):MyTitleText(text: '-'),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            buttonText,
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                );
  }
}