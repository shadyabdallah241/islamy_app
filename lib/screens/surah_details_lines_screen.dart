import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/utils/image_paths.dart';
import '../data/quran_data.dart';
import '../utils/app_color.dart';
import '../utils/app_text_style.dart';

class FullSurahDetails extends StatefulWidget {
  static const String routeName = "FullSurahDetails";
  final int index;

  const FullSurahDetails({super.key, required this.index});

  @override
  State<FullSurahDetails> createState() => _FullSurahDetailsState();
}

class _FullSurahDetailsState extends State<FullSurahDetails> {
  int selectedIndex = 0;
  List<String> lines = [];
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    loadSuraLines();
    isLoading = true;
  }

  String toArabicNumerals(int number) {
    const arabicNumerals = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number.toString().split('').map((digit) {
      return arabicNumerals[int.parse(digit)];
    }).join();
  }

  Future<void> loadSuraLines() async {
    String surahFile = await rootBundle.loadString(
      'assets/suras/${widget.index + 1}.txt',
    );

    List<String> surahLines = surahFile.trim().split("\n");

    setState(() {
      lines = surahLines;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator(color: AppColors.gold));
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        scrolledUnderElevation: 0.0,
        leading: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: AppColors.gold),
        ),
        centerTitle: true,
        title: Text(
          quranSuras[widget.index].englishName,
          textAlign: TextAlign.center,
          style: AppTextStyles.font24Gold,
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImagePaths.suraDetailsBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Text(
                  quranSuras[widget.index].arabicName,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font24Gold,
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? AppColors.gold
                                  : AppColors.black,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppColors.gold,
                                width: 2,
                              ),
                            ),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: RichText(
                                textAlign: TextAlign.center,

                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: lines[index],
                                      style: selectedIndex == index
                                          ? AppTextStyles.font16Black
                                          : AppTextStyles.font16Gold,
                                    ),
                                    TextSpan(
                                      text: '﴿${toArabicNumerals(index + 1)}﴾',
                                      style: selectedIndex == index
                                          ? AppTextStyles.font16Black
                                          : AppTextStyles.font16White,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: lines.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
