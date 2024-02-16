import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(
          // text: "Notebooks",
          icon: Icon(
            Icons.collections_bookmark_outlined,
            semanticLabel: "Notebooks",
          ),
        ),
        Tab(
          // text: "All Note Cards",
          icon: Icon(
            Icons.my_library_books_outlined,
            semanticLabel: "All Note Cards",
          ),
        ),
        Tab(
          // text: "All Note Cards",
          icon: Icon(
            Icons.list_alt_rounded,
            semanticLabel: "To-Do Lists",
          ),
        ),
      ],
    );
  }
}
