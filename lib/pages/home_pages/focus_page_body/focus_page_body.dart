import 'package:flutter/material.dart';

class FocusPageBody extends StatefulWidget {
  const FocusPageBody({super.key});

  @override
  State<FocusPageBody> createState() => _FocusPageBodyState();
}

class _FocusPageBodyState extends State<FocusPageBody> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('focus page welcome'),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    debugPrint('focus page init');
  }
}
