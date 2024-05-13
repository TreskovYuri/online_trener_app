import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ModalAddTest extends StatefulWidget {
  const ModalAddTest({super.key});

  @override
  State<ModalAddTest> createState() => _ModalAddTestState();
}

class _ModalAddTestState extends State<ModalAddTest> {
  final typeList = [
    {
      'name':""
    }
  ];


  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;



    return Container(
      height: 90 * vh,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff1B1C20),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40 * vw),
            child: Container(
              margin: EdgeInsets.only(top: 1 * vh),
              width: 15 * vw,
              height: 4,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(59, 255, 255, 255),
                  borderRadius: BorderRadius.circular(50 * vw)),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/img/x_white.svg',
                        )),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: const Column(
                      children: [
                        SizedBox(height: 10,),
                        Text('Тесты', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 25),),
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // page++;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: Text(
                            'Далее',
                            style: TextStyle(
                              color: Color(0xff4D8AEE),
                              fontSize: 3.5 * vw,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Manrope',
                            ),
                          ),
                        ),
                      ),
              )
            ],
          ),
      
        ],
      ),
    );
  }
}