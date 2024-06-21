import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trener_app/app/SportsmanApp.dart';
import 'package:trener_app/app/TrenerApp.dart';
import 'package:trener_app/getx/MyUserConroller.dart';
import 'package:trener_app/service/helpers/isTrener.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final myUserCOntroller = Get.put(MyUserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IsTrener() ? const TrenerApp():const SportsmanApp(),
    );
  }
}