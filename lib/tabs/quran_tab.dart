import 'package:flutter/material.dart';
import 'package:islamy/models/sura_model.dart';
import 'package:islamy/screens/sura_details_screen.dart';
import 'package:islamy/utils/image_paths.dart';
import '../data/quran_data.dart';
import '../utils/app_color.dart';
import '../utils/app_text_style.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> suraIndex = List.generate(114, (index) {
    return index = index;
  });
  List<int> mostRecently = [];
  List<SuraModel> filteredList = [];
  String keyword = "";

  @override
  void initState() {
    super.initState();
    filteredList = quranSuras;
  }

  List<int> goToSuraDetails(BuildContext context, int index) {
    Navigator.pushNamed(context, SuraDetails.routeName, arguments: index);
    setState(() {
      mostRecently.remove(index);
      mostRecently.insert(0, index);
      if (mostRecently.length > 5) {
        mostRecently.removeLast();
      }
    });
    return mostRecently = mostRecently.toSet().toList();
  }

  void searchSurah(String keyword) {
    if (keyword.isEmpty) {
      setState(() {
        filteredList = quranSuras;
      });
      return;
    }

    int? surahNumber = int.tryParse(keyword);
    List<SuraModel> results = quranSuras.where((sura) {
      bool matchesNumber =
          surahNumber != null &&
          surahNumber > 0 &&
          surahNumber <= quranSuras.length &&
          sura.number == surahNumber;
      bool matchesArabic = sura.arabicName.contains(keyword);
      bool matchesEnglish = sura.englishName.toLowerCase().contains(
        keyword.toLowerCase(),
      );
      return matchesArabic || matchesEnglish || matchesNumber;
    }).toList();

    setState(() {
      filteredList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: .stretch,
            spacing: 10,
            children: [
              SizedBox(height: 8),
              TextField(
                cursorColor: AppColors.gold,
                onChanged: (value) {
                  searchSurah(value);
                },

                style: TextStyle(color: AppColors.offWhite),
                decoration: InputDecoration(
                  labelText: "Sura Name",
                  labelStyle: TextStyle(color: AppColors.offWhite),
                  filled: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      "assets/images/quran_icone.png",
                      scale: 2,
                    ),
                  ),
                  suffixIcon: Icon(Icons.search),
                  fillColor: AppColors.black.withAlpha(150),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.gold, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.gold, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              mostRecently.isNotEmpty
                  ? Column(
                      children: [
                        Align(
                          alignment: .topLeft,
                          child: Text(
                            "Most Recently",
                            style: AppTextStyles.font16offWhite,
                          ),
                        ),
                        SizedBox(height: 12),
                        SizedBox(
                          height: 130,
                          child: ListView.separated(
                            scrollDirection: .horizontal,
                            itemBuilder: (context, index) {
                              final suraIndex = mostRecently[index];
                              return InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    goToSuraDetails(context, index);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColors.gold,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: .min,
                                    spacing: 10,
                                    children: [
                                      Column(
                                        spacing: 10,
                                        mainAxisAlignment: .start,
                                        crossAxisAlignment: .start,
                                        children: [
                                          Text(
                                            quranSuras[suraIndex].englishName,
                                            style: AppTextStyles.font16Black,
                                          ),
                                          Text(
                                            quranSuras[suraIndex].arabicName,
                                            style: AppTextStyles.font16Black,
                                          ),
                                          Text(
                                            "${quranSuras[suraIndex].ayatCount.toString()} Verses",
                                            style: AppTextStyles.font14Black,
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        AppImagePaths.recentlyImage,
                                        fit: .cover,
                                        width: 110,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 10);
                            },
                            itemCount: mostRecently.length,
                          ),
                        ),
                      ],
                    )
                  : Container(),

              //----------------------------
            ],
          ),
          SizedBox(height: 12),
          Align(
            alignment: .centerLeft,
            child: Text("Suras List", style: AppTextStyles.font16offWhite),
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    goToSuraDetails(context, index);
                  },
                  child: ListTile(
                    leading: Stack(
                      alignment: .center,
                      children: [
                        Image.asset(AppImagePaths.suraNumberIcon),
                        Text(
                          "${filteredList[index].number}",
                          style: AppTextStyles.font16offWhite,
                        ),
                      ],
                    ),
                    title: Text(
                      filteredList[index].englishName,
                      style: AppTextStyles.font20offWhite,
                    ),
                    subtitle: Text(
                      "${filteredList[index].ayatCount.toString()} Verses",
                      style: AppTextStyles.font14offWhite,
                    ),
                    trailing: Text(
                      filteredList[index].arabicName,
                      style: AppTextStyles.font20offWhite,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(endIndent: 50, indent: 50);
              },
              itemCount: filteredList.length,
            ),
          ),
        ],
      ),
    );
  }
}
