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

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

Future<String?> downloadImageAndSave(String? imageUrl) async {
  // Add your function code here!
  try {
    // Fetch the image from the URL
    final response = await http.get(Uri.parse(imageUrl!));

    if (response.statusCode == 200) {
      // Get the local path where you want to save the image
      final directory = await getApplicationDocumentsDirectory();
      final path =
          '${directory.path}/image_${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Save the image to the file system
      File file = File(path);
      await file.writeAsBytes(response.bodyBytes);

      // Return the file path
      return path;
    } else {
      throw Exception('Failed to download image');
    }
  } catch (e) {
    throw Exception('Error downloading image: $e');
  }
}
