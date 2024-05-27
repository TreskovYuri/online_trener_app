import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

void GetMySnackBar({String title = "Ошибка ввода!", required String description}) {
  Get.snackbar(
    title,
    description,
    margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
    colorText: const Color.fromARGB(181, 255, 255, 255),
  );
}
