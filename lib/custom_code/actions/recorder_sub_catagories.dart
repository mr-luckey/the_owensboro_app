// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future recorderSubCatagories(
  BuildContext context,
  List<SubCatagoriesRecord> displayedList,
  int oldIndex,
  int newIndex,
) async {
  // Add your function code here!
  if (oldIndex < newIndex) {
    newIndex -= 1;
  }

  // Remove the item from its original position
  final SubCatagoriesRecord item = displayedList.removeAt(oldIndex);

  // Insert the item into the new position
  displayedList.insert(newIndex, item);

  // Update each item's order field in Firestore
  for (int i = 0; i < displayedList.length; i++) {
    final docRef = displayedList[i].reference;

    await docRef.update({'order': i});
  }
}
