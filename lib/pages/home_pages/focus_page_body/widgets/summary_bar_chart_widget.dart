import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/providers/focus_record_model_map_change_notifier.dart';

enum _EBarCharType {
  week,
  month,
  year,
}

class SummaryBarChartWidget extends StatefulWidget {
  const SummaryBarChartWidget({super.key});

  @override
  State<SummaryBarChartWidget> createState() => _SummaryBarChartWidgetState();
}

class _SummaryBarChartWidgetState extends State<SummaryBarChartWidget> {
  _EBarCharType barCharType = _EBarCharType.week;
  double maxY = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(),
        const SizedBox(
          height: 24,
        ),
        _buildBarChart(),
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        children: [
          Text(
            S.current.focus_mode_bar_char_title_text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0x21ffffff),
              shadowColor: Colors.transparent,
            ),
            onPressed: () {},
            child: Text(
              S.current.focus_mode_bar_char_type_button_this_week,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    return SizedBox(
      width: 500,
      height: 233,
      child: BarChart(
        BarChartData(
          barGroups: generateData(),
          maxY: maxY,
          barTouchData: BarTouchData(enabled: false),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            show: true,
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getLeftTitles,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getBottomTitles,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: null,
            ),
            topTitles: AxisTitles(
              sideTitles: null,
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              bottom: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
        ),
        swapAnimationDuration: const Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear, // Optional
      ),
    );
  }

  List<BarChartGroupData> generateData() {
    List<BarChartGroupData> dataList = [];
    switch (barCharType) {
      case _EBarCharType.week:
        var recordList = context
            .watch<FocusRecordModelMapChangeNotifier>()
            .getRecordListOfThisWeek();
        dataList = generateWeekData(recordList);
        break;
      case _EBarCharType.month:
        break;
      case _EBarCharType.year:
        break;
    }
    return dataList;
  }

  List<BarChartGroupData> generateWeekData(List<int> recordDurationList) {
    double maxYTmp = 0.0;
    List<BarChartGroupData> dataList = [];
    var index = 0;
    for (var durationSeconds in recordDurationList) {
      var durationHours = durationSeconds / 3600;
      var barChartGroupData = BarChartGroupData(x: index, barRods: [
        createBarChartRodData(durationHours),
      ]);
      dataList.add(barChartGroupData);
      if (durationHours > maxYTmp) {
        maxYTmp = durationHours;
      }
      index++;
    }
    setState(() {
      maxY = maxYTmp * 1.3;
    });
    return dataList;
  }

  BarChartRodData createBarChartRodData(double toY) {
    return BarChartRodData(
      fromY: 0,
      toY: toY + 0,
      width: 28,
      color: Theme.of(context).primaryColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(4),
      ),
    );
  }

  Widget getLeftTitles(double value, TitleMeta meta) {
    //TODO
    debugPrint('left titles index : $value');
    return const Text('0.0');
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      //TODO:  多语言
      case 0:
        text = const Text('SUN', style: style);
        break;
      case 1:
        text = const Text('MON', style: style);
        break;
      case 2:
        text = const Text('TUE', style: style);
        break;
      case 3:
        text = const Text('WED', style: style);
        break;
      case 4:
        text = const Text('THU', style: style);
        break;
      case 5:
        text = const Text('FRI', style: style);
        break;
      case 6:
        text = const Text('SAT', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 6,
      child: text,
    );
  }

  /*
  [
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
  */
}
