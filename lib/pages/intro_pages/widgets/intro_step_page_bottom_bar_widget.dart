import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';

typedef ButtonOnPressedCallback = Function(EButtonType buttonType);

enum EButtonType {
  back,
  next,
}

class IntroStepPageBottomBarWidget extends BottomAppBar {
  final ButtonOnPressedCallback? callback;
  const IntroStepPageBottomBarWidget(this.callback, {super.key});

  @override
  State<IntroStepPageBottomBarWidget> createState() =>
      _IntroStepPageBottomBarWidgetState();
}

class _IntroStepPageBottomBarWidgetState
    extends State<IntroStepPageBottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 62.0),
      child: SizedBox(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              style: TextButton.styleFrom(fixedSize: const Size(90.0, 48.0)),
              onPressed: () {
                widget.callback!(EButtonType.back);
              },
              child: Text(
                S.current.intro_page_back,
                style:
                    TextStyle(fontSize: 16, color: Colors.white.withAlpha(66)),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    fixedSize: const Size(90.0, 48.0)),
                onPressed: () {
                  widget.callback!(EButtonType.next);
                },
                child: Text(
                  S.current.intro_page_next,
                  style: const TextStyle(fontSize: 16.0, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
