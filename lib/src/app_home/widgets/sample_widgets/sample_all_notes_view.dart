import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../app_state/my_app_state.dart';
// import '../../services/my_custom_scroll_behavior.dart';
import 'sample_notebooks_horizontal_view.dart';
// import 'sample_notebooks_gridview.dart';

class SampleAllNotesView extends StatefulWidget {
  const SampleAllNotesView({super.key});

  static const routeName = '/Sample Notebooks';

  @override
  State<SampleAllNotesView> createState() => _SampleAllNotesViewState();
}

class _SampleAllNotesViewState extends State<SampleAllNotesView>
    with AutomaticKeepAliveClientMixin<SampleAllNotesView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // var appState = context.watch<MyAppState>();
    // var notebooks = appState.sampleNotebooksList(context);

    const double padding = 35;

    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingText(heading: "My Notebooks"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: SampleNotebooksHorizontalView(horPadding: 0),
            ),
            HeadingText(heading: "Tasks"),
            SizedBox(
              height: 200,
              width: 500,
              child: Placeholder(),
            ),
            HeadingText(heading: "All Notecards"),
            SizedBox.square(
              dimension: 500,
              // height: 500,
              // width: 500,
              child: Placeholder(),
            )
          ],
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

//DO NOT REMOVE
}

class HeadingText extends StatelessWidget {
  const HeadingText({
    super.key,
    required this.heading,
    this.horPadding = 35 * 1.5,
    this.verPadding = 0,
  });

  final String heading;
  final double horPadding;
  final double verPadding;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle headingStyle = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.onBackground,
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horPadding,
        vertical: verPadding,
      ),
      child: Text(
        heading,
        textAlign: TextAlign.center,
        style: headingStyle,
      ),
    );
  }
}
