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
  int touchIndex = -1;

  List<int> recordList = [];

  @override
  void initState() {
    if (barCharType == _EBarCharType.week) {
      touchIndex = DateTime.now().weekday;
    }
    super.initState();
  }

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
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: SizedBox(
        width: 500,
        height: 233,
        child: BarChart(
          BarChartData(
            barGroups: generateData(),
            maxY: maxY,
            barTouchData: BarTouchData(
              enabled: false,
              touchCallback: (event, barTouchResponse) {
                if (!event.isInterestedForInteractions ||
                    barTouchResponse == null ||
                    barTouchResponse.spot == null) {
                  // touchIndex = -1;
                  // debugPrint(touchIndex.toString());
                  return;
                }
                var newTouchIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                if (newTouchIndex != touchIndex) {
                  setState(() {
                    touchIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                  });
                }
                // debugPrint(touchIndex.toString());
              },
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipMargin: 0,
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    _durationTransform(recordList[groupIndex]),
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  );
                },
              ),
            ),
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              show: true,
              leftTitles: AxisTitles(
                sideTitles: null,
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
                left: BorderSide.none,
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
      ),
    );
  }

  List<BarChartGroupData> generateData() {
    List<BarChartGroupData> dataList = [];
    recordList = context
        .watch<FocusRecordModelMapChangeNotifier>()
        .getRecordListOfThisWeek();
    switch (barCharType) {
      case _EBarCharType.week:
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
      var durationMin = durationSeconds / 60;
      var barChartGroupData = BarChartGroupData(
        x: index,
        barRods: [
          createBarChartRodData(durationMin, getBarChartRodColor(index)),
        ],
        showingTooltipIndicators: [
          0,
        ],
      );
      dataList.add(barChartGroupData);
      if (durationMin > maxYTmp) {
        maxYTmp = durationMin;
      }
      index++;
    }
    setState(() {
      maxY = maxYTmp * 1.3;
    });

    return dataList;
  }

  BarChartRodData createBarChartRodData(double toY, Color color) {
    return BarChartRodData(
      fromY: 0,
      toY: toY + 0,
      width: 28,
      color: color,
      borderRadius: const BorderRadius.all(
        Radius.circular(4),
      ),
    );
  }

  Color getBarChartRodColor(int barChartIndex) {
    return (touchIndex == barChartIndex)
        ? Theme.of(context).primaryColor
        : const Color(0xffa5a5a5);
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(S.current.focus_mode_bar_char_bottom_title_sunday,
            style: style);
        break;
      case 1:
        text = Text(S.current.focus_mode_bar_char_bottom_title_monday,
            style: style);
        break;
      case 2:
        text = Text(S.current.focus_mode_bar_char_bottom_title_tuesday,
            style: style);
        break;
      case 3:
        text = Text(S.current.focus_mode_bar_char_bottom_title_wednesday,
            style: style);
        break;
      case 4:
        text = Text(S.current.focus_mode_bar_char_bottom_title_thursday,
            style: style);
        break;
      case 5:
        text = Text(S.current.focus_mode_bar_char_bottom_title_friday,
            style: style);
        break;
      case 6:
        text = Text(S.current.focus_mode_bar_char_bottom_title_saturday,
            style: style);
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

  String _durationTransform(int seconds) {
    return "${seconds ~/ 3600}h${seconds % 3600 ~/ 60}m";
  }
}
