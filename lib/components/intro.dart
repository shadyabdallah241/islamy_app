import 'package:flutter/material.dart';
import '../utils/app_text_style.dart';
import '../data/intro_data.dart';

int selectedIndex = 0;

Padding intro(int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Expanded(
          child: Image.asset(
            introModels[index].imagePath,
            fit: .contain,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        SizedBox(height: 35),
        Text(introModels[index].title, style: AppTextStyles.font24Gold),
        SizedBox(height: 20),
        Text(
          introModels[index].details.toString(),
          style: index == 0
              ? AppTextStyles.font20Gold.copyWith(color: Colors.transparent)
              : AppTextStyles.font20Gold,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
