import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/models/focus_record_model/focus_record_model.dart';
import 'package:uptodo/pages/home_pages/focus_page_body/widgets/focus_counter_widget.dart';
import 'package:uptodo/pages/home_pages/focus_page_body/widgets/summary_bar_chart_widget.dart';
import 'package:uptodo/providers/focus_record_model_map_change_notifier.dart';

class FocusPageBody extends StatefulWidget {
  const FocusPageBody({super.key});

  @override
  State<FocusPageBody> createState() => _FocusPageBodyState();
}

class _FocusPageBodyState extends State<FocusPageBody> {
  int timerCounter = 0;
  final int maxCounter = 3600;
  Timer? timer;
  bool inFocusMode = false;
  String startButtonText = S.current.focus_mode_page_start_focusing_button_text;

  FocusRecordModel focusRecordModel =
      FocusRecordModel(DateTime.now(), DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 56,
          ),
          FocusCounterWidget(timerCounter, maxCounter),
          const SizedBox(
            height: 20,
          ),
          startButton(),
          const SizedBox(
            height: 56,
          ),
          const SummaryBarChartWidget(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    stopFocusModeTimerWhenDispose();
    super.deactivate();
  }

  @override
  void dispose() {
    // stopFocusModeTimerWhenDispose();
    super.dispose();
  }

  Widget startButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(177, 48),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      onPressed: () {
        focusModeTimerHandler();
        updateFocusButtonText();
      },
      child: Text(
        startButtonText,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  void focusModeTimerHandler() {
    if (inFocusMode) {
      stopFocusModeTimer();
    } else {
      startFocusModeTimer();
    }
  }

  void startFocusModeTimer() {
    if (timer == null) {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) async {
          setState(() {
            timerCounter++;
          });

          if (timerCounter == maxCounter) {
            stopFocusModeTimer();
            updateFocusButtonText();
          }
        },
      );
      _startRecord();
    }
  }

  void stopFocusModeTimer() {
    if (timer != null) {
      if (timer!.isActive) {
        timer?.cancel();
        setState(() {
          timerCounter = 0;
        });
        //save record
        _stopAndSaveRecord();
      }
      timer = null;
    }
  }

  void stopFocusModeTimerWhenDispose() {
    if (timer != null) {
      if (timer!.isActive) {
        timer?.cancel();
        timerCounter = 0;
        //直接退出页面时，视为放弃本次记录
        // _stopAndSaveRecord();
      }
      timer = null;
    }
  }

  void updateFocusButtonText() {
    inFocusMode = !inFocusMode;
    String buttonText = inFocusMode
        ? S.current.focus_mode_page_stop_focusing_button_text
        : S.current.focus_mode_page_start_focusing_button_text;

    setState(() {
      startButtonText = buttonText;
    });
  }

  void _stopAndSaveRecord() {
    focusRecordModel.stopRecordDateTime = DateTime.now();
    context
        .read<FocusRecordModelMapChangeNotifier>()
        .insertRecord(focusRecordModel);
  }

  void _startRecord() {
    focusRecordModel = FocusRecordModel(DateTime.now(), DateTime.now());
  }
}
