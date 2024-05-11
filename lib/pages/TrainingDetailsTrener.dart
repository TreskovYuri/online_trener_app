import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrainingDetailsTrener extends StatefulWidget {
  const TrainingDetailsTrener({super.key});

  @override
  State<TrainingDetailsTrener> createState() => _TrainingDetailsTrenerState();
}

class _TrainingDetailsTrenerState extends State<TrainingDetailsTrener> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    final now = DateTime.now();
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    List<Map<String, dynamic>> sets = arguments['sets'];
    print(sets);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons
              .arrow_back_ios_new_rounded), // Устанавливаем иконку "домой" вместо стрелки "назад"
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
           Padding(
             padding: EdgeInsets.only(right: 2*vw),
             child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/img/read_icon.svg',
                        width: 2.6 * vh,
                      ),
                    ),
           ),
        ],
        toolbarHeight: 13 * vh,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${arguments['name']}',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  fontSize: 5 * vw),
            ),
            Text(
              '${NumToRus(now.weekday)} • ${now.day} ${MonthToRus(now.month)}',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  fontSize: 3 * vw),
            ),
          ],
        ),
        backgroundColor: Colors.transparent, // Устанавливаем прозрачный фон
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xff4D8AEE),
                Color(0xff2932FF)
              ], // Цвета радиального градиента
              center: Alignment.topLeft, // Центр радиального градиента
              radius: 3.5, // Радиус радиального градиента
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 3 * vh),
        child: ListView(
          children: [
            ...sets.map((e) => Container(
                  padding: EdgeInsets.all(3 * vw),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            e['name'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 5 * vw,
                              fontFamily: 'Manrope',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2*vh,),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'cет',
                              style: TextStyle(
                                color: const Color.fromARGB(
                                    124, 255, 255, 255),
                                fontSize: 3 * vw,
                                fontFamily: 'Manrope',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${e['pocazatel1Name']}',
                              style: TextStyle(
                                color: const Color.fromARGB(
                                    124, 255, 255, 255),
                                fontSize: 3 * vw,
                                fontFamily: 'Manrope',
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...e['sets'].asMap().entries.map((entry) {
                        int index = entry.key;
                        var el = entry.value;
                        return Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.all(2*vw),
                                padding: EdgeInsets.symmetric(vertical: 2*vh,horizontal: 3*vw),
                                decoration:BoxDecoration(
                                  color: Color(0xff23252B),
                                  borderRadius: BorderRadius.circular(4*vw)
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '${index+1}',
                                      style: TextStyle(color: Colors.white,
                                      fontSize: 3*vw,
                                      fontFamily: "Manrope",
                                      fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.all(2*vw),
                                padding: EdgeInsets.symmetric(vertical: 2*vh,horizontal: 3*vw),
                                decoration:BoxDecoration(
                                  color: Color(0xff23252B),
                                  borderRadius: BorderRadius.circular(4*vw)
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '${el['pokazatelOt']} - ${el['pokazatelDo']}',
                                      style: TextStyle(color: Colors.white,
                                      fontSize: 3*vw,
                                      fontFamily: "Manrope",
                                      fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                      SizedBox(height: 1*vh,),
                      e['link'].isNotEmpty?
                      Youtube(url: e['link']):Container()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

String NumToRus(int num) {
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

String MonthToRus(int num) {
  switch (num) {
    case 1:
      return 'января';
    case 2:
      return 'февраля';
    case 3:
      return 'марта';
    case 4:
      return 'апреля';
    case 5:
      return 'мая';
    case 6:
      return 'июня';
    case 7:
      return 'июля';
    case 8:
      return 'августа';
    case 9:
      return 'сентября';
    case 10:
      return 'октября';
    case 11:
      return 'ноября';
    case 12:
      return 'декабря';
    default:
      return ''; // Обработка неправильного ввода
  }
}



class Youtube extends StatefulWidget {
  Youtube({super.key, required this.url});
  String url;

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
late YoutubePlayerController _controller;

@override
  void initState() {
    super.initState();
      final VideoID = YoutubePlayer.convertUrlToId(widget.url);
    _controller = YoutubePlayerController(
      initialVideoId: VideoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,

      ),
    );
  }

 @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0), // Выберите желаемый радиус скругления
      child: YoutubePlayer(controller: _controller,bottomActions: [
                    CurrentPosition(),
                    ProgressBar(
                      isExpanded: true,
                      colors: const ProgressBarColors(
                          playedColor: Colors.red, handleColor: Colors.red),
                    )]),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}