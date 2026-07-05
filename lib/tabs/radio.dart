import 'package:flutter/material.dart';
import 'package:islamy/utils/app_text_style.dart';
import 'package:islamy/utils/image_paths.dart';

import '../utils/app_color.dart';
import '../widgets/radio_button.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    bool? isActive = true;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      RadioButton(
                        buttonText: "Radio",
                        buttonTextColor: AppColors.black,
                        buttonColor: AppColors.gold,
                        isActive: isActive,
                      ),
                      RadioButton(
                        buttonText: "Reciters",
                        buttonTextColor: AppColors.white,
                        buttonColor: Colors.black.withAlpha(150),
                        isActive: true,
                      ),
                    ],
                  ),
                ),
                RadioPlayer(radioStationName: "Radio Ibrahim Al-Akdar"),
                SizedBox(height: 16),
                RadioPlayer(radioStationName: "Radio Ahmed Al-trabulsi"),
                SizedBox(height: 16),
                RadioPlayer(radioStationName: "Radio Addokali Mohammad Alalim"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RadioPlayer extends StatefulWidget {
  final String radioStationName;

  const RadioPlayer({super.key, required this.radioStationName});

  @override
  State<RadioPlayer> createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer> {
  bool isPlaying = false;
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: .bottomCenter,
        children: [
          AnimatedCrossFade(
            firstChild: Image.asset(AppImagePaths.radioStationPlayingBg),
            secondChild: Image.asset(AppImagePaths.radioStationPauseBg),
            crossFadeState: isPlaying
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 300),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 16,
              children: [
                Text(widget.radioStationName, style: AppTextStyles.font16Black),
                Row(
                  spacing: 16,
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    Opacity(
                      opacity: 0,
                      child: Icon(Icons.volume_up_rounded, size: 30),
                    ),
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                        child: isPlaying
                            ? Icon(Icons.pause, size: 35)
                            : Icon(Icons.play_arrow_rounded, size: 35),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMuted = !isMuted;
                          });
                        },
                        child: isMuted
                            ? Icon(Icons.volume_off_rounded, size: 35)
                            : Icon(Icons.volume_up_rounded, size: 35),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
