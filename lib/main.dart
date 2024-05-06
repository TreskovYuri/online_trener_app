import 'package:flutter/material.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/pages/calendar.dart';
import 'package:trener_app/pages/chats.dart';
import 'package:trener_app/pages/forgot.dart';
import 'package:trener_app/pages/journal.dart';
import 'package:trener_app/pages/loading.dart';
import 'package:trener_app/pages/login.dart';
import 'package:trener_app/pages/planner.dart';
import 'package:trener_app/pages/profile.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Mobx(),
      child: MaterialApp(
        initialRoute: '/',
        theme: ThemeData(),
        routes: {
          '/': (context) => const Loading(),
          '/login': (context) => const Login(),
          '/forgot': (context) => const Forgot(),
          '/planner': (context) => const Planner(),
          '/journal': (context) => const Journal(),
          '/calendar': (context) => const Calendar(),
          '/chat': (context) => const Chats(),
          '/profile': (context) => const Profile(),
        },
      ),
    );
  }
}