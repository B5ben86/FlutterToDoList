import 'package:flutter/material.dart';
import 'package:uptodo/pages/home_pages/profile_page_body/widgets/profile_info_list_header_widget.dart';
import 'package:uptodo/pages/home_pages/profile_page_body/widgets/profile_info_list_item_widget.dart';
import 'package:uptodo/pages/home_pages/profile_page_body/widgets/profile_page_top_banner_widget.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({super.key});

  @override
  State<ProfilePageBody> createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 24, right: 24),
      // width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfilePageTopBannerWidget(),
          const SizedBox(
            height: 16,
          ),
          _buildSettingsSection(),
          _buildAccountSection(),
          _buildUptodoSection(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildSettingsSection() {
    return Column(
      children: [
        const ProfileInfoListHeaderWidget(EProfileHeaderType.setting),
        ProfileInfoListItemWidget(EProfileItemType.appSetting, () {}),
      ],
    );
  }

  Widget _buildAccountSection() {
    return Column(
      children: [
        const ProfileInfoListHeaderWidget(EProfileHeaderType.account),
        ProfileInfoListItemWidget(EProfileItemType.changeAccountName, () {}),
        ProfileInfoListItemWidget(
            EProfileItemType.changeAccountPassword, () {}),
        ProfileInfoListItemWidget(EProfileItemType.changeAccountImage, () {}),
      ],
    );
  }

  Widget _buildUptodoSection() {
    return Column(
      children: [
        const ProfileInfoListHeaderWidget(EProfileHeaderType.uptodo),
        ProfileInfoListItemWidget(EProfileItemType.aboutUs, () {}),
        ProfileInfoListItemWidget(EProfileItemType.faq, () {}),
        ProfileInfoListItemWidget(EProfileItemType.help, () {}),
        ProfileInfoListItemWidget(EProfileItemType.support, () {}),
        ProfileInfoListItemWidget(EProfileItemType.logout, () {}),
      ],
    );
  }
}
