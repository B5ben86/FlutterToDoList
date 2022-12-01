import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';

typedef ButtonOnPressedCallback = Function();

class IntroStepPageAppBar extends AppBar {
  final ButtonOnPressedCallback? callback;
  IntroStepPageAppBar(this.callback, {super.key});

  @override
  State<IntroStepPageAppBar> createState() => _IntroStepPageAppBarState();
}

class _IntroStepPageAppBarState extends State<IntroStepPageAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: TextButton(
        onPressed: () {
          widget.callback!();
        },
        child: Text(
          S.current.intro_page_skip,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

// AppBar buildAppBar() {
//   return AppBar(
//     backgroundColor: Colors.transparent,
//     elevation: 0.0,
//     leading: TextButton(
//       onPressed: () {},
//       child: Text(
//         S.current.intro_page_skip,
//         style: TextStyle(
//           color: Colors.grey.shade500,
//           fontSize: 16,
//         ),
//       ),
//     ),
//   );
// }
