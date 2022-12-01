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
    },
  );

  IconData getIconDataViaIconIndex(int iconNumber) {
    return categoryIconsLib[iconNumber] ?? Icons.question_mark_outlined;
  }

  var categoryIconsColorLib = Map.of({
    0: [Colors.yellow, Colors.yellowAccent],
    1: [Colors.green, Colors.greenAccent],
    2: [Colors.blue, Colors.blueAccent],
    3: [Colors.purple, Colors.purpleAccent],
    4: [Colors.indigo, Colors.indigoAccent],
    5: [Colors.teal, Colors.tealAccent],
    6: [Colors.orange, Colors.orangeAccent],
    7: [Colors.red, Colors.redAccent],
    8: [Colors.lime, Colors.limeAccent],
    9: [Colors.pink, Colors.pinkAccent],
    10: [Colors.amber, Colors.amberAccent],
  });

  List<ColorSwatch<int>> getIconColorViaColorIndex(int colorIndex) {
    if (colorIndex <= 10) {
      return categoryIconsColorLib[colorIndex] ??
          [Colors.yellow, Colors.yellowAccent];
    } else {
      return [Colors.yellow, Colors.yellowAccent];
    }
  }
}
