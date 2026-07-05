import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/models/hadeeth_model.dart';
import 'package:islamy/utils/app_color.dart';
import 'package:islamy/utils/app_text_style.dart';
import 'package:islamy/utils/image_paths.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<Hadeeth> hadeethText = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadAhadeethFiles();
  }

  Future<void> loadAhadeethFiles() async {
    const int count = 50;
    List<Hadeeth> hadeethList = [];
    for (int i = 1; i <= count; i++) {
      final path = "assets/hadeeth/h$i.txt";
      final raw = await rootBundle.loadString(path);
      final lines = raw.split("\n");
      final title = lines.first.trim();
      final content = lines.skip(1).join("\n").trim();
      final rawHadeeth = content.split("رواه");
      final rawHadeethContent = rawHadeeth.take(1).join("\n").trim();
      final rawy = rawHadeeth.skip(1).join("\n").trim();

      hadeethList.add(
        Hadeeth(title: title, content: rawHadeethContent, rawy: rawy),
      );
    }

    setState(() {
      hadeethText = hadeethList;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  reverse: true,
                  itemCount: 50,
                  scrollDirection: .horizontal,
                  itemBuilder: (context, index) {
                    if (hadeethText.isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.brown,
                        ),
                      );
                    } else {
                      final hadeeth = hadeethText[index];
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          child: Container(
                            clipBehavior: .antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              alignment: .center,
                              fit: .expand,
                              children: [
                                Image.asset(
                                  AppImagePaths.hadeethCardBg,
                                  fit: .fill,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 32),
                                  child: Column(
                                    children: [
                                      Text(
                                        textAlign: .center,
                                        hadeeth.title,
                                        style: AppTextStyles.font24Black,
                                      ),
                                      SizedBox(height: 16),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 25,
                                            horizontal: 16,
                                          ),
                                          child: SingleChildScrollView(
                                            scrollDirection: .vertical,
                                            child: Column(
                                              children: [
                                                Text(
                                                  hadeeth.content,
                                                  textAlign: .center,
                                                  style:
                                                      AppTextStyles.font14Black,
                                                ),
                                                SizedBox(height: 12),
                                                Text(
                                                  " رواه ${hadeeth.rawy}",
                                                  textAlign: .center,
                                                  style: TextStyle(
                                                    color: Colors.brown,
                                                    fontSize: 12,
                                                    fontWeight: .bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
