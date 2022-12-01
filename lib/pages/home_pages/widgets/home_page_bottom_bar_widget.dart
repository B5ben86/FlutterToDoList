import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';

class HomePageBottomBarWidget extends BottomAppBar {
  final void Function(int tapIndex) onBottomTapClick;
  const HomePageBottomBarWidget(this.onBottomTapClick, {super.key});

  @override
  State<HomePageBottomBarWidget> createState() =>
      _HomePageBottomBarWidgetState();
}

class _HomePageBottomBarWidgetState extends State<HomePageBottomBarWidget> {
  int tapIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          tapIndex = value;
        });
        widget.onBottomTapClick(value);
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      selectedFontSize: 12,
      currentIndex: tapIndex,
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: S.current.home_page_bottom_app_bar_index,
            activeIcon: const Icon(Icons.home_rounded)),
        BottomNavigationBarItem(
          icon: const Icon(Icons.calendar_month_outlined),
          activeIcon: const Icon(Icons.calendar_month_sharp),
          label: S.current.home_page_bottom_app_bar_calendar,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.browse_gallery_outlined),
          activeIcon: const Icon(Icons.browse_gallery_rounded),
          label: S.current.home_page_bottom_app_bar_focus,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_outline),
          activeIcon: const Icon(Icons.person_rounded),
          label: S.current.home_page_bottom_app_bar_profile,
        ),
      ],
    );
  }
}
