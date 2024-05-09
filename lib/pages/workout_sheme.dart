import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:trener_app/widgets/service/navbar.dart';


class WorkoutSheme extends StatelessWidget {
  const WorkoutSheme({Key? key}) : super(key: key);
 
  static List<Map<dynamic,dynamic>> DaysArray = [
    {
      'date':"01.02.2024",
      'stage': ['Стена', 'Стул'],
      'img':"http://web-hub.pro:5004/assets/0c50cda7-8543-492c-8d92-840921bf7c4e.jpg",
      'description':'''Йога — это ряд упражнений с собственным весом или отягощением. Их основной целью является 
      увеличение силы мышц и развитие выносливости тела.Все силовые направления выполняются в достаточно интенсивном 
      темпе, и цели у них, как правило, жиросжигание, тонус мышц, активная работа дыхательной и сердечно-сосудистой 
      систем.Основная цель занятий на растяжку - гибкость, эластичность, работа с дыханием, улучшение кровотока и 
      снятие напряжения.''',
      "sets":[
        {
          "name":"Йога",
          "type":"training",
        },        {
          "name":"Силовая тренировка",
          "type":"training",
        },        {
          "name":"Максимальный вес приседания",
          "type":"test",
        },
      ]
    },    {
      'date':"02.02.2024",
      'stage': ['Стена', 'Стул'],
      'img':"http://web-hub.pro:5004/assets/0c50cda7-8543-492c-8d92-840921bf7c4e.jpg",
      'description':'''Йога — это ряд упражнений с собственным весом или отягощением. Их основной целью является 
      увеличение силы мышц и развитие выносливости тела.Все силовые направления выполняются в достаточно интенсивном 
      темпе, и цели у них, как правило, жиросжигание, тонус мышц, активная работа дыхательной и сердечно-сосудистой 
      систем.Основная цель занятий на растяжку - гибкость, эластичность, работа с дыханием, улучшение кровотока и 
      снятие напряжения.''',
      "sets":[
        {
          "name":"Йога",
          "type":"training",
        },        {
          "name":"Силовая тренировка",
          "type":"training",
        }
      ]
    },    {
      'date':"03.02.2024",
      'stage': ['Стена', 'Стул'],
      'img':"http://web-hub.pro:5004/assets/0c50cda7-8543-492c-8d92-840921bf7c4e.jpg",
      'description':'''Йога — это ряд упражнений с собственным весом или отягощением. Их основной целью является 
      увеличение силы мышц и развитие выносливости тела.Все силовые направления выполняются в достаточно интенсивном 
      темпе, и цели у них, как правило, жиросжигание, тонус мышц, активная работа дыхательной и сердечно-сосудистой 
      систем.Основная цель занятий на растяжку - гибкость, эластичность, работа с дыханием, улучшение кровотока и 
      снятие напряжения.''',
      "sets":[
        {
          "name":"Йога",
          "type":"training",
        }
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 10 * vh,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          color: Color(0xff1B1C20),
        ),
        centerTitle: true,
        title: Nav(firstDate: DaysArray.first['date'],lastDate:DaysArray.last['date'] ,),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: const Color(0xff1B1C20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WorkoutShemeOnDay(array: DaysArray,)
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  const Navbar(),
    );
  }
}


// Шапка
class Nav extends StatelessWidget {
  final String  firstDate;
  final String  lastDate;
  Nav({super.key,required this.firstDate,required this.lastDate});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    return Column(
            children: [Text(
              "Схема тренировок",
              style: TextStyle(
                  color: Color.fromARGB(223, 236, 236, 236),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 5 * vw),
            ),
            Text(
              "${firstDate} - ${lastDate}",
              style: TextStyle(
                  color: Color.fromARGB(148, 255, 255, 255),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 3 * vw),
            ),
      ]);
  }
}


// Карточки
class WorkoutShemeOnDay extends StatelessWidget {
  final array ;
  const WorkoutShemeOnDay({super.key,required this.array});

  

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    return Container(
      padding: EdgeInsets.only( right: 5*vw, left: 5*vw, bottom: 5*vw),
      child: Column(
        children: [
          ...array.asMap().entries.map((entry)=>DayCard(day: entry.key,map: entry.value)),
      ]),
    );
  }
}



class DayCard extends StatefulWidget {
  final int day;
  final Map<dynamic,dynamic> map;
  const DayCard({super.key, required this.day,required this.map});

  @override
  State<DayCard> createState() => _DayCardState(); 
}

class _DayCardState extends State<DayCard> {
    bool modal = false;
  @override
  Widget build(BuildContext context) {
  final vw = MediaQuery.of(context).size.width / 100;
  final vh = MediaQuery.of(context).size.height / 100;
  
    return Padding(
          padding: EdgeInsets.only(top: 10*vw),
          child: Column(
            children: [
              GestureDetector(
                onTap: ()=> setState(() {modal=!modal;}),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.day+1} день",
                          style: TextStyle(
                              color: Color.fromARGB(202, 255, 255, 255),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: 5 * vw),
                        ),
                        SizedBox(width:20),
                         modal
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              modal = !modal;
                                            });
                                          },
                                          icon: const Icon(Icons
                                              .arrow_forward_ios_rounded), // Иконка
                                          iconSize: 4 * vw,
                                        )
                                      : IconButton(
                                          onPressed: () {
                                            setState(() {
                                              setState(() {
                                                modal = !modal;
                                              });
                                            });
                                          },
                                          icon: const Icon(Icons
                                              .keyboard_arrow_down_rounded), // Иконка
                                          iconSize: 6 * vw,
                                        ),
                      ],
                    ),
                   Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                colors: [
                  Color(0xFF4D8AEE),
                  Color(0xFF2932FF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.circular(20.0), // Скругление углов
                  ),
                  padding: EdgeInsets.only(
                    top: 0.3 * vw,
                    bottom: 0.3 * vw,
                    left: 6 * vw,
                    right: 6 * vw,
                  ),
                  child: Text(
                    "${widget.map['sets'].length.toString()}",
                    style: TextStyle(
                color: Color.fromARGB(202, 255, 255, 255),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
                fontSize: 4 * vw,
                    ),
                  ),
                ),
                
                  ],
                ),
              ),
            modal?Column(
              children: [
                ...widget.map['sets'].map((e){
                  final uniqueKey = UniqueKey();
                              return GestureDetector(
                                onTap: () {
                                  // Обработчик нажатия
                                  // Navigator.pushNamed(
                                  //   context,
                                  //   arguments: e,
                                  //   '/workout', // Переход на login
                                  // );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 1 * vh),
                                  child: Slidable(
                                    key: uniqueKey,
                                    endActionPane: ActionPane(
                                        motion: const BehindMotion(),
                                        key: uniqueKey,
                                        dismissible: DismissiblePane(
                                          key: UniqueKey(),
                                          onDismissed: () => print('delete'),
                                        ),
                                        children: [
                                          SlidableAction(
                                            onPressed: (context) {},
                                            backgroundColor: Colors.red,

                                            // icon: Icons.delete,
                                            label: "Отменить",
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          )
                                        ]),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1 * vw, horizontal: 3 * vw),
                                      decoration: BoxDecoration(
                                          color: Color(0xff23252B),
                                          borderRadius:
                                              BorderRadius.circular(5 * vw)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            e['name'].toString(),
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    210, 255, 255, 255),
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w600,
                                                decoration: TextDecoration.none,
                                                fontSize: 3 * vw),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                modal = !modal;
                                              });
                                            },
                                            icon: const Icon(Icons
                                                .arrow_forward_ios_rounded), // Иконка
                                            iconSize: 4 * vw,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                })
              ],
            ):Container()
            ],
          ),
        );
  }
}
