

// Функция принимает число (день недели) и возвращает сроку на русском
String StringWeekDayOnInt({num}) {
  switch (num) {
    case 1:
      return 'Понедельник';
    case 2:
      return 'Вторник';
    case 3:
      return 'Среда';
    case 4:
      return 'Четверг';
    case 5:
      return 'Пятница';
    case 6:
      return 'Суббота';
    case 7:
      return 'Воскресенье';
    default:
      return ''; // Обработка неправильного ввода
  }
}