import 'package:flutter/material.dart';

// enum ECategoryName {
//   food,
//   work,
//   sports,
//   design,
//   school,
//   commute,
//   music,
//   health,
//   movie,
//   traffic,
//   medication,
// }

class CategoryIconLibWidget {
  static final CategoryIconLibWidget _instant = CategoryIconLibWidget._();

  CategoryIconLibWidget._();

  factory CategoryIconLibWidget() => _instant;

  // var categoryNameLib = Map.of(
  //   {
  //     ECategoryName.food: 'food',
  //     ECategoryName.work: 'work',
  //     ECategoryName.sports: 'sports',
  //     ECategoryName.design: 'design',
  //     ECategoryName.school: 'school',
  //     ECategoryName.commute: 'communication',
  //     ECategoryName.music: 'music',
  //     ECategoryName.health: 'health',
  //     ECategoryName.movie: 'Icons.movie_outlined',
  //     ECategoryName.traffic: Icons.traffic_outlined,
  //     ECategoryName.medication: Icons.medication_outlined,
  //   },
  // );

  var categoryIconsLib = Map.of(
    {
      0: Icons.food_bank_outlined,
      1: Icons.work_outline,
      2: Icons.sports_bar_outlined,
      3: Icons.design_services_outlined,
      4: Icons.school_outlined,
      5: Icons.commute_outlined,
      6: Icons.music_note_outlined,
      7: Icons.health_and_safety_outlined,
      8: Icons.movie_outlined,
      9: Icons.traffic_outlined,
      10: Icons.medication_outlined,
      11: Icons.home_outlined,
    },
  );

  IconData getIconDataViaIconIndex(int iconNumber) {
    return categoryIconsLib[iconNumber] ?? Icons.question_mark_outlined;
  }

  var categoryIconsColorLib = Map.of({
    0: [const Color(0xFFCCFF80), const Color(0xFF21A300)],
    1: [const Color(0xFFff9680), const Color(0xFFA31D00)],
    2: [const Color(0xFF80FFFF), const Color(0xFF00A32F)],
    3: [const Color(0xFF80FFD9), const Color(0xFF00A372)],
    4: [const Color(0xFF809CFF), const Color(0xFF0055A3)],
    5: [const Color(0xFFFF80EB), const Color(0xFFA30089)],
    6: [const Color(0xFF80FFA3), const Color(0xFF00A3A3)],
    7: [const Color(0xFF80D1FF), const Color(0xFF0069A3)],
    8: [const Color(0xFFFFCC80), const Color(0xFFA36200)],
    9: [const Color(0xFF80FFD1), const Color(0xFF00A369)],
    10: [const Color(0xFFFC80FF), const Color(0xFFA000A3)],
  });

  List<Color> getIconColorViaColorIndex(int colorIndex) {
    if (colorIndex <= 10) {
      return categoryIconsColorLib[colorIndex] ??
          [const Color(0xFFCCFF80), const Color(0xFF21A300)];
    } else {
      return [const Color(0xFFCCFF80), const Color(0xFF21A300)];
    }
  }
}
