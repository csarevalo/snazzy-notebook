import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'settings_controller.dart';

class SettingsView extends StatelessWidget {
  /// Displays the various settings that can be customized by the user.
  ///
  /// When a user changes a setting, the SettingsController is updated and
  /// Widgets that listen to the SettingsController are rebuilt.
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    // return Builder(builder: (context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        // leading: const CloseButton(),
        leading: SizedBox.expand(
          child: IconButton(
            iconSize: 30,
            onPressed: () => Navigator.pop(context),
            // icon: const Icon(Icons.arrow_downward_rounded),
            icon: const CloseButtonIcon(),
          ),
        ),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.settingsTitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Close'),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.topCenter,
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: DropdownButton<ThemeMode>(
          // Read the selected themeMode from the controller
          value: controller.themeMode,
          // Call the updateThemeMode method any time the user selects a theme.
          onChanged: controller.updateThemeMode,
          items: [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text(AppLocalizations.of(context)!.systemTheme),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text(AppLocalizations.of(context)!.lightTheme),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text(AppLocalizations.of(context)!.darkTheme),
            )
          ],
        ),
      ),
    );
    // });
  }
}
