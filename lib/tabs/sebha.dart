import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islamy/utils/app_text_style.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int sebha = 0;
  List<String> azkar = ["سبحان الله", "الحمد لله ", "الله اكبر"];
  int azkarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          sebha++;
          if (sebha >= 33) {
            sebha = 0;
            azkarIndex++;
            if (azkarIndex > 2) {
              return;
            }
          }
        });
      },
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 16),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: AppTextStyles.font24White.copyWith(fontSize: 36),
            ),
            SizedBox(height: 16),
            Transform.translate(
              offset: Offset(15, 0),
              child: Image.asset("assets/images/sebha_shrasheb.png", scale: 2),
            ),
            SizedBox(height: 100),
            Center(
              child: Stack(
                alignment: .center,
                children: [
                  Stack(
                    children: List.generate(sebha, (index) {
                      double angle = (index * 2 * pi / 33) - (pi / 2);
                      double radius = 150;
                      return Transform.translate(
                        offset: Offset(
                          radius * cos(angle),
                          radius * sin(angle),
                        ),
                        child: Image.asset(
                          "assets/images/sebha_7abaya.png",
                          scale: 2.1,
                        ),
                      );
                    }),
                  ),
                  Column(
                    spacing: 15,
                    children: [
                      Text(
                        azkar[azkarIndex],
                        style: AppTextStyles.font24White.copyWith(fontSize: 36),
                      ),
                      Text(
                        "$sebha",
                        style: AppTextStyles.font24White.copyWith(fontSize: 36),
                      ),
                    ],
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
