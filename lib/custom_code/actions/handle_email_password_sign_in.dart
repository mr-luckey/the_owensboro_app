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

import 'package:firebase_auth/firebase_auth.dart';

Future handleEmailPasswordSignIn(
  BuildContext context,
  String email,
  String? password,
) async {
  // Add your function code here!
  try {
    // ✅ Attempt to sign in
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password ?? '',
    );

    // ✅ Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login successful!'),
        backgroundColor: Colors.green,
      ),
    );

    // TODO: You can trigger a navigation here if needed:
    // Navigator.pushReplacementNamed(context, '/home');
  } on FirebaseAuthException catch (e) {
    // ❌ Firebase-specific errors
    String errorMessage;

    switch (e.code) {
      case 'invalid-email':
        errorMessage = 'Please enter a valid email address.';
        break;
      case 'user-disabled':
        errorMessage = 'This user account has been disabled.';
        break;
      case 'user-not-found':
        errorMessage = 'No account found with this email.';
        break;
      case 'wrong-password':
        errorMessage = 'Incorrect password. Please try again.';
        break;
      case 'too-many-requests':
        errorMessage = 'Too many attempts. Please try again later.';
        break;
      case 'operation-not-allowed':
        errorMessage = 'Email/password sign-in is not enabled.';
        break;
      default:
        errorMessage = 'Login failed. Please try again.';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ),
    );
  } catch (e) {
    // 🔴 Fallback for unknown errors
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Something went wrong. Please try again.'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
