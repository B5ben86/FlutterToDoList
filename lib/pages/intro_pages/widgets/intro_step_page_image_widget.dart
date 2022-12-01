import 'package:flutter/material.dart';
import 'package:uptodo/utility/svg_images/svg_images_getter.dart';

enum EPageType { one, two, three }

class IntroStepPageImageWidget extends StatefulWidget {
  final EPageType pageType;

  const IntroStepPageImageWidget(this.pageType, {super.key});

  @override
  State<IntroStepPageImageWidget> createState() =>
      _IntroStepPageImageWidgetState();
}

class _IntroStepPageImageWidgetState extends State<IntroStepPageImageWidget> {
  Widget getImage(EPageType pageType) {
    switch (pageType) {
      case EPageType.one:
        return introStepOnePageImageSvg;
      case EPageType.two:
        return introStepTwoPageImageSvg;
      case EPageType.three:
        return introStepThreePageImageSvg;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 350,
      child: getImage(widget.pageType),
    );
  }
}
