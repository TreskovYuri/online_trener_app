

// Функция возвращает первый символ из строки или знак ?
String getFirstSimvolOnString(String input) {
  if (input.isNotEmpty) {
    return input[0];
  } else {
    return '?'; // Возвращает пустую строку, если входная строка пуста или null
  }
}
