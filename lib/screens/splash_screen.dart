import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:islamy/screens/home_screen.dart';
import 'package:islamy/screens/intro_screen.dart';
import 'package:islamy/utils/app_color.dart';
import 'package:islamy/utils/image_paths.dart';

class SplashScreen extends StatefulWidget {
  static const String routName = "splashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToIntro();
  }

  Future<void> navigateToIntro() async {
    await Future.delayed(Duration(seconds: 3));
    final box = await Hive.openBox("myBox");
    bool hasSeenIntro = box.get("hasSeenIntro", defaultValue: false);
    if (hasSeenIntro) {
      Navigator.pushReplacementNamed(context, HomeScreen.routName);
    } else {
      Navigator.pushReplacementNamed(context, IntroScreen.routName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Align(
            alignment: .center,
            child: Image.asset(AppImagePaths.splashLogo, width: 185),
          ),
          Align(
            alignment: .bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Image.asset(AppImagePaths.splashBranding, width: 250),
            ),
          ),
        ],
      ),
    );
  }
}
