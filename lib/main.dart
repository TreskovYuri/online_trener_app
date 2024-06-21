import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:trener_app/app/app.dart';
import 'package:trener_app/mobx/mobx.dart';
import 'package:trener_app/constants/colors.dart';
import 'package:trener_app/pages/trener/lournal/TrainingDetailsTrener.dart';
import 'package:trener_app/pages/trener/sevice/sportprogramm/add_sportprogramm.dart';
import 'package:trener_app/pages/calendar.dart';
import 'package:trener_app/pages/chat/chats.dart';
import 'package:trener_app/pages/trener/sevice/faq/faq.dart';
import 'package:trener_app/pages/login/forgot.dart';
import 'package:trener_app/pages/trener/lournal/journal.dart';
import 'package:trener_app/pages/login/loading.dart';
import 'package:trener_app/pages/login/login.dart';
import 'package:trener_app/pages/trener/sportsmans/profile_one_user.dart';
import 'package:trener_app/pages/sportsman/progress.dart';
import 'package:trener_app/pages/service.dart';
import 'package:trener_app/pages/sportsman/planner/planner.dart';
import 'package:trener_app/pages/profile.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:trener_app/pages/trener/sportsmans/sportsmans.dart';
import 'package:trener_app/pages/trener/sevice/sportprogramm/trener_sportprogramm.dart';
import 'package:trener_app/pages/trener/sevice/faq/tests/trener_tests.dart';
import 'package:trener_app/pages/trener/sevice/training_pattern/trener_training_pattern.dart';
import 'package:trener_app/pages/trener/sevice/faq/training/trener_trainings.dart';
import 'package:trener_app/pages/trener/sevice/faq/training/trener_trainings_current_type.dart';
import 'package:trener_app/pages/sportsman/workout/workout.dart';
import 'package:trener_app/pages/sportsman/workout/workout_sheme.dart';



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
        title: 'Онлайн тренер',
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      // themeMode: ThemeMode.system,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: AppColors.blackThemeBacground,
            centerTitle: false
          ),
          scaffoldBackgroundColor: AppColors.blackThemeBacground,
          fontFamily: 'Manrope',
  

        ),
        routes: {
          '/': (context) => const Loading(),
          '/login': (context) => const Login(),
          '/forgot': (context) => const Forgot(),
          '/app': (context) => App(),
          '/planner': (context) => const Planner(),
          '/journal': (context) => const Journal(),
          '/calendar': (context) => Calendar(),
          '/workout': (context) => const Workout(),
          '/workoutscheme': (context) => const WorkoutSheme(),
          '/service': (context) => const Service(),
          '/profile': (context) => const Profile(),
          '/profile_one_user': (context) => const ProfileOneUser(),
          '/chats': (context) => const Chats(),
          '/user_progress': (context) => const UserProgress(),
          '/faq': (context) => const Faq(),
          '/training_details_trener': (context) => const TrainingDetailsTrener(),
          '/trener_trainings': (context) => const TrenerTrainings(),
          '/trener_trainings_current_type': (context) => const TrenerTrainingsCurrentsType(),
          '/trener_tests': (context) => const TrenerTests(),
          '/trener_training_pattern': (context) => const TrenerTrainingPattern(),
          '/trener_sportprogramm': (context) => const TrenerSportProgramm(),
          '/add_sportprogramm_page': (context) => const AddSportProgrammPage(),
          '/sportsmans': (context) => const Sportsmans(),
        },
      ),
    );
  }
}


