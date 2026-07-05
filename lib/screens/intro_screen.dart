import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:islamy/data/intro_data.dart';
import 'package:islamy/utils/app_color.dart';
import 'package:islamy/utils/app_text_style.dart';
import 'package:islamy/utils/image_paths.dart';

import '../components/intro.dart';
import 'home_screen.dart';

class IntroScreen extends StatefulWidget {
  static const String routName = "introScreen";

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Future<void> finishIntro() async {
    final box = await Hive.openBox('myBox');
    await box.put('hasSeenIntro', true);
    if (mounted) {
      Navigator.pushReplacementNamed(context, HomeScreen.routName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            child: Image.asset(AppImagePaths.headerHome),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: introModels.length,
              itemBuilder: (context, index) {
                return intro(index);
              },
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    if (selectedIndex == 0) {
                      finishIntro();
                    } else {
                      introPreviousPage();
                    }
                  });
                },
                child: Text(
                  selectedIndex > 0 ? "Back" : "Skip",
                  style: AppTextStyles.font16Gold,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 10,
                    width: 80,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 5);
                      },
                      scrollDirection: .horizontal,
                      itemCount: introModels.length,
                      itemBuilder: (context, index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: selectedIndex == index ? 15 : 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? AppColors.gold
                                : AppColors.gray,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    if (selectedIndex == introModels.length - 1) {
                      finishIntro();
                    } else {
                      introNextPage();
                    }
                  });
                },
                child: Text(
                  selectedIndex == introModels.length - 1 ? "Finish" : "Next",
                  style: AppTextStyles.font16Gold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void introNextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void introPreviousPage() {
    pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routName);
  }
}
