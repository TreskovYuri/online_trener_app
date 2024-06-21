import 'package:flutter/material.dart';
import 'package:trener_app/pages/chat1/chats.dart';
import 'package:trener_app/pages/journal/journal.dart';
import 'package:trener_app/pages/sportsmans/sportsmans.dart';
import 'package:trener_app/widgets/stackWindPattern/StackWindPattern.dart';

class TrenerApp extends StatefulWidget {
  const TrenerApp({super.key});

  @override
  State<TrenerApp> createState() => _TrenerAppState();
}

class _TrenerAppState extends State<TrenerApp> {
  String page = 'Журнал';

  @override
  Widget build(BuildContext context) {
    return StackWindPattern(
      page: page,
      setPage: (newPage)=>setState(() {page=newPage;}),
      children: Column(
        children: [
          if(page=='Журнал')Journal(),
          if(page=='Спортсмены')Sportsmans(),
          if(page=='Чат')Chats(),
        ],
      ),);
  }
}