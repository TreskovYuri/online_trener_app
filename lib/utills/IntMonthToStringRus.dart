
String IntMonthToStringRus(int num) {
  switch (num) {
    case 1:
      return 'Янв.';
    case 2:
      return 'Фев.';
    case 3:
      return 'Мар.';
    case 4:
      return 'Апр.';
    case 5:
      return 'Мая';
    case 6:
      return 'Июня';
    case 7:
      return 'Июля';
    case 8:
      return 'Авг.';
    case 9:
      return 'Сент.';
    case 10:
      return 'Окт.';
    case 11:
      return 'Нояб.';
    case 12:
      return 'Декаб.';
    default:
      return ''; // Обработка неправильного ввода
  }
}