import 'package:get/get.dart';
import 'package:trener_app/getx/getx.dart';
import 'package:trener_app/models/user.dart';

class MyGetxController extends GetxController {
  // Инициализация репозитория
  var getx = MyeGetx();

  // Установка новой даты
  void setCurrentDate(String date) => getx.setCurrentDate(date);

  // Установка новой даты
  void setUser(Map user) => getx.setUser(user);

  void setUserExercisesOnDay(String date) {
    if (int.parse(date.split('.')[0]) % 2 == 0) {
      getx.setUserExercisesOnDay([
        {
          "name": "Йога",
          'id': 1,
          "date": "06.05.2024",
          'stage': ['Стена', 'Стул'],
          'img':"http://web-hub.pro:5004/assets/0c50cda7-8543-492c-8d92-840921bf7c4e.jpg",
          'description':'Йога — это ряд упражнений с собственным весом или отягощением. Их основной целью является увеличение силы мышц и развитие выносливости тела.Все силовые направления выполняются в достаточно интенсивном темпе, и цели у них, как правило, жиросжигание, тонус мышц, активная работа дыхательной и сердечно-сосудистой систем.Основная цель занятий на растяжку - гибкость, эластичность, работа с дыханием, улучшение кровотока и снятие напряжения.',
          "exercises": [
            {
              'sets': [
                {"name": "Повторения", "type": "раз", 'sp': true},
                {"name": "Время", "type": "сек", 'sp': true},
              ],
              'id': '1',
              'nameRu': 'Круги руками',
              'nameEng': ' Circles with hands',
              'descriptionRu':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'link': '',
              'img': '',
              'video': '',
              'stage': '',
              'equipment': '',
              'musclegroups': '',
              'pocazatel1Name': 'Повторения',
              'pocazatel1Type': '',
              'pocazatel1SPFlag': '',
              'pocazatel2Name': '',
              'pocazatel2Type': '',
              'pocazatel2SPFlag': '',
              'pocazatel3Name': '',
              'pocazatel3Type': '',
              'pocazatel3SPFlag': '',
              'pocazatel4Name': '',
              'pocazatel4Type': '',
              'pocazatel4SPFlag': '',
              'pocazatel5Name': '',
              'pocazatel5Type': '',
              'pocazatel5SPFlag': '',
            },
            {
          'sets': [
            {"name": "Повторения", "type": "раз", 'sp': true},
            {"name": "Время", "type": "сек", 'sp': true},
          ],
              'id': '1',
              'nameRu': 'Скручивание',
              'nameEng': ' Twisting',
              'descriptionRu':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'descriptionEn':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'link': '',
              'img': '',
              'video': '',
              'stage': '',
              'equipment': '',
              'musclegroups': '',
              'pocazatel1Name': '',
              'pocazatel1Type': '',
              'pocazatel1SPFlag': '',
              'pocazatel2Name': '',
              'pocazatel2Type': '',
              'pocazatel2SPFlag': '',
              'pocazatel3Name': '',
              'pocazatel3Type': '',
              'pocazatel3SPFlag': '',
              'pocazatel4Name': '',
              'pocazatel4Type': '',
              'pocazatel4SPFlag': '',
              'pocazatel5Name': '',
              'pocazatel5Type': '',
              'pocazatel5SPFlag': '',
            },
          ]
        },
        {
          "name": "Силовая тренировка",
          'id': 2,

          "date": "06.05.2024",
          'stage': ['Роллер', 'Стена', 'Стул'],
          'img':
              "http://web-hub.pro:5004/assets/9811ef87-a51a-4c53-8e13-85b6539ede97.png",
          'description':
              'Силовая тренировка — это ряд упражнений с собственным весом или отягощением. Их основной целью является увеличение силы мышц и развитие выносливости тела.Все силовые направления выполняются в достаточно интенсивном темпе, и цели у них, как правило, жиросжигание, тонус мышц, активная работа дыхательной и сердечно-сосудистой систем.Основная цель занятий на растяжку - гибкость, эластичность, работа с дыханием, улучшение кровотока и снятие напряжения.',
          "exercises": [
            {
          'sets': [
            {"name": "Повторения", "type": "раз", 'sp': true},
            {"name": "Время", "type": "сек", 'sp': true},
          ],
              'id': '1',
              'nameRu': 'Круги руками',
              'nameEng': ' Circles with hands',
              'descriptionRu':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'descriptionEn':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'link': '',
              'img': '',
              'video': '',
              'stage': '',
              'equipment': '',
              'musclegroups': '',
              'pocazatel1Name': '',
              'pocazatel1Type': '',
              'pocazatel1SPFlag': '',
              'pocazatel2Name': '',
              'pocazatel2Type': '',
              'pocazatel2SPFlag': '',
              'pocazatel3Name': '',
              'pocazatel3Type': '',
              'pocazatel3SPFlag': '',
              'pocazatel4Name': '',
              'pocazatel4Type': '',
              'pocazatel4SPFlag': '',
              'pocazatel5Name': '',
              'pocazatel5Type': '',
              'pocazatel5SPFlag': '',
            },
            {
          'sets': [
            {"name": "Повторения", "type": "раз", 'sp': true},
            {"name": "Время", "type": "сек", 'sp': true},
          ],
              'id': '1',
              'nameRu': 'Скручивание',
              'nameEng': ' Twisting',
              'descriptionRu':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'descriptionEn':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'link': '',
              'img': '',
              'video': '',
              'stage': '',
              'equipment': '',
              'musclegroups': '',
              'pocazatel1Name': '',
              'pocazatel1Type': '',
              'pocazatel1SPFlag': '',
              'pocazatel2Name': '',
              'pocazatel2Type': '',
              'pocazatel2SPFlag': '',
              'pocazatel3Name': '',
              'pocazatel3Type': '',
              'pocazatel3SPFlag': '',
              'pocazatel4Name': '',
              'pocazatel4Type': '',
              'pocazatel4SPFlag': '',
              'pocazatel5Name': '',
              'pocazatel5Type': '',
              'pocazatel5SPFlag': '',
            },
          ]
        }
      ]);
    } else {
      getx.setUserExercisesOnDay([]);
    }
  }



   void userTestsOnDay(String date) {
    if (int.parse(date.split('.')[0]) % 2 == 0) {
      getx.setTestsOnDay([
        {
          'sets': '',
          'id': '1',
          'name': 'Максимальный вес приседания с штангой на спине',
          'nameEng': ' Circles with hands',
          'descriptionRu':
              'Развивает мышцы плеч, спины и груди, улучшает осанку',
          'descriptionEn':
              'Развивает мышцы плеч, спины и груди, улучшает осанку',
          'link': '',
          'img': '',
          'video': '',
          'stage': '',
          'equipment': '',
          'musclegroups': '',
          'pocazatel1Name': '',
          'pocazatel1Type': '',
          'pocazatel1SPFlag': '',
          'pocazatel2Name': '',
          'pocazatel2Type': '',
          'pocazatel2SPFlag': '',
          'pocazatel3Name': '',
          'pocazatel3Type': '',
          'pocazatel3SPFlag': '',
          'pocazatel4Name': '',
          'pocazatel4Type': '',
          'pocazatel4SPFlag': '',
          'pocazatel5Name': '',
          'pocazatel5Type': '',
          'pocazatel5SPFlag': '',
        }
      ]) ;
    } else {
      getx.setTestsOnDay([
        {
          'sets': '',
          'id': '1',
          'name': 'Максимальный вес приседания с штангой на спине',
          'nameEng': ' Circles with hands',
          'descriptionRu':
              'Развивает мышцы плеч, спины и груди, улучшает осанку',
          'descriptionEn':
              'Развивает мышцы плеч, спины и груди, улучшает осанку',
          'link': '',
          'img': '',
          'video': '',
          'stage': '',
          'equipment': '',
          'musclegroups': '',
          'pocazatel1Name': '',
          'pocazatel1Type': '',
          'pocazatel1SPFlag': '',
          'pocazatel2Name': '',
          'pocazatel2Type': '',
          'pocazatel2SPFlag': '',
          'pocazatel3Name': '',
          'pocazatel3Type': '',
          'pocazatel3SPFlag': '',
          'pocazatel4Name': '',
          'pocazatel4Type': '',
          'pocazatel4SPFlag': '',
          'pocazatel5Name': '',
          'pocazatel5Type': '',
          'pocazatel5SPFlag': '',
        }
      ]);
    }
  }




}



const exercises = [
  {},
];
