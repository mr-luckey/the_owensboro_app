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

Future updateCategoryOrderInFirestore(List<CatagoriesRecord> catagories) async {
  // Add your function code here!
  final batch = FirebaseFirestore.instance.batch();

  for (int i = 0; i < catagories.length; i++) {
    final docRef = catagories[i].reference;
    batch.update(docRef, {'order': i});
  }

  await batch.commit();
}
