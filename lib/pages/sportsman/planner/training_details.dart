import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trener_app/models/training.dart';
import 'package:trener_app/widgets/text/title.dart';

class TrainingDetails extends StatefulWidget {
  TrainingDetails({super.key, required this.training});
  Training training;

  @override
  State<TrainingDetails> createState() => _TrainingDetailsState();
}

class _TrainingDetailsState extends State<TrainingDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded), 
          onPressed: () { Get.back();},
        ),
        toolbarHeight: 100,
        title: MyTitleText(text: widget.training.name.toString()),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.info_outline,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
