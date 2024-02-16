import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../screens/tabs/all_notes_main.dart';
import '../../screens/tabs/notebooks_main.dart';
import '../../screens/tabs/task_list_main.dart';

class DesiredTabBarView extends StatelessWidget {
  const DesiredTabBarView({
    super.key,
  });

  static const routeName = '/Tabs';

  //TODO: add translations to all tab mains...
  // Examples:
  // - Text(AppLocalizations.of(context)!.appTitle),
  // - Text(AppLocalizations.of(context)!.helloWorld),

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        NotebooksScreen(),
        AllNotesScreen(),
        TaskListScreen(),
      ],
    );
  }
}
