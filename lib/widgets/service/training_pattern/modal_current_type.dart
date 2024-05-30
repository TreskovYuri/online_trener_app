
import 'package:flutter/material.dart';

class MyModalCurrentType extends StatelessWidget {
  MyModalCurrentType({
    super.key,
    required this.categoryList,
     required this.callback
    });
  final List<String> categoryList;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.all(13),
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xff24252B),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                ...categoryList.map((e) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Устанавливаем радиус круглых углов
                        ),
                        backgroundColor: Colors.transparent,
                        foregroundColor: const Color.fromARGB(0, 0, 41, 74),
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 20)),
                    onPressed: () => callback(e),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            e,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 2, 13, 14),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Устанавливаем радиус круглых углов
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  backgroundColor: const Color(0xff24252B),
                  foregroundColor: const Color.fromARGB(0, 0, 41, 74),
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Отмена',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          )
        ],
      ),
    );;
  }
}