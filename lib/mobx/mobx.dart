import 'package:mobx/mobx.dart';
// flutter pub run build_runner watch
// Include generated file
part 'mobx.g.dart';

// This is the class used by rest of your codebase
// ignore: library_private_types_in_public_api
class Mobx = _Mobx with _$Mobx;

abstract class _Mobx with Store {
  @observable
  var exercises = [];
  var currentDate = '';
  var userExercises = [];
  String pageName = 'План';
  Map<String, dynamic> user = {};

  @action
  void setUserExercises(List<dynamic> exercises) {
    userExercises = exercises;
  }

  @action
  void setPageName(String name) {
    pageName = name;
  }

  @action
  void setCurrentDate(String date) {
    currentDate = date;
  }

  @action
  void setExercises(List<dynamic> exercise) {
    exercises = exercise;
  }

  @action
  void setUser(Map<String, dynamic> newUser) {
    user = newUser;
  }

  List<Map<dynamic, dynamic>> trenerUserExercisesOnDay(String date, int id) {
    if (id == 1) {
      return [
        {"name": "Силовая тренировка", 'type': "training", "id": 1},
        {"name": "Йога", 'type': "training", "id": 1},
        {
          "name": "Максимальный вес приседания с штангой на спине",
          'type': "test",
          "id": 1
        },
      ];
    } else if (id == 2) {
      return [
        {"name": "Силовая тренировка", 'type': "training", "id": 1},
        {
          "name": "Максимальный вес приседания с штангой на спине",
          'type': "test",
          "id": 1
        },
      ];
    } else if (id == 3) {
      return [
        {"name": "Силовая тренировка", 'type': "training", "id": 1},
      ];
    }
    return [];
  }

// Функция преобразует массив со взязями и массив с упражнениями в один общий массив
  @computed
  List get userExercisesOnFinal {
    var array = [];
    userExercises.forEach((element) {
      var ar = exercises.where((obj) => obj['id'] == element['exerciseId']);
      if (ar.isNotEmpty) {
        var finalAr = {
          'date': element['date'],
          'sets': element['sets'],
          'id': element['id'],
          'nameRu': ar.first['nameRu'],
          'nameEng': ar.first['nameEng'],
          'descriptionRu': ar.first['descriptionRu'],
          'descriptionEn': ar.first['descriptionEn'],
          'link': ar.first['link'],
          'img': ar.first['img'],
          'video': ar.first['video'],
          'stage': ar.first['stage'],
          'equipment': ar.first['equipment'],
          'musclegroups': ar.first['musclegroups'],
          'pocazatel1Name': ar.first['pocazatel1Name'],
          'pocazatel1Type': ar.first['pocazatel1Type'],
          'pocazatel1SPFlag': ar.first['pocazatel1SPFlag'],
          'pocazatel2Name': ar.first['pocazatel2Name'],
          'pocazatel2Type': ar.first['pocazatel2Type'],
          'pocazatel2SPFlag': ar.first['pocazatel2SPFlag'],
          'pocazatel3Name': ar.first['pocazatel3Name'],
          'pocazatel3Type': ar.first['pocazatel3Type'],
          'pocazatel3SPFlag': ar.first['pocazatel3SPFlag'],
          'pocazatel4Name': ar.first['pocazatel4Name'],
          'pocazatel4Type': ar.first['pocazatel4Type'],
          'pocazatel4SPFlag': ar.first['pocazatel4SPFlag'],
          'pocazatel5Name': ar.first['pocazatel5Name'],
          'pocazatel5Type': ar.first['pocazatel5Type'],
          'pocazatel5SPFlag': ar.first['pocazatel5SPFlag'],
        };
        array.add(finalAr);
      }
    });
    return array;
  }

// // Функция возвращает список упражнения по заданному дню
//   List<dynamic>  userExercisesOnDay (String date) {
//     return userExercisesOnFinal.where((exercise) => exercise['date'] == date).toList();
//   }

// Функция возвращает список упражнения по заданному дню
  @computed
  List<Map<String, dynamic>> trenerDataOnDay(String date) {
    if (int.parse(date.split('.')[0]) % 2 == 0 &&
        int.parse(date.split('.')[0]) % 2 != 0) {
      return [
        {
          "username": "Миронов А.В.",
          'id': 1,
          "date": "06.05.2024",
          "post": "Вратарь",
          "team": "СКА",
          "state": [
            {
              'sets': '',
              'id': '1',
              'name': 'Силовая тренировка',
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
              'sets': '',
              'name': 'Йога',
              'id': 2,
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
          "username": "Никонов И.Ф.",
          "date": "06.05.2024",
          "post": "Крайний нападающий",
          'id': 2,
          "team": "СКА",
          "state": [
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
          ]
        },
        {
          "username": "Никонов И.Ф.",
          "date": "06.05.2024",
          "post": "Крайний нападающий",
          'id': 3,
          "team": "СКА",
          "state": [
            {
              'sets': '',
              'id': '1',
              'name': 'Йога',
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
            },
            {
              'sets': '',
              'id': '1',
              'name': 'Еда за день',
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
          ]
        },
      ];
    } else {
      return [
        {
          "username": "Никонов И.Ф.",
          "post": "Вратарь",
          "date": "06.05.2024",
          'id': 1,
          "team": "СКА",
          "state": [
            {
              'id': '1',
              'type': "nutrition",
              'name': 'Еда за день',
              'nameEng': ' Circles with hands',
              'descriptionRu':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'descriptionEn':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'link': '',
              'img': '',
              'video': '',
              'stage': '',
              'sets': [
                {
                  'sets': '',
                  'id': '1',
                  'name': 'Махи руками',
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
                {
                  'sets': '',
                  'id': '1',
                  'name': 'Скручивания',
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
                  'pocazatel1Name': 'Колличество',
                  'pocazatel1Type': 'раз',
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
                  'sets': '',
                  'id': '1',
                  'name': 'Бег',
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
              ],
            },
            {
              'id': '1',
              'name': 'Йога',
              'type': "training",
              'nameEng': ' Twisting',
              'descriptionRu':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'descriptionEn':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'link': '',
              'img': '',
              'video': '',
              'stage': '',
              'sets': [
                {
                  'sets': [
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Махи руками',
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
                  'pocazatel1Name': 'Колличество',
                  'pocazatel1Type': 'раз',
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
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Скручивания',
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
                  'pocazatel1Name': 'Колличество',
                  'pocazatel1Type': 'раз',
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
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    },
                    {
                      "set": 2,
                      "pokazatelOt": "50",
                      "pokazatelDo": "60",
                    },
                    {
                      "set": 2,
                      "pokazatelOt": "60",
                      "pokazatelDo": "70",
                    }
                  ],
                  'id': '1',
                  'name': 'Бег',
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
                  'pocazatel1Name': 'Время',
                  'pocazatel1Type': 'сек',
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
              ],
            },
          ]
        },
        {
          "username": "Крюков А.М.",
          "date": "06.05.2024",
          "post": "Крайний нападающий",
          'id': 2,
          "team": "СКА",
          "state": [
            {
              'sets': [
                {
                  'sets': [
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    },
                    {
                      "set": 1,
                      "pokazatelOt": "50",
                      "pokazatelDo": "60",
                    }
                  ],
                  'id': '1',
                  'name': 'Махи руками',
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
                  'pocazatel1Name': 'Колличество',
                  'pocazatel1Type': 'раз',
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
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    },{
                      "set": 2,
                      "pokazatelOt": "30",
                      "pokazatelDo": "40",
                    },{
                      "set": 3,
                      "pokazatelOt": "50",
                      "pokazatelDo": "60",
                    }
                  ],
                  'id': '1',
                  'name': 'Скручивания',
                  'nameEng': ' Twisting',
                  'descriptionRu':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'descriptionEn':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'link': 'https://youtu.be/loD8xnlmdhY?si=nu3PLF-Lvi5rMRGR',
                  'img': '',
                  'video': '',
                  'stage': '',
                  'equipment': '',
                  'musclegroups': '',
                  'pocazatel1Name': 'Колличество',
                  'pocazatel1Type': 'раз',
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
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Бег',
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
                  'pocazatel1Name': 'Время',
                  'pocazatel1Type': 'сек',
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
              ],
              'id': '1',
              'type': "training",
              'name': 'Силовой тренинг',
              'nameEng': ' Circles with hands',
              'descriptionRu':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'descriptionEn':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'link': '',
              'img': '',
              'video': '',
              'stage': '',
            },
            {
              'sets': [
                {
                  'sets': [
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Махи руками',
                  'nameEng': ' Twisting',
                  'descriptionRu':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'descriptionEn':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'link': 'https://youtu.be/hP25aVmxkP8?si=9ZHVwB5Nt8TydQPd',
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
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Скручивания',
                  'nameEng': ' Twisting',
                  'descriptionRu':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'descriptionEn':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'link': 'https://youtu.be/loD8xnlmdhY?si=nu3PLF-Lvi5rMRGR',
                  'img': '',
                  'video': '',
                  'stage': '',
                  'equipment': '',
                  'musclegroups': '',
                  'pocazatel1Name': 'Колличество',
                  'pocazatel1Type': 'раз',
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
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Бег',
                  'nameEng': ' Twisting',
                  'descriptionRu':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'descriptionEn':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'link': 'https://youtu.be/hP25aVmxkP8?si=9ZHVwB5Nt8TydQPd',
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
              ],
              'id': '1',
              'name': 'Йога',
              'type': "training",
              'nameEng': ' Twisting',
              'descriptionRu':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'descriptionEn':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'link': '',
              'img': '',
              'video': '',
              'stage': '',
              'sets': [
                {
                  'sets': [
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Махи руками',
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
                {
                  'sets': [
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Скручивания',
                  'nameEng': ' Twisting',
                  'descriptionRu':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'descriptionEn':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'link': 'https://youtu.be/loD8xnlmdhY?si=nu3PLF-Lvi5rMRGR',
                  'img': '',
                  'video': '',
                  'stage': '',
                  'equipment': '',
                  'musclegroups': '',
                  'pocazatel1Name': 'Колличество',
                  'pocazatel1Type': 'раз',
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
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Бег',
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
              ],
            },
          ]
        },
        {
          "username": "Миронов А.М.",
          "date": "06.05.2024",
          "post": "Крайний нападающий",
          'id': 2,
          "team": "СКА",
          "state": [
            {
              'sets': [
                {
                  'sets': [
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Махи руками',
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
                {
                  'sets': [
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Скручивания',
                  'nameEng': ' Twisting',
                  'descriptionRu':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'descriptionEn':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'link': 'https://youtu.be/loD8xnlmdhY?si=nu3PLF-Lvi5rMRGR',
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
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Бег',
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
              ],
              'id': '1',
              'name': 'Тренировка на выносливость',
              'type': "training",
              'nameEng': ' Circles with hands',
              'descriptionRu':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'descriptionEn':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'link': '',
              'img': '',
              'video': '',
              'stage': '',
              'sets': [
                {
                  'sets': [
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Махи руками',
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
                {
                  'sets': [
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Скручивания',
                  'nameEng': ' Twisting',
                  'descriptionRu':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'descriptionEn':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'link': 'https://youtu.be/loD8xnlmdhY?si=nu3PLF-Lvi5rMRGR',
                  'img': '',
                  'video': '',
                  'stage': '',
                  'equipment': '',
                  'musclegroups': '',
                  'pocazatel1Name': 'Колличество',
                  'pocazatel1Type': 'раз',
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
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Бег',
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
              ],
            },
            {
              'sets': [
                {
                  'sets': [
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Махи руками',
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
                {
                  'sets': [
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Скручивания',
                  'nameEng': ' Twisting',
                  'descriptionRu':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'descriptionEn':
                      'Развивает мышцы плеч, спины и груди, улучшает осанку',
                  'link': 'https://youtu.be/loD8xnlmdhY?si=nu3PLF-Lvi5rMRGR',
                  'img': '',
                  'video': '',
                  'stage': '',
                  'equipment': '',
                  'musclegroups': '',
                  'pocazatel1Name': 'Колличество',
                  'pocazatel1Type': 'раз',
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
                    {
                      "set": 1,
                      "pokazatelOt": "40",
                      "pokazatelDo": "50",
                    }
                  ],
                  'id': '1',
                  'name': 'Бег',
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
              ],
              'id': '1',
              'name': 'Растяжка',
              'type': "training",
              'nameEng': ' Twisting',
              'descriptionRu':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'descriptionEn':
                  'Развивает мышцы плеч, спины и груди, улучшает осанку',
              'link': '',
              'img': '',
              'video': '',
              'stage': '',
            },
          ]
        }
      ];
    }
  }

  @computed
  List<Map<dynamic, dynamic>> exercisesOnTrainingId(int id) {
    return [
      {
        'sets': '',
        'id': '1',
        'nameRu': 'Круги руками',
        'prevSets': "3X15",
        'prevVes': "20кг",
        'prevTime': "40",
        'nameEng': ' Circles with hands',
        'descriptionRu':
            'Развивает мышцы плеч, спины и груди, улучшает осанку, Развивает мышцы плеч, спины и груди, улучшает осанку, Развивает мышцы плеч, спины и груди, улучшает осанку',
        'descriptionEn': 'Развивает мышцы плеч, спины и груди, улучшает осанку',
        'link': 'https://youtu.be/qttcSh1Ld70?si=vLnjLfSEDj2MPX2K',
        'img': '9811ef87-a51a-4c53-8e13-85b6539ede97.png',
        'video': 'https://youtu.be/YMx8Bbev6T4?si=R9qEwkH0wmGImgii',
        'stage': ['Роллер', 'Стена', 'Стул'],
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
        'sets': '',
        'id': '2',
        'prevSets': "2X25",
        'prevVes': "20кг",
        'prevTime': "40",
        'nameRu': 'Жим лежа',
        'nameEng': ' Circles with hands',
        'descriptionRu': 'Развивает мышцы плеч, спины и груди, улучшает осанку',
        'descriptionEn': 'Развивает мышцы плеч, спины и груди, улучшает осанку',
        'link': 'https://youtu.be/rIZirGYcbD8?si=tfEicSvO7Lm6yVt2',
        'img': '0c50cda7-8543-492c-8d92-840921bf7c4e.jpg',
        'video': 'https://youtu.be/YMx8Bbev6T4?si=R9qEwkH0wmGImgii',
        'stage': ['Роллер', 'Стена', 'Стул'],
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
        'sets': '',
        'prevSets': "4X10 50",
        'prevVes': "20кг",
        'prevTime': "40",
        'id': '3',
        'nameRu': 'Скручивание на пресс',
        'nameEng': ' Circles with hands',
        'descriptionRu': 'Развивает мышцы плеч, спины и груди, улучшает осанку',
        'descriptionEn': 'Развивает мышцы плеч, спины и груди, улучшает осанку',
        'link': 'https://youtu.be/H8xSHCAjM-I?si=s6QZEa06Jb5vD00-',
        'img': '6411cec5-9276-490e-8b9a-a718f3dfd97d.jpg',
        'video': '',
        'stage': ['Роллер', 'Стена', 'Стул'],
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
    ];
  }

// Функция возвращает список упражнения по заданному дню
  @computed
  List<Map<dynamic, dynamic>> userExercisesOnDay(String date) {
    if (int.parse(date.split('.')[0]) % 2 == 0) {
      return [
        {
          "name": "Йога",
          'id': 1,
          "date": "06.05.2024",
          'stage': ['Стена', 'Стул'],
          'img':
              "http://web-hub.pro:5004/assets/0c50cda7-8543-492c-8d92-840921bf7c4e.jpg",
          'description':
              'Йога — это ряд упражнений с собственным весом или отягощением. Их основной целью является увеличение силы мышц и развитие выносливости тела.Все силовые направления выполняются в достаточно интенсивном темпе, и цели у них, как правило, жиросжигание, тонус мышц, активная работа дыхательной и сердечно-сосудистой систем.Основная цель занятий на растяжку - гибкость, эластичность, работа с дыханием, улучшение кровотока и снятие напряжения.',
          "exercises": [
            {
              'sets': '',
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
              'sets': '',
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
              'sets': '',
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
              'sets': '',
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
      ];
    } else {
      return [
        // {
        //   "name": "Йога",
        //   'id': 1,
        //   "date": "06.05.2024",
        //   'stage': ['Стена', 'Стул'],
        //   'img':"http://web-hub.pro:5004/assets/0c50cda7-8543-492c-8d92-840921bf7c4e.jpg",
        //   'description':'Йога — это ряд упражнений с собственным весом или отягощением. Их основной целью является увеличение силы мышц и развитие выносливости тела.Все силовые направления выполняются в достаточно интенсивном темпе, и цели у них, как правило, жиросжигание, тонус мышц, активная работа дыхательной и сердечно-сосудистой систем.Основная цель занятий на растяжку - гибкость, эластичность, работа с дыханием, улучшение кровотока и снятие напряжения.',
        //   "exercises": [
        //     {
        //       'sets': '',
        //       'id': '1',
        //       'nameRu': 'Круги руками',
        //       'nameEng': ' Circles with hands',
        //       'descriptionRu':
        //           'Развивает мышцы плеч, спины и груди, улучшает осанку',
        //       'descriptionEn':
        //           'Развивает мышцы плеч, спины и груди, улучшает осанку',
        //       'link': '',
        //       'img': '',
        //       'video': '',
        //       'stage': '',
        //       'equipment': '',
        //       'musclegroups': '',
        //       'pocazatel1Name': '',
        //       'pocazatel1Type': '',
        //       'pocazatel1SPFlag': '',
        //       'pocazatel2Name': '',
        //       'pocazatel2Type': '',
        //       'pocazatel2SPFlag': '',
        //       'pocazatel3Name': '',
        //       'pocazatel3Type': '',
        //       'pocazatel3SPFlag': '',
        //       'pocazatel4Name': '',
        //       'pocazatel4Type': '',
        //       'pocazatel4SPFlag': '',
        //       'pocazatel5Name': '',
        //       'pocazatel5Type': '',
        //       'pocazatel5SPFlag': '',
        //     },
        //     {
        //       'sets': '',
        //       'id': '1',
        //       'nameRu': 'Скручивание',
        //       'nameEng': ' Twisting',
        //       'descriptionRu':
        //           'Развивает мышцы плеч, спины и груди, улучшает осанку',
        //       'descriptionEn':
        //           'Развивает мышцы плеч, спины и груди, улучшает осанку',
        //       'link': '',
        //       'img': '',
        //       'video': '',
        //       'stage': '',
        //       'equipment': '',
        //       'musclegroups': '',
        //       'pocazatel1Name': '',
        //       'pocazatel1Type': '',
        //       'pocazatel1SPFlag': '',
        //       'pocazatel2Name': '',
        //       'pocazatel2Type': '',
        //       'pocazatel2SPFlag': '',
        //       'pocazatel3Name': '',
        //       'pocazatel3Type': '',
        //       'pocazatel3SPFlag': '',
        //       'pocazatel4Name': '',
        //       'pocazatel4Type': '',
        //       'pocazatel4SPFlag': '',
        //       'pocazatel5Name': '',
        //       'pocazatel5Type': '',
        //       'pocazatel5SPFlag': '',
        //     },
        //   ]
        // },
        // {
        //   "name": "Силовая тренировка",
        //   'id': 2,
        //   "date": "06.05.2024",
        //   'stage': ['Роллер', 'Стена', 'Стул'],
        //   'img':"http://web-hub.pro:5004/assets/9811ef87-a51a-4c53-8e13-85b6539ede97.png",
        //   'description':
        // 'Силовая тренировка — это ряд упражнений с собственным весом или отягощением. Их основной целью является увеличение силы мышц и развитие выносливости тела.Все силовые направления выполняются в достаточно интенсивном темпе, и цели у них, как правило, жиросжигание, тонус мышц, активная работа дыхательной и сердечно-сосудистой систем.Основная цель занятий на растяжку - гибкость, эластичность, работа с дыханием, улучшение кровотока и снятие напряжения.',
        //   "exercises": [
        //     {
        //       'sets': '',
        //       'id': '1',
        //       'nameRu': 'Круги руками',
        //       'nameEng': ' Circles with hands',
        //       'descriptionRu':
        //           'Развивает мышцы плеч, спины и груди, улучшает осанку',
        //       'descriptionEn':
        //           'Развивает мышцы плеч, спины и груди, улучшает осанку',
        //       'link': '',
        //       'img': '',
        //       'video': '',
        //       'stage': '',
        //       'equipment': '',
        //       'musclegroups': '',
        //       'pocazatel1Name': '',
        //       'pocazatel1Type': '',
        //       'pocazatel1SPFlag': '',
        //       'pocazatel2Name': '',
        //       'pocazatel2Type': '',
        //       'pocazatel2SPFlag': '',
        //       'pocazatel3Name': '',
        //       'pocazatel3Type': '',
        //       'pocazatel3SPFlag': '',
        //       'pocazatel4Name': '',
        //       'pocazatel4Type': '',
        //       'pocazatel4SPFlag': '',
        //       'pocazatel5Name': '',
        //       'pocazatel5Type': '',
        //       'pocazatel5SPFlag': '',
        //     },
        //     {
        //       'sets': '',
        //       'id': '1',
        //       'nameRu': 'Скручивание',
        //       'nameEng': ' Twisting',
        //       'descriptionRu':
        //           'Развивает мышцы плеч, спины и груди, улучшает осанку',
        //       'descriptionEn':
        //           'Развивает мышцы плеч, спины и груди, улучшает осанку',
        //       'link': '',
        //       'img': '',
        //       'video': '',
        //       'stage': '',
        //       'equipment': '',
        //       'musclegroups': '',
        //       'pocazatel1Name': '',
        //       'pocazatel1Type': '',
        //       'pocazatel1SPFlag': '',
        //       'pocazatel2Name': '',
        //       'pocazatel2Type': '',
        //       'pocazatel2SPFlag': '',
        //       'pocazatel3Name': '',
        //       'pocazatel3Type': '',
        //       'pocazatel3SPFlag': '',
        //       'pocazatel4Name': '',
        //       'pocazatel4Type': '',
        //       'pocazatel4SPFlag': '',
        //       'pocazatel5Name': '',
        //       'pocazatel5Type': '',
        //       'pocazatel5SPFlag': '',
        //     },
        //   ]
        // }
      ];
    }
  }

// Функция возвращает список упражнения по заданному дню
  @computed
  List<Map<dynamic, dynamic>> userTestsOnDay(String date) {
    if (int.parse(date.split('.')[0]) % 2 == 0) {
      return [
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
      ];
    } else {
      return [
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
      ];
    }
  }

// Функция возвращает список упражнения по заданному дню
  @computed
  List<Map<dynamic, dynamic>> userFixResultsOnDay(String date) {
    if (int.parse(date.split('.')[0]) % 2 == 0) {
      return [
        {
          'sets': '',
          'id': '1',
          'name': 'Взвешивание',
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
      ];
    } else {
      return [
        {
          'sets': '',
          'id': '1',
          'name': 'Взвешивание',
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
      ];
    }
  }

// Функция возвращает список упражнения по заданному дню
  @computed
  List<Map<dynamic, dynamic>> userNutritionsOnDay(String date) {
    if (int.parse(date.split('.')[0]) % 2 == 0) {
      return [
        {
          'sets': [
            {
              'name': "Завтрак",
              'description':
                  "Омлет или яичница 4 белка, 2 желтка если на выезде и нет возможно сти отделить белки от желтков, то просто умеренно"
            },
            {
              'name': "Обед",
              'description':
                  "Омлет или яичница 4 белка, 2 желтка если на выезде и нет возможно сти отделить белки от желтков, то просто умеренно"
            },
            {
              'name': "Ужин",
              'description':
                  "Омлет или яичница 4 белка, 2 желтка если на выезде и нет возможно сти отделить белки от желтков, то просто умеренно"
            },
          ],
          'id': '1',
          'name': 'Еда за день',
          'nameEng': ' Circles with hands',
          'description': 'Развивает мышцы плеч, спины и груди, улучшает осанку',
          'link': '',
          'img': '',
          'video': '',
        }
      ];
    } else {
      return [
        {
          'sets': [
            {
              'name': "Завтрак",
              'description':
                  "Омлет или яичница 4 белка, 2 желтка если на выезде и нет возможно сти отделить белки от желтков, то просто умеренно"
            },
            {
              'name': "Обед",
              'description':
                  "Омлет или яичница 4 белка, 2 желтка если на выезде и нет возможно сти отделить белки от желтков, то просто умеренно"
            },
            {
              'name': "Ужин",
              'description':
                  "Омлет или яичница 4 белка, 2 желтка если на выезде и нет возможно сти отделить белки от желтков, то просто умеренно"
            },
          ],
          'id': '1',
          'name': 'Еда за день',
          'nameEng': ' Circles with hands',
          'description': 'Развивает мышцы плеч, спины и груди, улучшает осанку',
          'link': '',
          'img': '',
          'video': '',
        }
      ];
    }
  }

// Функция возвращает список упражнения по заданному дню
  @computed
  List<Map<dynamic, dynamic>> userConsultationsOnDay(String date) {
    if (int.parse(date.split('.')[0]) % 2 == 0) {
      return [];
    } else {
      return [
        {
          'sets': '',
          'id': '1',
          'name': 'Консультация по приему спортивных добавок',
          "date": "",
          "time": "10:30",
          'trenerName': 'Миронов А.В.',
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
      ];
    }
  }

// Функция возвращает список упражнения по заданному дню
  @computed
  List<Map<dynamic, dynamic>> userNutritionsPriemOnDay(String date) {
    if (int.parse(date.split('.')[0]) % 2 == 0) {
      return [
        {
          'sets': '',
          'id': '1',
          'name': 'Протеин',
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
          'sets': '',
          'id': '1',
          'name': 'Витамин D',
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
      ];
    } else {
      return [
        {
          'sets': '',
          'id': '1',
          'name': 'Протеин',
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
          'sets': '',
          'id': '1',
          'name': 'Витамин D',
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
      ];
    }
  }
}
