import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/icon_constants.dart';
import 'package:rent_hub/core/constants/profile_page_constants/profile_page_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/features/authentication/view/widgets/profile_header_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/profile_option_tile_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/theme_switch_button.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(profilePageConstantsProvider);
    final themeSwitch = useState<bool>(false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.primary,
        actions: [
          ThemeSwitchButton(themeSwitch: themeSwitch),
          SizedBox(
            width: context.spaces.space_200,
          ),
        ],
      ),
      body: Column(
        children: [
          //top portion of profile page including user details
          ProfileHeaderWidget(
            name: 'Amal Raj',
            phone: '+91 *******345',
            child: Image.asset(
              ref.watch(iconConstantsProvider).icProfile,
            ), //profile image
          ),
          Padding(
            padding: EdgeInsets.all(context.spaces.space_200),
            child: Column(
              children: [
                ProfileOptionTile(
                  icon: Icons.assignment,
                  text: constants.txtMyAds,
                  onTap: () {},
                ),
                ProfileOptionTile(
                  icon: Icons.history,
                  text: constants.txtOrderHistory,
                  onTap: () {},
                ),
                ProfileOptionTile(
                  icon: Icons.bookmark_outline_sharp,
                  text: constants.txtDeal,
                  onTap: () {},
                ),
                ProfileOptionTile(
                  icon: Icons.settings,
                  text: constants.txtAccountSettings,
                  onTap: () {},
                ),
                ProfileOptionTile(
                  icon: Icons.help,
                  text: constants.txtHelpSupport,
                  subtitle: constants.txtsubHelp,
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

