import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? fileToImage(FFUploadedFile? imageFile) {
  if (imageFile == null) return null;
  return 'path/to/image/${imageFile.name}'; // Assuming FFUploadedFile has a 'name' property
}

String calculateAverage(List<double> ratings) {
  if (ratings.isEmpty) {
    return "0.0/5"; // Agar list khaali hai to 0 return karo
  }

  double total = ratings.reduce((a, b) => a + b); // Ratings ko add karna
  double average = total / ratings.length; // Average calculate karna

  // Round to one decimal place
  average = double.parse(average.toStringAsFixed(1));

  // Ensure average does not exceed 5
  if (average > 5.0) {
    average = 5.0;
  }

  // Return the average in the format of x/5
  return "$average/5";
}

String getString(String? inputStr) {
  if (inputStr == null) {
    return "Input is null";
  } else if (inputStr.isEmpty) {
    return "Input is an empty string";
  } else {
    return inputStr;
  }
}
