import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_color.dart';
import '../utils/app_text_style.dart';

class FullSurah extends StatefulWidget {
  const FullSurah({super.key, required this.index});

  final int index;

  @override
  State<FullSurah> createState() => _FullSurahState();
}

class _FullSurahState extends State<FullSurah> {
  String? surahText;
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    loadSurahFile();
    isLoading = true;
  }

  Future<void> loadSurahFile() async {
    String surahFile = await rootBundle.loadString(
      'assets/suras/${widget.index + 1}.txt',
    );

    List<String> lines = surahFile.trim().split("\n");

    String fullSurah = "";
    for (int i = 0; i < lines.length; i++) {
      fullSurah += " ${lines[i]} (${i + 1})";
    }

    setState(() {
      surahText = fullSurah;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator(color: AppColors.gold));
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: SingleChildScrollView(
        child: Directionality(
          textDirection: .rtl,
          child: Text(
            surahText!,
            textAlign: .center,
            style: AppTextStyles.font20Gold.copyWith(height: 2),
            softWrap: true,
            overflow: .visible,
          ),
        ),
      ),
    );
  }
}
