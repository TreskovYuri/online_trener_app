String FIOSokrashatel (String text){
  if(text == '') return 'Без имени';
  List<String> list = text.split(' ');
  String finalString = '';
  for(var i =0;i< list.length; i++){
    if(i==0){
      finalString+=list[i] + ' ';
    }else{
      finalString+=list[i].split('')[0] + '. ';
    }
  }
  return finalString;
}