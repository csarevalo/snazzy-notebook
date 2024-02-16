import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:my_crazy_notes_v0_1/src/settings/settings_controller.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({
    super.key,
    required this.controller,
  });

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      alignment: Alignment.topCenter,
      color: Theme.of(context).colorScheme.background, //Colors.amber,
      child: Column(
        children: [
          AppBar(
            // backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            centerTitle: true,
            title: const Text("Settings"),
            leading: const CloseButton(),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Close'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          DropdownButton<ThemeMode>(
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
        ],
      ),
    );
  }
}
