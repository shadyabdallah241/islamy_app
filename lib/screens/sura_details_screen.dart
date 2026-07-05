import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:islamy/screens/surah_details_lines_screen.dart';
import 'package:islamy/utils/app_color.dart';
import 'package:islamy/utils/app_text_style.dart';
import 'package:islamy/utils/image_paths.dart';

import '../data/quran_data.dart';

class SuraDetails extends StatelessWidget {
  static const routeName = "SuraDetails";

  const SuraDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        scrolledUnderElevation: 0.0,
        leading: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: AppColors.gold),
        ),
        centerTitle: true,
        title: Text(
          quranSuras[index].englishName,
          textAlign: TextAlign.center,
          style: AppTextStyles.font24Gold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Image.asset(AppImagePaths.suraDetailsBg, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Column(
                children: [
                  Text(
                    quranSuras[index].arabicName,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font24Gold,
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FullSurahDetails(index: index),
                          ),
                        );
                      },
                      child: FullSurah(index: index),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FullSurah extends StatefulWidget {
  const FullSurah({super.key, required this.index});

  final int index;

  @override
  State<FullSurah> createState() => _FullSurahState();
}

class _FullSurahState extends State<FullSurah> {
  String? surahText;
  late bool isLoading;
  List<String> surahLines = [];
  final ScrollController scrollController = ScrollController();

  String toArabicNumerals(int number) {
    const arabicNumerals = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number.toString().split('').map((digit) {
      return arabicNumerals[int.parse(digit)];
    }).join();
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    scrollController.addListener(() {
      final box = Hive.box('myBox');
      box.put("scroll${widget.index}", scrollController.offset);
    });
    loadSurahFile();
  }

  Future<void> loadSurahFile() async {
    String surahFile = await rootBundle.loadString(
      'assets/suras/${widget.index + 1}.txt',
    );

    List<String> lines = surahFile.trim().split("\n");

    setState(() {
      surahLines = lines;
      isLoading = false;
    });
    final box = Hive.box("myBox");
    double saveOffest = box.get("scroll${widget.index}", defaultValue: 0.0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(saveOffest);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator(color: AppColors.gold));
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Directionality(
          textDirection: .rtl,
          child: RichText(
            text: TextSpan(
              children: [
                for (int i = 0; i < surahLines.length; i++) ...[
                  TextSpan(
                    text: surahLines[i],
                    style: AppTextStyles.font16Gold,
                  ),
                  TextSpan(text: '﴿${toArabicNumerals(i + 1)}﴾'),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
