


String Sklonatel({required int number, required String stage1,required String stage2,required String stage3}) {
  if (number % 10 == 1 && number % 100 != 11) {
    return "$number $stage1";
  } else if ((number % 10 >= 2 && number % 10 <= 4) &&
      !(number % 100 >= 12 && number % 100 <= 14)) {
    return "$number $stage2";
  } else {
    return "$number $stage3";
  }
}
