
import 'package:flutter/material.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({super.key, required this.nutrition});
  final Map nutrition;

  @override
  State<Nutrition> createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  @override
  Widget build(BuildContext context) {
    final arguments = widget.nutrition;
    // print(arguments);
    // List <Map<String, dynamic>> sets = arguments['sets'];
    final vw = MediaQuery.of(context).size.width / 100;
    final vh = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
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
          maxLines: 150,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w500,
              fontSize: 5 * vw),
        ),
        backgroundColor: Colors.transparent, // Устанавливаем прозрачный фон
        flexibleSpace: Container(
          color: const Color(0xff1B1C20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            arguments['name1'] !='' && arguments['name1']!=null ? NutritionCard(card: {'name':arguments['name1'],'description':arguments['description1']}):SizedBox.shrink(),
            arguments['name2'] !='' && arguments['name2']!=null ? NutritionCard(card: {'name':arguments['name2'],'description':arguments['description2']}):SizedBox.shrink(),
            arguments['name3'] !='' && arguments['name3']!=null ? NutritionCard(card: {'name':arguments['name3'],'description':arguments['description3']}):SizedBox.shrink(),
            arguments['name4'] !='' && arguments['name4']!=null ? NutritionCard(card: {'name':arguments['name4'],'description':arguments['description4']}):SizedBox.shrink(),
            arguments['name5'] !='' && arguments['name5']!=null ? NutritionCard(card: {'name':arguments['name5'],'description':arguments['description5']}):SizedBox.shrink(),
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