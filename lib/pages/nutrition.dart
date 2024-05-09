import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({super.key});

  @override
  State<Nutrition> createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  @override
  Widget build(BuildContext context) {
    final arguments =ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    List <Map<String, dynamic>> sets = arguments['sets'];
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
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
        toolbarHeight: 10 * vh,
        title: Text(
          '${arguments['name']}',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w500,
              fontSize: 5 * vw),
        ),
        backgroundColor: Colors.transparent, // Устанавливаем прозрачный фон
        flexibleSpace: Container(
          color: Color(0xff1B1C20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...sets.map((e) => NutritionCard(card: e))
          ],
        ),
      ),
    );
  }
}



class NutritionCard extends StatefulWidget {
  Map card;
  NutritionCard({super.key, required this.card});

  @override
  State<NutritionCard> createState() => _NutritionCardState();
}

class _NutritionCardState extends State<NutritionCard> {
  @override
  Widget build(BuildContext context) {
  final vh = MediaQuery.of(context).size.height / 100;
    return Padding(
      padding: EdgeInsets.all(2*vh),
      child: Column(
        children: [
          Row(
            children: [
              Text(widget.card['name'],style: TextStyle(color: Colors.white,fontSize: 2*vh),
              ),
            ],
          ),
          SizedBox(height: 2*vh,),
          Text(widget.card['description'],style: TextStyle(color: const Color.fromARGB(178, 255, 255, 255),fontSize: 1.5*vh),)
        ],
      ),
    );
  }
}