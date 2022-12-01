import 'package:flutter/material.dart';

class CalendarPageBody extends StatefulWidget {
  const CalendarPageBody({super.key});

  @override
  State<CalendarPageBody> createState() => _CalendarPageBodyState();
}

class _CalendarPageBodyState extends State<CalendarPageBody> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('calendar page welcome'),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    debugPrint('calendar page init');
  }
}
