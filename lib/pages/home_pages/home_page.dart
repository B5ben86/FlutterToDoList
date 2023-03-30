import 'package:flutter/material.dart';
import 'package:uptodo/pages/home_pages/calendar_page_body/calendar_page_body.dart';
import 'package:uptodo/pages/home_pages/focus_page_body/focus_page_body.dart';
import 'package:uptodo/pages/home_pages/index_page_body/index_page_body.dart';
import 'package:uptodo/pages/home_pages/profile_page_body/profile_page_body.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/add_task_popup_dialog/add_task_popup_dialog_widget.dart';

import 'widgets/home_page_app_bar_widget.dart';
import 'widgets/home_page_bottom_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var floatingButtonVisible = true;
  var currentTapIndex = 0;
  var calendarPageBodyGlobalKey = GlobalKey<CalendarPageBodyState>();
  var bodyContentList = List.of([]);

  @override
  void initState() {
    super.initState();
    bodyContentList = [
      const IndexPageBody(),
      CalendarPageBody(
        key: calendarPageBodyGlobalKey,
      ),
      const FocusPageBody(),
      const ProfilePageBody()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigationBar(),
        floatingActionButton: buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: bodyContentList[currentTapIndex]);
  }

  PreferredSizeWidget buildAppBar() {
    return HomePageAppBarWidget(currentTapIndex, () {
      debugPrint('onFilterButton pressed');
    }, () {
      debugPrint('onAvatarButton pressed');
    });
  }

  Widget buildFloatingActionButton() {
    return Visibility(
      visible: floatingButtonVisible,
      child: SizedBox(
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () {
            addButtonHandle();
          },
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return HomePageBottomBarWidget(
      (int tapIndex) {
        if (tapIndex == 0 || tapIndex == 1) {
          if (floatingButtonVisible == false) {
            setState(() {
              floatingButtonVisible = true;
            });
          }
        } else {
          if (floatingButtonVisible == true) {
            setState(() {
              floatingButtonVisible = false;
            });
          }
        }
        if (tapIndex != currentTapIndex) {
          setState(() {
            currentTapIndex = tapIndex;
          });
        }
      },
    );
  }

  void addButtonHandle() {
    if (currentTapIndex == 0 || currentTapIndex == 1) {
      debugPrint('press add button in index page');
      var dateTime = DateTime.now();
      if (currentTapIndex == 1) {
        var selectedDateTime =
            calendarPageBodyGlobalKey.currentState?.selectedDayTmp;
        if (selectedDateTime != null) {
          var dateTimeTmp = DateTime(
            selectedDateTime.year,
            selectedDateTime.month,
            selectedDateTime.day,
            dateTime.hour,
            dateTime.minute,
            dateTime.second,
          );
          dateTime = dateTimeTmp;
        }
      }
      showAddTaskPopupDialogWidget(context, dateTime);
    }
  }
}
