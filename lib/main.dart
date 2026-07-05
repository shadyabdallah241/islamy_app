import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islamy/screens/azkar_screen.dart';
import 'package:islamy/screens/home_screen.dart';
import 'package:islamy/screens/splash_screen.dart';
import 'package:islamy/screens/sura_details_screen.dart';
import 'package:islamy/utils/app_theme.dart';

import 'screens/intro_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("myBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routName,
      routes: {
        SplashScreen.routName: (context) => SplashScreen(),
        IntroScreen.routName: (context) => IntroScreen(),
        HomeScreen.routName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        AzkarScreen.routeName: (context) => AzkarScreen(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
