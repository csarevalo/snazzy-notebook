import 'package:flutter/material.dart';

import '../../widgets/sample_widgets/sample_notebooks_gridview.dart';

class NotebooksScreen extends StatelessWidget {
  const NotebooksScreen({
    super.key,
  });

  static const routeName = '/Notebooks';

  final String _title = "Notebooks";

  //TODO: add translations for title, and more...
  // consider setting vars here then reference later for concise code

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
            icon: const Icon(Icons.add),
          ),
          const SizedBox(width: 8),
          IconButton.filledTonal(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: const SampleNotebooksGridview(),
    );
  }

//DO NOT REMOVE
}
