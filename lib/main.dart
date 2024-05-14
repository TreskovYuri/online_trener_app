import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/pages/TrainingDetailsTrener.dart';
import 'package:trener_app/pages/TrainingFix.dart';
import 'package:trener_app/pages/calendar.dart';
import 'package:trener_app/pages/chats.dart';
import 'package:trener_app/pages/faq.dart';
import 'package:trener_app/pages/forgot.dart';
import 'package:trener_app/pages/journal.dart';
import 'package:trener_app/pages/loading.dart';
import 'package:trener_app/pages/login.dart';
import 'package:trener_app/pages/progress.dart';
import 'package:trener_app/pages/service.dart';
import 'package:trener_app/pages/nutrition.dart';
import 'package:trener_app/pages/planner.dart';
import 'package:trener_app/pages/profile.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/pages/trener_sportprogramm.dart';
import 'package:trener_app/pages/trener_tests.dart';
import 'package:trener_app/pages/trener_training_pattern.dart';
import 'package:trener_app/pages/trener_trainings.dart';
import 'package:trener_app/pages/trener_trainings_current_type.dart';
import 'package:trener_app/pages/workout.dart';
import 'package:trener_app/pages/workout_sheme.dart';
import 'dart:ui';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await GetStorage.init();
  initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Mobx(),
      child: GetMaterialApp(
        title: 'aad',
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      // themeMode: ThemeMode.system,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff1B1C20),
          fontFamily: 'Manrope',
  

        ),
        routes: {
          '/': (context) => const Loading(),
          '/login': (context) => const Login(),
          '/forgot': (context) => const Forgot(),
          '/planner': (context) => const Planner(),
          '/journal': (context) => const Journal(),
          '/calendar': (context) => const Calendar(),
          '/workout': (context) => const Workout(),
          '/workoutscheme': (context) => const WorkoutSheme(),
          '/service': (context) => const Service(),
          '/profile': (context) => const Profile(),
          '/chats': (context) => const Chats(),
          '/training_fix': (context) => const TrainingFix(),
          '/nutrition': (context) => const Nutrition(),
          '/user_progress': (context) => const UserProgress(),
          '/faq': (context) => const Faq(),
          '/training_details_trener': (context) => const TrainingDetailsTrener(),
          '/trener_trainings': (context) => const TrenerTrainings(),
          '/trener_trainings_current_type': (context) => const TrenerTrainingsCurrentsType(),
          '/trener_tests': (context) => const TrenerTests(),
          '/trener_training_pattern': (context) => const TrenerTrainingPattern(),
          '/trener_sportprogramm': (context) => const TrenerSportProgramm(),
        },
      ),
    );
  }
}


