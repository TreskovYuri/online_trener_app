

// Функция принимает число - месяц и флаг, и возвразщает полной или сокразенное название этого месяца на русском
String IntMonthToStringRus({num, all = false}) {

  switch (num) {
    case 1:
      return all?'января':'Янв.';
    case 2:
      return all?'февраля':'Фев.';
    case 3:
      return all?'марта':'Мар.';
    case 4:
      return all?'апреля':'Апр.';
    case 5:
      return all?'мая':'Мая';
    case 6:
      return all?'июня':'Июня';
    case 7:
      return all?'июля':'Июля';
    case 8:
      return all?'августа':'Авг.';
    case 9:
      return all?'сентября':'Сент.';
    case 10:
      return all?'октября':'Окт.';
    case 11:
      return all?'ноября':'Нояб.';
    case 12:
      return all?'декабря':'Декаб.';
    default:
      return ''; // Обработка неправильного ввода
  }
}