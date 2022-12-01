import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String assetBaseName = 'assets/images/svg/';

const String _welcomePageAssetName = '${assetBaseName}welcome_page_logo.svg';
final Widget welcomePageLogoSvg = SvgPicture.asset(
  _welcomePageAssetName,
  semanticsLabel: 'Welcome Page Logo Up to Do',
);

const String _introStepOnePageImageAssetName =
    '${assetBaseName}intro_step_one_page_image.svg';
final Widget introStepOnePageImageSvg = SvgPicture.asset(
  _introStepOnePageImageAssetName,
  semanticsLabel: 'Intro Step One Page Image',
);

const String _introStepTwoPageImageAssetName =
    '${assetBaseName}intro_step_two_page_image.svg';
final Widget introStepTwoPageImageSvg = SvgPicture.asset(
  _introStepTwoPageImageAssetName,
  semanticsLabel: 'Intro Step Two Page Image',
);

const String _introStepThreePageImageAssetName =
    '${assetBaseName}intro_step_three_page_image.svg';
final Widget introStepThreePageImageSvg = SvgPicture.asset(
  _introStepThreePageImageAssetName,
  semanticsLabel: 'Intro Step Three Page Image',
);

const String _googleIconImageAssetName = '${assetBaseName}google_icon.svg';
final Widget googleIconImageSvg = SvgPicture.asset(
  _googleIconImageAssetName,
  semanticsLabel: 'Google Icon Image',
);

const String _appleIconImageAssetName = '${assetBaseName}apple_icon.svg';
final Widget appleIconImageSvg = SvgPicture.asset(
  _appleIconImageAssetName,
  semanticsLabel: 'Apple Icon Image',
);

const String _homePageAppBarCategoryImageAssetName =
    '${assetBaseName}home_page_app_bar_category_image.svg';
final Widget homePageAppBarCategoryImageSvg = SvgPicture.asset(
  _homePageAppBarCategoryImageAssetName,
  semanticsLabel: 'home page app bar category image',
  height: 24,
  width: 24,
);

const String _indexBodyEmptyNoticeImageAssetName =
    '${assetBaseName}index_body_empty_notice_image.svg';
final Widget indexBodyEmptyNoticeImageSvg = SvgPicture.asset(
  _indexBodyEmptyNoticeImageAssetName,
  semanticsLabel: 'index body empty notice image',
);
