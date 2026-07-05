import 'package:flutter/material.dart';
import 'package:islamy/screens/azkar_screen.dart';
import 'package:islamy/utils/app_color.dart';
import 'package:islamy/utils/app_text_style.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  bool isSilent = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Stack(
              alignment: .center,
              children: [
                Container(
                  height: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                      image: AssetImage("assets/images/pray_time_bg.png"),
                      fit: .fill,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: .spaceAround,
                          children: [
                            Text(
                              "16 Jul,\n2024",
                              style: AppTextStyles.font16offWhite,
                            ),

                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/pray_time.png",
                                  width: 100,
                                ),
                                Text(
                                  "Tuesday",
                                  style: AppTextStyles.font20Black,
                                ),
                              ],
                            ),
                            Text(
                              "09 Muh,\n 1446",
                              style: AppTextStyles.font16offWhite,
                              textAlign: .end,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 130.0,
                            viewportFraction: 0.35,
                            enlargeCenterPage: true,
                            enlargeStrategy: .scale,
                            enlargeFactor: 0.1,
                            padEnds: true,
                          ),
                          items: [1, 2, 3, 4, 5].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: 100,
                                  height: .infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: .bottomRight,
                                      end: .topLeft,
                                      colors: [
                                        Color(0xFFB19768),
                                        Color(0xFF202020),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: .center,
                                    children: [
                                      Center(
                                        child: Text(
                                          "",
                                          style: AppTextStyles.font16White,
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "04:38",
                                          style: AppTextStyles.font16White
                                              .copyWith(fontSize: 32),
                                        ),
                                      ),

                                      Center(
                                        child: Text(
                                          "PM",
                                          style: AppTextStyles.font16White
                                              .copyWith(fontWeight: .bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          child: Stack(
                            alignment: .center,
                            children: [
                              Row(
                                mainAxisAlignment: .center,
                                children: [
                                  ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (Rect bounds) =>
                                        LinearGradient(
                                          colors: [
                                            Color(0xFF514838),
                                            Color(0xFF686052),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ).createShader(bounds),
                                    child: Text(
                                      "Next Pray",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: .bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " -02:32",
                                    style: AppTextStyles.font14Black,
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 20,
                                child: isSilent
                                    ? InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            isSilent = !isSilent;
                                          });
                                        },
                                        child: Icon(Icons.volume_off_rounded),
                                      )
                                    : InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            isSilent = !isSilent;
                                          });
                                        },
                                        child: Icon(Icons.volume_up_rounded),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: .centerLeft,
              child: Text('Azkar', style: AppTextStyles.font16offWhite),
            ),
            Row(
              spacing: 20,
              children: [
                AzkarNav(
                  azkarBg: "assets/images/illustration_9.png",
                  azkarTitle: "Morning Azkar",
                  azkarIndex: 1,
                ),
                AzkarNav(
                  azkarBg: "assets/images/illustration_7.png",
                  azkarTitle: "Evening Azkar",
                  azkarIndex: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AzkarNav extends StatelessWidget {
  final String azkarBg;
  final String azkarTitle;
  final int azkarIndex;

  const AzkarNav({
    super.key,
    required this.azkarBg,
    required this.azkarTitle,
    required this.azkarIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.pushNamed(
            context,
            AzkarScreen.routeName,
            arguments: azkarIndex,
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(150),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.gold, width: 2),
          ),
          child: Column(
            children: [
              Image.asset(azkarBg),
              Text(azkarTitle, style: AppTextStyles.font20White),
            ],
          ),
        ),
      ),
    );
  }
}
