import 'package:flutter/material.dart';

import '../../widgets/sample_widgets/sample_all_notes_view.dart';

class AllNotesScreen extends StatelessWidget {
  const AllNotesScreen({
    super.key,
  });

  static const routeName = '/All Notes';

  final String _title = "All Notes";

  //TODO: add translations for title, and more...
  // consider setting vars here then reference later for concise code

  // Desired out come: ListView of...
  // - (Horizontal Scroll?) Notebooks,
  // - (Horizontal Scroll?) Tasks,
  // - (GridView) All Note Cards

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle appbarTitle = theme.textTheme.headlineSmall!;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0, //for const elev when scrolling
        centerTitle: true,
        title: Text(
          _title,
          style: appbarTitle,
        ),
        actions: [
          IconButton.filledTonal(
            onPressed: () {},
            icon: const Icon(Icons.star_border_rounded),
          ),
          const SizedBox(width: 8),
          IconButton.filledTonal(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: const SampleAllNotesView(),
    );
  }
}
