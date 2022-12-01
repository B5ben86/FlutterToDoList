import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';

class HomePageAppBarWidget extends AppBar {
  final int tapIndex;
  final void Function()? onFilterButtonPressed;
  final void Function()? onAvatarButtonPressed;
  HomePageAppBarWidget(
      this.tapIndex, this.onFilterButtonPressed, this.onAvatarButtonPressed,
      {super.key});

  @override
  State<HomePageAppBarWidget> createState() => _HomePageAppBarWidgetState();
}

class _HomePageAppBarWidgetState extends State<HomePageAppBarWidget> {
  var titleTextList = [
    S.current.home_page_bottom_app_bar_index,
    S.current.home_page_bottom_app_bar_calendar,
    S.current.home_page_bottom_app_bar_focus,
    S.current.home_page_bottom_app_bar_profile,
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        titleTextList[widget.tapIndex],
        style: const TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.normal,
        ),
      ),
      leading: buildLeadingImageButton(),
      actions: [
        buildAvatarButton(),
      ],
    );
  }

  Widget buildLeadingImageButton() {
    return Visibility(
      visible: widget.tapIndex == 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: IconButton(
          onPressed: widget.onFilterButtonPressed,
          icon: const Icon(Icons.filter_list),
        ),
      ),
    );
  }

  Widget buildAvatarButton() {
    return Visibility(
      visible: widget.tapIndex == 0,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: IconButton(
          iconSize: 42,
          onPressed: widget.onAvatarButtonPressed,
          icon: const CircleAvatar(
            foregroundImage: NetworkImage('https://i.pravatar.cc/100'),
          ),
        ),
      ),
    );
  }
}
