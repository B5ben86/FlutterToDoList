import 'package:flutter/material.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({super.key});

  @override
  State<ProfilePageBody> createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('profile page welcome'),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    debugPrint('profile page init');
  }
}
