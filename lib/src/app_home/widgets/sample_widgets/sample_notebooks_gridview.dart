import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/my_custom_scroll_behavior.dart';
import '/src/app_state/my_app_state.dart';

class SampleNotebooksGridview extends StatefulWidget {
  const SampleNotebooksGridview(
      {super.key, this.shrinkWrap = false, this.spacing = 35});
  final bool shrinkWrap;
  final double spacing;

  static const routeName = '/Sample Notebooks';

  @override
  State<SampleNotebooksGridview> createState() =>
      _SampleNotebooksGridviewState();
}

class _SampleNotebooksGridviewState extends State<SampleNotebooksGridview>
    with AutomaticKeepAliveClientMixin<SampleNotebooksGridview> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    double spacing = widget.spacing;

    SliverGridDelegateWithFixedCrossAxisCount gridDelegate =
        buildGridDelegate(context, spacing);

    var appState = context.watch<MyAppState>();
    var notebooks = appState.sampleNotebooksList(context);

    return ScrollConfiguration(
      behavior: MyCustomScrollBehavior(),
      child: GridView.builder(
        shrinkWrap: widget.shrinkWrap,
        padding: EdgeInsets.symmetric(
          vertical: spacing / 2,
          horizontal: spacing,
        ),
        gridDelegate: gridDelegate,
        itemCount: notebooks.length,
        itemBuilder: (_, int index) {
          return InkWell(
            borderRadius: ((notebooks[index]["background"])
                as Map)["borderRadius"] as BorderRadius,
            onTap: () {
              debugPrint("Tapped Container");
            },
            child: Ink(
              // width: 200,
              padding: const EdgeInsets.all(8),
              decoration: notebooks[index]["decoration"] as BoxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  notebooks[index]["title"] as Widget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  //==========================================================================
  //=========================== Create Grid Delegate =========================
  //==========================================================================
  SliverGridDelegateWithFixedCrossAxisCount buildGridDelegate(
      BuildContext context,
      [double spacing = 35]) {
    var gridSize = MediaQuery.of(context).size;
    const maxCrosAxisExtent = 200; //set desired max w

    int crossAxisCount = gridSize.width ~/ maxCrosAxisExtent;
    if (crossAxisCount <= 0) {
      // Min Journals in Grid row
      crossAxisCount = 1;
    } else if (crossAxisCount > 6) {
      // Max Journals in Grid row
      crossAxisCount = 6;
    }
    var gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount, //5,
      // maxCrossAxisExtent: 200, //set max w
      // mainAxisExtent: 200, //set max h or use aspectRatio
      childAspectRatio: 2 / 2.5, //w:h ratio
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
    );
    return gridDelegate;
  }

//DO NOT REMOVE
}
