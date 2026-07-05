import 'package:flutter/material.dart';
import 'package:islamy/utils/image_paths.dart';
import '../components/bottom_nav_bar.dart';
import '../tabs/hadeth_tab.dart';
import '../tabs/quran_tab.dart';
import '../tabs/radio.dart';
import '../tabs/sebha.dart';
import '../tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  late final List<Widget> tabs = [
    QuranTab(),
    HadeethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> backgroundImages = [
    AppImagePaths.quranBG,
    AppImagePaths.hadethBG,
    AppImagePaths.sebhaBG,
    AppImagePaths.radioBG,
    AppImagePaths.timeBG,
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            backgroundImages[selectedIndex],
            width: double.infinity,
            height: double.infinity,
            fit: .cover,
          ),
          Container(color: Color.fromRGBO(0, 0, 0, 0.8)),
          Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(AppImagePaths.logo, width: width * 0.67),
                ),
                Expanded(child: tabs[selectedIndex]),
              ],
            ),
            bottomNavigationBar: AppBottomNavBar(
              selectedIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
