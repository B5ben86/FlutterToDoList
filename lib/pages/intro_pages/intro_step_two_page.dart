import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/pages/intro_pages/intro_last_page.dart';
import 'package:uptodo/pages/intro_pages/intro_step_three_page.dart';
import 'package:uptodo/pages/intro_pages/widgets/intro_step_page_app_bar_widget.dart';
import 'package:uptodo/pages/intro_pages/widgets/intro_step_page_bottom_bar_widget.dart';
import 'package:uptodo/pages/intro_pages/widgets/intro_step_page_image_widget.dart';
import 'package:uptodo/utility/tools/NavigateHandler.dart';

class IntroStepTwoPage extends StatefulWidget {
  const IntroStepTwoPage({super.key});

  @override
  State<IntroStepTwoPage> createState() => _IntroStepTwoPageState();
}

class _IntroStepTwoPageState extends State<IntroStepTwoPage> {
  Widget buildImage = const Padding(
    padding: EdgeInsets.only(top: 16),
    child: IntroStepPageImageWidget(EPageType.two),
  );

  Widget buildDescriptionTitle = Padding(
    padding: const EdgeInsets.only(top: 50.0),
    child: Text(
      S.current.intro_page_two_description_title,
      style: const TextStyle(color: Colors.white, fontSize: 32),
    ),
  );

  Widget buildDescriptionDetail = Padding(
    padding: const EdgeInsets.only(left: 38, right: 38, top: 42.0),
    child: Text(
      S.current.intro_page_two_description_detail,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IntroStepPageAppBar(() {
        NavigateHandler().push(context, const IntroLastPage());
      }),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildImage,
            buildDescriptionTitle,
            buildDescriptionDetail,
          ],
        ),
      ),
      bottomNavigationBar: IntroStepPageBottomBarWidget(
        (buttonType) {
          switch (buttonType) {
            case EButtonType.back:
              NavigateHandler().pop(context);
              //返回上一页
              break;
            case EButtonType.next:
              NavigateHandler().push(context, const IntroStepThreePage());
              break;
            //跳转到下一页

            default:
          }
        },
      ),
    );
  }
}
