import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  static var sampleNoteFormat = {
    "id": DateTime.timestamp(),
    "title": 'Note title',
    "content": 'Note content',
    "date created": DateTime.now(),
    "date modified": DateTime.now(),
  };

  //==========================================================================
  //========================= Sample Notebooks - List ========================
  //==========================================================================

  // get sampleNotebooksList => _sampleNotebooksList; //unnecessary getter
  List<Map<String, Object>> sampleNotebooksList(BuildContext context) {
    Color notebookColor = Theme.of(context).colorScheme.surfaceVariant;
    // Color? notebookColor = Colors.greenAccent[700];
    return List.generate(
      1000,
      (index) => {
        "id": index,
        "title": TextField(
          // style: titleStyle,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: "Notebook ${index + 1}",
          ),
        ),
        "decoration": BoxDecoration(
          color: notebookColor,
          borderRadius: BorderRadius.circular(12),
        ),
        "background": {
          "borderRadius": BorderRadius.circular(12),
        },
        "metadata": {
          "date_created": DateTime.now(), //should be ref
          "date_modified": DateTime.now(), //should be ref
        },
      },
    );
  }
}
