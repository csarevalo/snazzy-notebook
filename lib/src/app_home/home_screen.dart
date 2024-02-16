import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_crazy_notes_v0_1/src/settings/settings_controller.dart';

// import '../settings/settings_menu.dart';
import '../settings/settings_view.dart';
import 'widgets/tab_widgets/desired_tab_bar_view.dart';
import 'widgets/tab_widgets/home_tab_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.settingsController,
  });

  static const routeName = '/';

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    int tabsCount = 3;
    return DefaultTabController(
      length: tabsCount,
      // animationDuration: const Duration(seconds: 2), //for testing purposes
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          centerTitle: true,
          title: Container(
            alignment: Alignment.center,
            width: 200,
            child: const HomeTabBar(),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox.expand(
                      child: SettingsView(
                        controller: settingsController,
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.settings_suggest_rounded),
            ),
            IconButton(
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
              icon: const Icon(Icons.settings),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: const DesiredTabBarView(),
      ),
    );
  }
}
