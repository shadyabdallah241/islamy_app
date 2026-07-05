import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/utils/app_text_style.dart';
import 'package:islamy/utils/image_paths.dart';
import '../components/zekr.dart';

class AzkarScreen extends StatefulWidget {
  static const routeName = "AzkarScreen";

  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  String rawMorningAzkar = "";
  List<String> morningAzkarItems = [];

  String rawEveningAzkar = "";
  List<String> eveningAzkarItems = [];

  Future<void> loadAzkarFile() async {
    final results = await Future.wait([
      rootBundle.loadString("assets/azkar/azkar_morning.txt"),
      rootBundle.loadString("assets/azkar/azkar_evening.txt"),
    ]);

    final morningContent = results[0];
    final eveningContent = results[1];

    setState(() {
      rawMorningAzkar = morningContent;
      morningAzkarItems = morningContent.split("#").toList();

      rawEveningAzkar = eveningContent;
      eveningAzkarItems = eveningContent.split("#").toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadAzkarFile();
  }

  @override
  Widget build(BuildContext context) {
    final azkarIndex = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: .center,
          fit: .expand,
          children: [
            Image.asset(AppImagePaths.hadeethCardBg, fit: .fill),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      azkarIndex == 1 ? "أذكار الصباح" : "أذكار المساء",
                      style: AppTextStyles.font24Black,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 5);
                        },
                        itemCount: morningAzkarItems.length > 1
                            ? morningAzkarItems.length - 1
                            : 0,
                        itemBuilder: (context, index) {
                          return Zekr(
                            eveningAzkarItems: eveningAzkarItems,
                            morningAzkarItems: morningAzkarItems,
                            azkarIndex: azkarIndex,
                            index: index,
                          );
                        },
                      ),
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
