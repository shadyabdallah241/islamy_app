import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_text_style.dart';

class Zekr extends StatefulWidget {
  final int azkarIndex;
  final int index;

  const Zekr({
    super.key,
    required this.morningAzkarItems,
    required this.index,
    required this.eveningAzkarItems,
    required this.azkarIndex,
  });

  final List<String> morningAzkarItems;
  final List<String> eveningAzkarItems;

  @override
  State<Zekr> createState() => ZekrState();
}

class ZekrState extends State<Zekr> {
  bool isDone = false;

  final List<int> initialAzkarCount = [
    1,
    3,
    1,
    1,
    4,
    1,
    3,
    7,
    1,
    1,
    3,
    3,
    1,
    1,
    1,
    100,
    10,
    100,
    1,
    100,
    10,
  ];
  late final List<int> azkarCount;

  @override
  void initState() {
    super.initState();
    azkarCount = List.from(initialAzkarCount);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.offWhite.withAlpha(150),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Text(
                    widget.azkarIndex == 1
                        ? widget.morningAzkarItems[widget.index]
                        : widget.eveningAzkarItems[widget.index],
                    textAlign: .end,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDone == false ? Color(0xFFA17E31) : Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 80,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        countDown(widget.index);
                        setState(() {});
                      },
                      child: Stack(
                        children: [
                          Align(
                            alignment: .topLeft,
                            child: Text(
                              azkarCount[widget.index].toString(),
                              style: AppTextStyles.font14offWhite,
                            ),
                          ),
                          Align(
                            alignment: .center,
                            child: Text(
                              azkarCount[widget.index].toString(),
                              style: AppTextStyles.font24offWhite,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              reset(widget.index);
                            },
                            child: Align(
                              alignment: .bottomLeft,
                              child: Icon(
                                Icons.restart_alt,
                                color: AppColors.offWhite,
                              ),
                            ),
                          ),
                          Align(
                            alignment: .bottomRight,
                            child: Text(
                              "${widget.index + 1}",
                              style: AppTextStyles.font14offWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void countDown(int index) {
    if (azkarCount[index] == 0) {
      return;
    }
    setState(() {
      azkarCount[index]--;
      if (azkarCount[index] == 0) {
        isDone = true;
      }
    });
  }

  void reset(int index) {
    setState(() {
      azkarCount[index] = initialAzkarCount[index];
      isDone = false;
    });
  }
}
