
import 'package:trener_app/http/http.dart';
import 'package:trener_app/mobx/mobx.dart';





// ignore: non_constant_identifier_names
Future GetExercise(mobx) async {

  
  try {
    var data = await Session().get('training/exercise');
    // print(data);
    mobx.setExercises(data);
    return data;
    } catch(e) {
    print(e);
  }
  // Возвращаемое значение в случае неудачи
  return null;
}


Future GetExerciseBelongForSportsmans(Mobx mobx) async {
  try {
    var data = await Session().get('sportprogramm/exersices/forusers');
    mobx.setUserExercises(data);
    // print(mobx.userExercisesOnDay);
    return data;
  } catch (e) {
    print(e);
    return null;
  }
}