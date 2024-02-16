import 'package:flutter/material.dart';
import 'package:my_crazy_notes_v0_1/src/app_home/services/my_custom_scroll_behavior.dart';
import 'package:my_crazy_notes_v0_1/src/app_state/my_app_state.dart';
import 'package:provider/provider.dart';

class SampleNotebooksHorizontalView extends StatelessWidget {
  const SampleNotebooksHorizontalView(
      {super.key,
      this.spacing = 35,
      this.verPadding = 35 / 2,
      this.horPadding = 35});
  final double spacing;
  final double verPadding;
  final double horPadding;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var notebooks = appState.sampleNotebooksList(context);

    return Scrollbar(
      child: SizedBox(
        height: 300,
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: ListView.separated(
            primary: true,
            // controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              vertical: verPadding,
              horizontal: horPadding,
            ),
            // itemExtent: 200, //of scroll direction for Listview.builder
            itemCount: notebooks.length,
            itemBuilder: (_, int index) {
              return Container(
                padding: EdgeInsets.all(spacing / 2),
                width: 200,
                decoration: notebooks[index]["decoration"] as BoxDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    notebooks[index]["title"] as Widget,
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox.square(dimension: spacing);
            },
          ),
        ),
      ),
    );
  }
}
