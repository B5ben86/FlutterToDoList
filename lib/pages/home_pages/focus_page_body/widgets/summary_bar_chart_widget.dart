import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SummaryBarChartWidget extends StatefulWidget {
  const SummaryBarChartWidget({super.key});

  @override
  State<SummaryBarChartWidget> createState() => _SummaryBarChartWidgetState();
}

class _SummaryBarChartWidgetState extends State<SummaryBarChartWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 300,
      child: BarChart(
        BarChartData(
          barGroups: generateData(),
          maxY: 20,
          barTouchData: BarTouchData(enabled: true),
        ),
        swapAnimationDuration: const Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear, // Optional
      ),
    );
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: SizedBox(
    //     width: 500,
    //     height: 300,
    //     child: BarChart(
    //       BarChartData(
    //         barGroups: generateData(),
    //         maxY: 20,
    //         barTouchData: BarTouchData(enabled: false),
    //       ),
    //       swapAnimationDuration: const Duration(milliseconds: 150), // Optional
    //       swapAnimationCurve: Curves.linear, // Optional
    //     ),
    //   ),
    // );
  }

  List<BarChartGroupData> generateData() {
    return [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(toY: 5, color: Colors.blue),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(toY: 8, color: Colors.blue),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(toY: 3, color: Colors.blue),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(toY: 10, color: Colors.blue),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(toY: 15, color: Colors.blue),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(toY: 15, color: Colors.blue),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(toY: 15, color: Colors.blue),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(toY: 15, color: Colors.blue),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(toY: 15, color: Colors.blue),
        ],
      ),
    ];
  }
}
